Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E6DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 08:24:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F6D560ED5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 08:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F6D560ED5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19E6F402AF;
	Sun,  7 Nov 2021 08:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8rBIoxe1nf8G; Sun,  7 Nov 2021 08:24:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BD2A40278;
	Sun,  7 Nov 2021 08:24:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CF641BF3A8
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 08:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CD7681021
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 08:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=protonmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gGClD0cHiJxU for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 08:24:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6020F80F87
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 08:24:03 +0000 (UTC)
Date: Sun, 07 Nov 2021 08:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1636273439;
 bh=BI4BCHWCs/W8IJmGzwvr87zc5zZ/3LUL4VKOKmpgJiE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=fFgaPa5tWTfnVw6zdqaAtbJVfp2xz4dDP2NzEF0kfOKqBIfNz+s5Yvr5inIApzEY4
 IQ/55PO6wEagmfg6n7pGwxzqgm/oTwcALNjdaEqeSbBdnUd7Yxtz8JyRray1VGItOb
 vgfMhLk8SWA+yC1JBnsSy+uo04tPn2FlZ+CxQGN8=
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Qs6R_WPcdzQYxiuaKKqCPYFexHLCdzqvvlXfNod0zUoM88_pU_yyMOUDJUBHqDLr1X2eMNK7CmklBaNN6hApS69yS5BrK5I6rKur4Wc1YhM=@protonmail.com>
In-Reply-To: <20211104225339.67a47317@windsurf>
References: <RnUd7kxUKLWeLZSMoM1dFtpAD4Qfe3R-67gu27eAGtE6yrgC1oHzq1GwiOoE9Gmk6uZZ-c6k6LUVxdMqKhUro4_bM4zZKPhsbN5e9BV8SV4=@protonmail.com>
 <20211104225339.67a47317@windsurf>
MIME-Version: 1.0
Subject: Re: [Buildroot] package/tpm2-tss: bump version to 3.1.0
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
From: Yair Ben-Avraham via buildroot <buildroot@buildroot.org>
Reply-To: Yair Ben-Avraham <yairba@protonmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thursday, November 4th, 2021 at 10:53 PM, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello Yair,
> I'm getting back to this patch that you contributed about a month ago,
> because since this version bump we are getting zillions of failures in
> the build of tpm2-tss:
> http://autobuild.buildroot.net/?reason=tpm2-tss%
> They are caused by the lack of setfacl on the host. Fabrice Fontaine
> cooked a patch to add host-acl to the dependencies of tpm2-tss, but as
> I replied to his patch, this isn't a suitable solution as setfacl will
> clearly not working in a Buildroot context where the build runs as
> non-root. It seems like the entire installation logic of tpm2-tss got
> broken for cross-compilation scenarios. See the discussion with Fabrice
> at:
> https://patchwork.ozlabs.org/project/buildroot/patch/20211013065446.1857356-1-fontaine.fabrice@gmail.com/
> Could you have a look into this ?
> Thanks a lot,
> Thomas
>
> On Tue, 05 Oct 2021 05:20:16 +0000
> Yair Ben-Avraham via buildroot buildroot@buildroot.org wrote:
> > Signed-off-by: Yair Ben-Avraham yairba@protonmail.com
> > -----------------------------------------------------
> > package/tpm2-tss/tpm2-tss.hash | 2 +-
> > package/tpm2-tss/tpm2-tss.mk | 2 +-
> > 2 files changed, 2 insertions(+), 2 deletions(-)
> > diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
> > index 6856fd4fde..b6eb3c1f97 100644
> > --- a/package/tpm2-tss/tpm2-tss.hash
> > +++ b/package/tpm2-tss/tpm2-tss.hash
> > @@ -1,3 +1,3 @@
> > Locally computed:
> > =================
> > -sha256 78392be7309baf47f51b122f566ac915fd4d1760ea78571cba2e1484f9b5be17 tpm2-tss-3.0.3.tar.gz
> > +sha256 8900a6603f74310b749b65f23c3461cde6e2a23a5f61058b21004c25f9cf19e8 tpm2-tss-3.1.0.tar.gz
> > sha256 18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448 LICENSE
> > diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
> > index 9ffbef2f07..8e701933c4 100644
> > --- a/package/tpm2-tss/tpm2-tss.mk
> > +++ b/package/tpm2-tss/tpm2-tss.mk
> > @@ -4,7 +4,7 @@
> > ################################################################################
> > -TPM2_TSS_VERSION = 3.0.3
> > +TPM2_TSS_VERSION = 3.1.0
> > TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
> > TPM2_TSS_LICENSE = BSD-2-Clause
> > TPM2_TSS_LICENSE_FILES = LICENSE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
> > 2.30.2
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> --
>
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Dear Thomas,

Sorry for not tracking the builds results. Of course I will have a look into it.

I will start with taking the approach of forcing ac_cv_prog_* as in:
./package/tpm2-pkcs11/tpm2-pkcs11.mk
http://patchwork.ozlabs.org/project/buildroot/patch/20211106154525.910204-1-yann.morin.1998@free.fr/

And/or taking the approach as in:
./package/tpm2-abrmd/tpm2-abrmd.mk

Yair Ben-Avraham
yairba@protonmail.com
+31.6.1316.5535
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
