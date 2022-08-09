Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D9EC25B07
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 13:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BE40410D0;
	Tue,  9 Aug 2022 13:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BE40410D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NEr5_igg8jhI; Tue,  9 Aug 2022 13:54:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39613410B0;
	Tue,  9 Aug 2022 13:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39613410B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECC5A1BF267
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 13:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1100408F1
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 13:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1100408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhA9nY-4gd1e for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 13:54:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06AF840895
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06AF840895
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 13:54:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5B5E7240008;
 Tue,  9 Aug 2022 13:54:27 +0000 (UTC)
Date: Tue, 9 Aug 2022 15:54:26 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220809155426.7d950e64@windsurf>
In-Reply-To: <CAPi7W831MWDk=uBqFzebZ9FmsZiVNxDfDfNMYfa5rqW6cgxOuA@mail.gmail.com>
References: <20220808215404.1804219-1-fontaine.fabrice@gmail.com>
 <20220809133932.721b8cd8@windsurf>
 <CAPi7W831MWDk=uBqFzebZ9FmsZiVNxDfDfNMYfa5rqW6cgxOuA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660053268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qb+lxb17dJNRMbfowSNkLKYtpzqKs+dCOWL4b9vTTr0=;
 b=GuOfbvClbnYIa4sx6a2R5Dusr6LqNt0fL/WhYWAPREHQ56kR/MfaQ1S1yPshAkazQ4Mmmt
 KaO6lr8LHiW+LYNA9hvWQ6Ngf8RpzmFtfzLFyxKbcnPJKPT4Il+eh1XvlPg/+0H5YsqhT7
 25ricBJHJxkejBYog781LXBDW3evH86U+1yOGpKbqoUQIW++zLBMYmzsUrzX1jICLfnNqo
 gT/zGPDR8h+xQW+/ILhR5yyUUHKNyIRi9h6i8Hz98U4eFVM5tGrTL//yM7YLYuwxeEjZ8q
 tDwXG0DXdXD1SgTLlbpwWZEgHc6xpVcKv6xvfhN+5K967Wf0CJwP7A844+Hprg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GuOfbvCl
Subject: Re: [Buildroot] [PATCH 1/1] package/xenomai: always set default
 version
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 9 Aug 2022 14:12:53 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> >  - Not have any default value for BR2_PACKAGE_XENOMAI_VERSION
> >  
> 
> This will not be really consistent with other packages.
> arm-trusted-firmware, barebox, optee-os, opensbi and uboot all have default
> values for
> BR2_TARGET_{ARM_TRUSTED_FIRMWARE,BAREBOX,OPENSBI,OPTEE_OS,UBOOT}_VERSION

Well, not really for Git/Mercurial/SVN:

config BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
        string "Custom repository version"
        help
          Revision to use in the typical format used by
          Git/Mercurial/Subversion E.G. a sha id, a tag, branch, ..

So no default version.

And:

config BR2_TARGET_UBOOT_VERSION
        string
        default "2022.04"       if BR2_TARGET_UBOOT_LATEST_VERSION
        default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
                if BR2_TARGET_UBOOT_CUSTOM_VERSION
        default "custom"        if BR2_TARGET_UBOOT_CUSTOM_TARBALL
        default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
                if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || BR2_TARGET_UBOOT_CUSTOM_SVN

which only means that BR2_TARGET_BOOT_VERSION is automatically set to
BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION when Git/Mercurial/SVN is used.

I wouldn't call that having a default version :-)

I think we should use the same pattern everywhere.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
