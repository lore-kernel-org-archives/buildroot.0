Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAC3C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 21:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C093E40BAF;
	Sat, 25 Feb 2023 21:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C093E40BAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jV9I5LdbFE8p; Sat, 25 Feb 2023 21:03:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFE5540BA3;
	Sat, 25 Feb 2023 21:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFE5540BA3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 505CE1BF3EE
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B69581385
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B69581385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLDWOHWx4HR9 for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 21:02:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3DBE81284
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3DBE81284
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 21:02:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C124A240002;
 Sat, 25 Feb 2023 21:02:55 +0000 (UTC)
Date: Sat, 25 Feb 2023 22:02:54 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225220254.69e933f2@windsurf>
In-Reply-To: <20230225172806.9444-1-fontaine.fabrice@gmail.com>
References: <20230225172806.9444-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677358976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iJrxNC3HXrpXgf+VLFQf8uXxsCjiuPwEQpi1ZdavKqg=;
 b=j8yFtb7PI4aioD6Idns1YiR97bi8wZRys6QVaWr1468qpRi5MNo1nC09fWjedQFDkEV6df
 /Us1gCS3iv1CXn9MKQfOxuWkFRxxXJchKn8zfreoOY6cUEQnA6M6r5539NM3evJD3zcOz6
 pSQM+4FOG+2VDesvOivLRpg5vNduOlvIh25hfmDh19ZasUiqnCoK2ADT73BuFpayHWoipx
 YMiR/d+ebT7A40QmMtNsbTTbcMn3MXGV77qQNmArRED5g59zMSCTu6enq7wSBGG3jfK5xp
 R//i+YsFk7pye/net4L6wNwh1WTWhPT0HgQycR1sVZGemrRc/zQgbbCQBPiabQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j8yFtb7P
Subject: Re: [Buildroot] [PATCH 1/1] package/pistache: fix libressl build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 25 Feb 2023 18:28:06 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following libressl build failure which is probably raised since
> the addition of the package in commit
> 65d891efc2fb069f9cf707f47302776f7076b80c:
> 
> ../src/server/listener.cc: In member function 'void Pistache::Tcp::Listener::setupSSLAuth(const std::string&, const std::string&, int (*)(int, void*))':
> ../src/server/listener.cc:582:29: error: 'SSL_verify_cb' was not declared in this scope; did you mean 'RSA_verify'?
>   582 |                            (SSL_verify_cb)cb
>       |                             ^~~~~~~~~~~~~
>       |                             RSA_verify
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/066fc078980e5216f38411eee455088e15fa1101
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...erver-listener.cc-fix-libressl-build.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch

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
