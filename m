Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57360606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gV9r9Gaq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=g8WwGjIw
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2110960608;
	Sun, 25 Oct 2026 17:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RjPL1xM0jeGH; Sun, 25 Oct 2026 17:01:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 58B5F605F9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792947715;
	b=bKYwzMh2bqmrXEusCzSivZ4vPHi3HObjcw0tPT4sVfdWw7n63gUHGUHEgptbTS9/+O8f
	 UwKp0pnC7KCQRDIRgKl9/hVpdU/FZNOUJSjd0qHBpuc7Va8cO7F0itMZNHTGassJyyiaW
	 hX0YsvTr7tLASo3hjiW4tHp65xRBExrLjNUwQAmcUvCmMKdezQFs2FQW/QKYEncN0eKI1
	 QRauVpw5QCylyi+XQcwZ6bn0tWnkLNU7y4uJoRxjJf+SHoZ13R9SgZHiX3qYJfrS/Ai1G
	 x3Z0u4FanzGe3wpBkkGimeg64szOnwBEAno2V55siktl8ZIEluMH6E+82R/Uwtcsk+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792947715;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yJ9BY4WfB5qqccO8ZiwIBpaqS2qmL7ZFy1Lc4weL0GM=;
	b=tZBEw59O1ySy3xLc1Z82dRevuCFi2Xk9pz0qJrg1GyrcxuzBAjvVhSLzVH63+eog5/oB
	 adNIwOLSaWmT9My6hCXxLyuGH2EZxieyFQnY6HV20+WB3Gc1LSyopA8u43+vkpTpmWiAs
	 SFWrQq8DACVW9f/hbufPjkGibJln/JM5WpOYRsgPG8a/6Uy6t0KfzW+aVZnVaeJVIUHw6
	 Fjeez46QLwWIxnvTr1EBBy67MECtG5l6001SOqvXDgp+fCJ5hmZpr60QP7Q6X+Kel1Mlm
	 ZajPO39EQ64JFH1sOI+/B6G1GPwMzGCAiJPNh3RYJgj+UPymzL7kHAhhig+vxlrDhhA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=g8WwGjIw;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792947715;
	bh=yJ9BY4WfB5qqccO8ZiwIBpaqS2qmL7ZFy1Lc4weL0GM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gV9r9GaqUecPq7YUR+aI4XK17Dnq7bMXVYxJf0i+m0mm/V9Zt1gwULTeIamTm94Bt
	 Z8aqC0ieJI1KrwJ1qayE/XYUsIFRUIyuVjKyULvHhoJWy9hk4p+s2y5hxxrUhOleuL
	 G1zZIv/wtP5Upk79Bs2LYpZRsz0Cp1pLjaDFtYBquab2MWHRHI8NthuNVw+rkB3BG/
	 XHlpbXlefJBJqfT63lYjAmQ2dmGKCeBTK858ibXOjXctWvMi300ShihLwBz5YrQI9I
	 09CAnLc+9pnZNZOG6wWzQkP/3k/TTEivRt4wsbaqkJt0E/YOrQHdhiisy/MNSjyn0n
	 1V5G4VOgAOsYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58B5F605F9;
	Sun, 25 Oct 2026 17:01:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85354380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ADCF605F9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Auu0Wwy-qRzr for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:01:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4087F605DA
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792947712;
 b=CykQ6iCa6ik1uAU0uSPhIOniAH2rImEXPz9EUAdroOgmuftyvvrrXtoTsevU5jKad+rD
 sKNm+f4hzmFcBwkdsvAjb2IGfitaWhZlaP0g+wDnjj3KlpEtW1gDG+JCHaZj7zbACB7zo
 lLFdtNkz/B6yow7ElGNz3k0kmaiHNDrV9jkU/Hl4zUXldJv/xmxc6aPfttiAnfhbUTHPc
 GUEJrdSVRxWPh43H1tQ9MR8hLL129J9H49R24HSFyKlDiGFbFddIa4TmdZPBwY4RXTrzW
 EDVKssmYhGJwH5m4KAm0/Upxj3lCMdbPrHd2vDNtijTQQbjoL0ifgXxHYxtYawPEixQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792947712;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=dJRvzLzerLH06khDc+t93uBdTnLcryBOS7m9At82o88=;
 b=tG85I3Av9dutbUZNAHVLkMZ42qXylCOx5N/AcVs4oyfpFFO0S/thNGLDcZmy/ErSIq2Z
 lqRDxt+W9txabA2r5DZ7hP6D6C5wxMqu/Jncns7YTAzKnzcNTCFY1v8FRsWkY7LBskfe6
 XGTV1uItd4Q6vRCqjmhgJJPsVj8IpZz+bSvBF29sXUyCK7XiH1JLd/Z2AtdvnYQiX19Gq
 +2YRvI6lZmhuneG39NV0gR44UMQC0e8CWAx7kzP7wK+8klW2+a//azFJAhYC4aZt6B3Dy
 ghlosSl8JvmuJ0bnLM4rtcR8EQzeoMQsm25d/VHT8gg2zqN3hOunDCRhoZ4/zO+wjYw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=g8WwGjIw; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=g8WwGjIw
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4087F605DA
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:01:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=g8WwGjIwzULieQpRhZZcN23igVy/aqWRudpD6NIxlK7cb6EQJ+949cDdTKb2OL3K+k2eCx2z1caf46VNzq7h07tSzdNey8RRb3r725BzuumpDEvdtS87lC8dmKmhxmv0DzrvEpKZEEbtjt+QGu9U6j22xH5KfA0PQm01z2e1gMAnb/RfXjVPj/t51KdCxHkxJllnCrhzbXOn4S7yrnY9jkTxDL+SvbosQiov0ezT8dG9YRxjlxe/8wnRBu7h/Qc0AOLCNv8M7FQ1aWOb4VZ+c2y2gPOj+Y1BnSzgMVHdz1g0apMWV+Bd96WLLOOcgHiDJgmiyGuUqFngLnlx4NTaDg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=C7Wu7F3GYOHTEcfcq+8bb4kTWZAlOJXBVRkZZiGR5jQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 4902824;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 25 Oct 2026 17:01:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xL1bM-00000007Ylz-3AoK;
 Sun, 25 Oct 2026 18:01:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261025162707.1770889-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 25 Oct 2026 17:27:07 +0100")
References: <20261025162707.1770889-1-bernd@kuhls.net>
Date: Sun, 25 Oct 2026 18:01:44 +0100
Message-ID: <87pkwxu32f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libuv: bump version to 1.53.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://github.com/libuv/libuv/blob/v1.53.0/ChangeLog
 > https://github.com/libuv/libuv/releases/tag/v1.53.0

 > There's no newer release of uvw, and the current version of uvw
 > continues to build with libuv 1.53.0.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
