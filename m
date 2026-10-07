Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06D0CA6009
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 22:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FAF16085A;
	Wed,  7 Oct 2026 22:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AknhVckYzj3P; Wed,  7 Oct 2026 22:16:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9814A60B3F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791411416;
	b=iW2n4UgvvOJLGFFfozjLfQzHAa0oQSkbZ12fjopEnJKWB+n+1Mi1xz2vbOiqYkaKHFCe
	 Mj2Q8v+rR/E4FAIGw6if0rSmAyYbtxsEm+pZ4xrrTxUcDAHLiZlk4HEl958dTmiVZTUop
	 RsRAwvwNxfXh+9pTrIcV+miPVez++op9yqkhV9ZBP6eKX/tjrWfXI6OhzJ2ZWORecDN8h
	 imqXDCjD/u08j1HMQc46cK0TSlOnd1BmbMk2pOyURtuXZJCEjdxUfceNKbKv4K3bSDQOB
	 yu1uAhJ86SIsQaPEz4NfTK2Vg7eL+Vuaw/CDDPT9ndmumhmtQhPDRwaunzPMZlA8bvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791411416;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NfHFeN+flOwpLbzI/cx09bJnheOWCUVCCqhTdh5dq5A=;
	b=lg/augRw30Hf5I+M6uWMfABTadqtXDevJtsAJ2ENywVy7JafVPeBwOotNUDdKV5jtdHs
	 F4KRG7qJsFR/QU5XI7+iHLHNieqJw1n1xSc1kcluK7l+WzjJWrAbwp0N1MljEv6Wm7vES
	 iC5JfGFZEYc7evfrgbOGKBRFKagUNL9UC7tMH0NkApZ7b00wIKebbCETvMAx01g3afuN0
	 cMAyCarNExXr35Cn9EEmnecS5asKdR1wax2hux7hn1N9vxyLppKBza7Z4nc0ZaO80szep
	 VB9OHHXKaWJ2SY11svjI52MNZlDxFJX88Fb4fAtYMaJ0f8vs2NWR4+EEfGvjH5GGB9A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791411416;
	bh=NfHFeN+flOwpLbzI/cx09bJnheOWCUVCCqhTdh5dq5A=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UTb2/5hr6CmHjvf7H0BHSVwqoGgqlH71Y1u7SescjK8LpAV0NgltPpcJDjRy0CBrH
	 Ui+aGfntPXFPwnjGRBnGu2YydEcYS7dMftx+gPm6wWskK7fYZkXk/VFZoapNLRwRuV
	 pjhDbSIyToWGFOWWfh/X5vL3jlQbBMEldsukg2GCJ17GPh2h6jJ2dTO6zSzqR4pdip
	 N1e5YwCex22l83kA7w3auoQ2qIxqxshV5HOyXe82MLMiwJqM9i9fouxLNKV4VWcOMP
	 6Gk4Sffw0+OZHu9TtcEtwI2rrgawyQaA65PeuPxpNXfcncygAUMIPuKyhCiDIBx2DG
	 piR+Sz77OtzYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9814A60B3F;
	Wed,  7 Oct 2026 22:16:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7B8B75
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 22:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4DE940A76
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 22:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCs0KfxuDpdT for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 22:10:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 80F9140A73
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791411043;
 b=LkJ7PBOSV+uNnUsnqsGiQ+LiAtb+RPehdZLwwRAS4z8pJ5qX4VSEeN4uWXDy8J8hS0Dy
 4XP04ZYQQrMIRRnffmvAVZfN8UvvJkZPAO7hKTvYP3U9Tp/aWdwoVthJtK591IJ6qTmTG
 aiBGSIla/6BOUBpARh+DAe19EGjkPcUz/snjwMH2V7L+9QnQlHhY+2J96MP0PxSMjMC2y
 9Z0WpzNlNuU7xLJi61qrE4b269jVG/R2c60IqYg0fiCektBGiP+LWx/MPCsQcTuyCG1ZQ
 AnS4umNreLhKRZftFu7YlQjSZESKIF+svD05V+01Ko63qIooVIg8Img+HDl8FLaZdkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791411043;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=5GyYGxFaiMCUnd2m/cSYcKhVgE/LSeVVYkwntdsvQZ4=;
 b=ZOCvHl6QeikgSgQ6PlQEeCFZ7VHLo/08L+QIRpiJWqsBz2PVRnUP+r8/IjgT4a4ZEUSV
 0x3tHKdtKWy4ruD4WmUE/Mhh76LggKkKlHVmGKlq7vfn6LzuHxGRqPZbI+7xMJa/th1cW
 mJrahu0SMxM9ORqtcP8Ry5p47sWmBhxF0dqQ3ItPh1EcJb0zwpgK5kWzyR1ub2LDxByOc
 +jIYXMSmcEZ9xlRQgu3k++oZO5L/qEae1zkNIHw1+t59/xBkxyPD/K9ulyfQ6hX7VihZi
 l0seR/pzr4gq63plGFA45lXhUVim7cqojQGl90jbLDZonaPZe5HZyYa7h683FxoEJ0A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=JBtW9+BV; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=JBtW9+BV
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80F9140A73
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 22:10:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=JBtW9+BVDUKHd3wtzceU3QkQo1/iG92SMGXCWorruYIK8jW8YZPPsojJGntQwCQybefgkBhIuNIcGqZrBKj9WX8LBzCT4Wv233ABB5ynAdP+HR7g3mGUd0p/Coutyp/UHDiGEuF3Eck5PyZ3+5YgOY5jkjIdkJo9CJsSmgE42Q+41f64DIsE/iu2KKOaiolMKv4w372j4EfZHFazMUMaY60gdCQcmoVkVegIcEreMMungjOFNvcS2hWBMYAAdQyg4zFIPLWrT82h5Xo9iQsXiy3UMZoafZQqysfrzV8P2j7a3Fz2sk7wequbad9OHZ86szCWaLtiSuE++DTH5MiMmQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=K7wUJGk9jjvIX35bpJ4mk9R5yGiGAtTD60EMmPr0DLQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -809219290; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 22:10:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xEZqL-0000000FDrd-45zF;
 Thu, 08 Oct 2026 00:10:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261007201836.1696051-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 7 Oct 2026 22:18:36 +0200")
References: <20261007201836.1696051-1-bernd@kuhls.net>
Date: Thu, 08 Oct 2026 00:10:33 +0200
Message-ID: <871pa19n6u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: security bump version
 to 2.7.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://github.com/OpenVPN/openvpn/blob/v2.7.8/Changes.rst
 > Fixes CVE-2026-84790 & CVE-2026-88964.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
