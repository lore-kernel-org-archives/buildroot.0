Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D1ECD37AC
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 10:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23E898433C;
	Mon, 11 May 2026 10:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usBy7SRTr9A3; Mon, 11 May 2026 10:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47BE1842FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778493624;
	bh=Tw32FRs8JypuPQoaSTD79IAhIsJWo+Lu3yQTLmJ/Wec=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pvElJFnIVKHAh+OzI3Gtj5Kkc99cJCPhPmYXkpnc9mlxpZPk8UWVaxNKsYpj5fOZY
	 fb1NBN0dbOYZa0xqWM0YMvQ+uFbcItj72oSxzdFpFdY6FqS+MOxKSBNMo/6zp5iKk6
	 Qe8PZksUmxy7+zuIsSt0AyKC6OuI0G+WGcS4jJrzs+Yb3KH1ogkMLHOnpMywA8aPun
	 8N7ZiAqJgdZEnHP7ndbgZJThVLxEa8JbIg37q4q7JWgpBYpRHQr/bhO7ySbYz93itx
	 bMJgzXMQOkfDwubovltoV9P7rZetGwdYs7crTnvr6Kycqene4oofBCRhibL+UcxiBG
	 PESAJKYgFzaQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47BE1842FC;
	Mon, 11 May 2026 10:00:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7EBD223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E26684304
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-5omm8uMaBu for <buildroot@buildroot.org>;
 Mon, 11 May 2026 10:00:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7759D842FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7759D842FC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7759D842FC
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:00:22 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1056627927; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 May 2026 10:00:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wMNQn-00000009CPO-1uRh;
 Mon, 11 May 2026 12:00:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260511053836.208037-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 11 May 2026 07:38:36 +0200")
References: <20260511053836.208037-1-bernd@kuhls.net>
Date: Mon, 11 May 2026 12:00:09 +0200
Message-ID: <87cxz2p8pi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EhXZpe39VDn7FR5+ijZF6SSpt+YCUuUklXh8w4XQFkJmF7JzPN5I2vkC0FSDpmcB/t53WQSI/2ozHFpjCU0En6uTCOpq1X5utH9yItnjX7e+LcMVkaaI+uPVb3dvO8ZEC1tdypwqoMUanammHdgK3s/RMWljYe0bbMdOFir2D4NW1z/PQW0OOZC1uXEST053Udo3ihA14xO7/Gd6dqMQPGZQGtncUl8tR1ClXk1lptWnHpjWTR1L0d31EzIyuU9jz1S2DgpuxRs4ZGRNJLQhELQ8rJcB6wS4LypIYt7qZmgBGle5pzbqk/VYekVpmTHUfglmwTaiwxsdg+xM1z9hlw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=1SrCr7RqbyyI+7iCK7WOGJwz31Xm4anRgXPtcbrUM9c=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=EhXZpe39
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: bump version to
 2026.91
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

 > https://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2026q2/002398.html
 > This bump includes
 > "- scp: Fix regression in 2026.90 building on older glibc or other libc.
 >   reallocarray() was required, it is no longer needed."

 > and fixes a build error introduced by buildroot commit
 > 5b136c89ffed35c30dff1802924a4dcf9bdab798.

 > Fixes:
 > https://autobuild.buildroot.net/results/637/6372e58671d3719b127dcb69642420a07f441790/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
