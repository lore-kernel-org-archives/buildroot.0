Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3BEEB64D9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 06:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56F7B416B4;
	Tue, 27 Jun 2023 06:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56F7B416B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uAruZ_lhc0Sv; Tue, 27 Jun 2023 06:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 853E34021C;
	Tue, 27 Jun 2023 06:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 853E34021C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4386F1BF2F5
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 06:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D0BF81E4A
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 06:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D0BF81E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O4ZwoQLMYuPV for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 06:07:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C373181A24
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C373181A24
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 06:07:16 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A00881BF208;
 Tue, 27 Jun 2023 06:07:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qE1r7-008sUv-Ob; Tue, 27 Jun 2023 08:07:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20230610173850.1108670-1-bernd.kuhls@t-online.de>
Date: Tue, 27 Jun 2023 08:07:13 +0200
In-Reply-To: <20230610173850.1108670-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 10 Jun 2023 19:38:50 +0200")
Message-ID: <87v8f9xwtq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/putty: bump version to 0.78
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Changelog:
 > https://www.chiark.greenend.org.uk/~sgtatham/putty/changes.html

 > Removed patch, the patched file does not exist anymore in this release.

 > Switched build system to cmake.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 > +++ b/package/putty/putty.hash
 > @@ -1,8 +1,7 @@
 > -# Hashes from: http://the.earth.li/~sgtatham/putty/0.76/{md5,sha1,sha256,sha512}sums
 > -md5  9d22f8c56c1eaa1c0af3098438f25908  putty-0.76.tar.gz
 > -sha1  de09f50aee330eb05ad0cb81b970d0cc8e5c9b25  putty-0.76.tar.gz
 > -sha256  547cd97a8daa87ef71037fab0773bceb54a8abccb2f825a49ef8eba5e045713f  putty-0.76.tar.gz
 > -sha512  4576b359593928c6eba923f2d7b66ac0f2cf00e0c217cdbbb124471c3b35feb090e623847bfc507a4ef106cb3067aac47419e241b11dd8bf4ae554061fa93c25  putty-0.76.tar.gz
 > +# Hashes from: http://the.earth.li/~sgtatham/putty/0.78/{sha1,sha256,sha512}sums
 > +sha1  198f01db6bea708e480fb11dd23026eda7b3f49f  putty-0.78.tar.gz
 > +sha256  274e01bcac6bd155dfd647b2f18f791b4b17ff313753aa919fcae2e32d34614f  putty-0.78.tar.gz
 > +sha512  d7a3e2eabd5f1f65fc0f3f1ee0789c30fbe891b57f63ddeac0b92befcb6aecd4a748f04a21c76ee42d992deb77c2e1a0454a71cc620ef26fbf23af660bd84bb5  putty-0.78.tar.gz
 
 >  # Locally calculated
 >  sha256  3f3e870dd3d0867d79370b1d433602c60bb91b59de04e5d8f2a149b788530d53  LICENCE

You forgot to update the hash of the LICENSE:

>>> putty 0.78 Patching
>>> putty 0.78 Collecting legal info
ERROR: LICENCE has wrong sha256 hash:
ERROR: expected: 3f3e870dd3d0867d79370b1d433602c60bb91b59de04e5d8f2a149b788530d53
ERROR: got     : 7b10c93f0d582e820a9e6f8c6abbcff54192e41e60644f4d09b96b14fdbc74f8
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
make: *** [package/putty/putty.mk:19: putty-legal-info] Error 1


> diff --git a/package/putty/putty.mk b/package/putty/putty.mk
 > index e57a78be96..e816ad04a5 100644
 > --- a/package/putty/putty.mk
 > +++ b/package/putty/putty.mk
 > @@ -4,18 +4,14 @@
 >  #
 >  ################################################################################
 
 > -PUTTY_VERSION = 0.76
 > +PUTTY_VERSION = 0.78
 >  PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 >  PUTTY_LICENSE = MIT
 >  PUTTY_LICENSE_FILES = LICENCE
 >  PUTTY_CPE_ID_VENDOR = putty
 > -PUTTY_CONF_OPTS = --disable-gtktest
 
 >  ifeq ($(BR2_PACKAGE_LIBGTK2),y)
 > -PUTTY_CONF_OPTS += --with-gtk=2
 > -PUTTY_DEPENDENCIES += libgtk2
 > -else
 > -PUTTY_CONF_OPTS += --without-gtk
 > +PUTTY_DEPENDENCIES += host-pkgconf libgtk2

I think we need to unconditionally pull in host-pkgconf so it doesn't
end up using the host pkg-config to check for gtk. Looking at
cmake/gtk.cmake it also seems to support gtk3 as well.

Care to respin the patch with the above fixes?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
