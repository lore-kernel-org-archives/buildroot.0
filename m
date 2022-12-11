Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1140FC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 398884038C;
	Sun, 11 Dec 2022 13:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 398884038C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D5uHiUvSshU4; Sun, 11 Dec 2022 13:10:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3FB0401BF;
	Sun, 11 Dec 2022 13:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3FB0401BF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 385AE1BF2BD
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1351560B8A
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1351560B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7P_KjvqFtSFB for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:09:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC16A60B06
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC16A60B06
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:09:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C1FBFFF805;
 Sun, 11 Dec 2022 13:09:37 +0000 (UTC)
Date: Sun, 11 Dec 2022 14:09:36 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221211140936.33eb29b8@windsurf>
In-Reply-To: <20221210131314.5634-1-fontaine.fabrice@gmail.com>
References: <20221210131314.5634-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670764178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2orTnG58vpYkYuXVKd/AEFYl0jbexF6b10lM8mADD8o=;
 b=KnjOzJb1fRN3AuMKDHzxcdYIOElEOtPFP78J7rdtj1zqqskLIiyGQRBOC6hzI0SwGg0LeJ
 rtWVNJhfrn8UfMw6ca5dpr41uc89Vky/U/ZBTTvf70UssE1C5LH5gIgZB1J0hQY9Ol/IWO
 mYcUaBmzfjD3H9StfRez4Lc90azw56kFb7tPues+DJ45T31doX2SF6Imp24aBUZ/bOB0O+
 qToc68EIhPxjRpefeni7QTtNsRWyQuOWc+2swRzPt3M95ktDUW6/1XBCmgPjSlZ+X5uxUs
 L/q0ALI52UAvdJvZkV5xzLd9tYIYlAnbbmJTRUELElPWqx82S3yRWQxDa51iuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KnjOzJb1
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: disable with
 libressl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 10 Dec 2022 14:13:14 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Building with libressl results in the following build failure since the
> addition of the package in commit
> 736c4c1655d93652a9a7e79235bbe726b3d46176:
> 
> src/modules/rlm_eap/types/rlm_eap_fast/rlm_eap_fast.c: In function '_session_secret':
> src/modules/rlm_eap/types/rlm_eap_fast/rlm_eap_fast.c:228:47: error: invalid use of incomplete typedef 'SSL' {aka 'struct ssl_st'}
>   228 |         eap_fast_session_ticket(tls_session, s->s3->client_random, s->s3->server_random, secret, secret_len);
>       |                                               ^~
> 
> Disable building with libressl following upstream feedback:
> https://github.com/FreeRADIUS/freeradius-server/pull/4689
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c8df444f4c39f83e254dbb642a5852a1c956f7bb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/freeradius-server/freeradius-server.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
