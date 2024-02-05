Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F5CC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA3324012F;
	Mon,  5 Feb 2024 21:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA3324012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sb-9UwfjOQOG; Mon,  5 Feb 2024 21:42:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61E3140160;
	Mon,  5 Feb 2024 21:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61E3140160
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3752D1BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1166341951
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1166341951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1fOiD3h71gLt for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:41:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE08F41953
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE08F41953
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0EE5C0002;
 Mon,  5 Feb 2024 21:41:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rX6iq-00DAwD-0D;
 Mon, 05 Feb 2024 22:41:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240123215454.81191-1-ju.o@free.fr>
Date: Mon, 05 Feb 2024 22:41:47 +0100
In-Reply-To: <20240123215454.81191-1-ju.o@free.fr> (Julien Olivain's message
 of "Tue, 23 Jan 2024 22:54:54 +0100")
Message-ID: <87fry6a8ro.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add fping runtime test
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 >  DEVELOPERS                                  |  1 +
 >  support/testing/tests/package/test_fping.py | 45 +++++++++++++++++++++
 >  2 files changed, 46 insertions(+)
 >  create mode 100644 support/testing/tests/package/test_fping.py

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index 9528837dd0..fa760cb3ed 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -1769,6 +1769,7 @@ F:	support/testing/tests/package/test_ddrescue/
 >  F:	support/testing/tests/package/test_dos2unix.py
 >  F:	support/testing/tests/package/test_fluidsynth.py
 >  F:	support/testing/tests/package/test_fluidsynth/
 > +F:	support/testing/tests/package/test_fping.py
 >  F:	support/testing/tests/package/test_gawk.py
 >  F:	support/testing/tests/package/test_glslsandbox_player.py
 >  F:	support/testing/tests/package/test_glslsandbox_player/
 > diff --git a/support/testing/tests/package/test_fping.py b/support/testing/tests/package/test_fping.py
 > new file mode 100644
 > index 0000000000..58a1c92c0b
 > --- /dev/null
 > +++ b/support/testing/tests/package/test_fping.py
 > @@ -0,0 +1,45 @@
 > +import os
 > +import time
 > +
 > +import infra.basetest
 > +
 > +
 > +class TestFping(infra.basetest.BRTest):
 > +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
 > +        """
 > +        BR2_PACKAGE_FPING=y
 > +        BR2_TARGET_ROOTFS_CPIO=y
 > +        # BR2_TARGET_ROOTFS_TAR is not set
 > +        """
 > +
 > +    def test_run(self):
 > +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
 > +        self.emulator.boot(arch="armv5",
 > +                           kernel="builtin",
 > +                           options=["-initrd", cpio_file])
 > +        self.emulator.login()
 > +
 > +        # Check the program can execute.
 > +        self.assertRunOk("fping --version")
 > +
 > +        # Fping v5.1 need to wait few seconds after a kernel booted
 > +        # before starting. This sleep time can be removed when the
 > +        # issue will be closed and the package updated. See:
 > +        # https://github.com/schweikert/fping/issues/288
 > +        time.sleep(5)

That's annoying, but indeed not much we can do about it. From the looks
of it, the fping code initializes the timestamp to zero (using calloc)
and then complains when (the delta from) CLOCK_REALTIME is less than
10s.

The only thing we could do better is to take timeout_multiplier into
consideration, so I multiplied with that and applied, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
