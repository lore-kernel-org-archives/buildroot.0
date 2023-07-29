Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C2DC04A6A
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 07:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD2C7402C3;
	Sat, 29 Jul 2023 07:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD2C7402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nCYGEknHRZVl; Sat, 29 Jul 2023 07:50:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 011C540150;
	Sat, 29 Jul 2023 07:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 011C540150
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 837C01BF3D8
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 07:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6968460BC0
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 07:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6968460BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2rPdFXzE5V3O for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 07:49:57 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C875A60B8F
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 07:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C875A60B8F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95674240003;
 Sat, 29 Jul 2023 07:49:53 +0000 (UTC)
Date: Sat, 29 Jul 2023 09:49:52 +0200
To: Colin Foster <colin.foster@in-advantage.com>
Message-ID: <20230729094952.11722d87@windsurf>
In-Reply-To: <20230728231839.4193379-1-colin.foster@in-advantage.com>
References: <20230728231839.4193379-1-colin.foster@in-advantage.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690616993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lCJMGfN0d8SD/mhPCFgdIrrvFNYhbbYur99iQZ55tMg=;
 b=Z1porTAHAFCXPh3h5bUQbzPlKk11Zbu/DIbSGq3b9ShSHRCEl4gobAJ018GAmCV1+nY9uW
 X8MWozGjl4mFnV1z+RTF48H5BaYXttWY1uKz7P2jA1+p/rxMJ5LIF7o2uXXE/e+Acok/4j
 YJeLaatT7NwGo3QW9J2MtDBWX4oYF6KH+9sAJx576LqECqEp2Cmx617YZ+yYSoAhQvIi80
 jlgmo0fmznMYA+WlMfOgaAgZ+d7VrvByPyGxnuDAqObXH3StI7y6SJmywZeV2FYLENgryQ
 AQLMg/movbtXTLttaFtVMg9H7QbJlCDxQDZqmkniISdOhamnr6a7ppmWhOSUzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z1porTAH
Subject: Re: [Buildroot] [PATCH V1] core: add kconfig option to archive an
 un-stripped filesystem
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

Hello Colin,

On Fri, 28 Jul 2023 16:18:39 -0700
Colin Foster <colin.foster@in-advantage.com> wrote:

> It is reasonable to expect that deployed systems don't contain debugging
> symbols. At the very least, it will bloat image size unnecessarily.
> 
> There might also be scenarios where a previously released image might
> generate core dumps, or require attaching a debugger to a process
> well after the filesystem image has been made.
> 
> These two goals contradict each other, and is addressed here.
> 
> Just before stripping target binaries, allow the option to tar the
> target filesystem for archiving. This will create a single image -
> rootfs_syms.tgz - with un-stripped target binaries, and allow post-build
> debugging and core dump analysis. The final image will be unaffected.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

I understand the reasoning, and what you proposed is indeed a simple
solution that can work today.

However, I think the "grand plan" to solve this issue was to install
everything to $(STAGING_DIR), not only packages installing libraries.
In $(STAGING_DIR), packages are installed unstripped, and with
debugging symbols if BR2_ENABLE_DEBUG=y. One issue with this solution
is that it requires a lot of effort to implement, so nobody ever
tackled that.

Perhaps one concern with your proposal is that the tar you're
generating is not exactly the same as the generated filesystem with
binaries unstripped. Indeed, after the point where you generate this
tarball, a number of other things will happen in the rootfs, most
notably all what happens within fakeroot (permission/ownership tweaks,
etc.). I understand these generally don't cause any issue for the
specific use-case of having binaries with debugging symbols, but it
shows that this option does not really provide a "rootfs with debugging
symbols", but rather a "almost complete but not quite entirely rootfs
with debugging symbols".

Let's see what others think. The advantage of your proposal is that it
is actionable now. For now, what we tell people is that libraries with
debugging symbols are in $(STAGING_DIR), and for packages that don't
install to staging, the debugging symbols are in the build dir of the
package: output/build/foo-1.0.0/foo.

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
