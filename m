Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D102C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 21:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D69804086D;
	Tue,  6 Feb 2024 21:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dZuf1eX0FAVN; Tue,  6 Feb 2024 21:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E24FA4086E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E24FA4086E;
	Tue,  6 Feb 2024 21:48:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09EFB1BF400
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAE57401B1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:48:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c_iWils4aBjQ for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 21:48:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86AB2400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86AB2400D3
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86AB2400D3
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 21:48:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99280C0013;
 Tue,  6 Feb 2024 21:48:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rXTJD-00EHyW-2n;
 Tue, 06 Feb 2024 22:48:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240206195237.55252-1-ju.o@free.fr>
Date: Tue, 06 Feb 2024 22:48:51 +0100
In-Reply-To: <20240206195237.55252-1-ju.o@free.fr> (Julien Olivain's message
 of "Tue, 6 Feb 2024 20:52:37 +0100")
Message-ID: <87h6il462k.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new acl runtime test
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
 >  DEVELOPERS                                |  1 +
 >  support/testing/tests/package/test_acl.py | 87 +++++++++++++++++++++++
 >  2 files changed, 88 insertions(+)
 >  create mode 100644 support/testing/tests/package/test_acl.py

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index 4b8d195f9f..ce248e8706 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -1762,6 +1762,7 @@ F:	support/testing/tests/package/sample_python_midiutil.py
 >  F:	support/testing/tests/package/sample_python_ml_dtypes.py
 >  F:	support/testing/tests/package/sample_python_pyalsa.py
 >  F:	support/testing/tests/package/sample_python_spake2.py
 > +F:	support/testing/tests/package/test_acl.py
 >  F:	support/testing/tests/package/test_acpica.py
 >  F:	support/testing/tests/package/test_acpica/
 >  F:	support/testing/tests/package/test_apache.py
 > diff --git a/support/testing/tests/package/test_acl.py b/support/testing/tests/package/test_acl.py
 > new file mode 100644
 > index 0000000000..e4827c7bec
 > --- /dev/null
 > +++ b/support/testing/tests/package/test_acl.py
 > @@ -0,0 +1,87 @@
 > +import os
 > +
 > +import infra.basetest
 > +
 > +
 > +class TestAcl(infra.basetest.BRTest):
 > +    # Note: this test requires a Kernel with a filesystem on /tmp
 > +    # supporting ACLs. This is the case for the basetest reference
 > +    # config. Kernel has CONFIG_TMPFS_POSIX_ACL=y, and /tmp is tmpfs
 > +    # in the default Buildroot config.
 > +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
 > +        """
 > +        BR2_PACKAGE_ACL=y
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
 > +        # Check the programs can execute.
 > +        self.assertRunOk("getfacl --version")
 > +        self.assertRunOk("setfacl --version")
 > +
 > +        # Constants used in this test.
 > +        test_user = "acltest"
 > +        test_data = "Hello Buildroot!"
 > +        test_file = "/tmp/file.txt"
 > +
 > +        # Create a test user:
 > +        # -D    don't set a password
 > +        # -h    set home directory
 > +        # -H    don't create home directory
 > +        # -s    set shell to /bin/sh
 > +        self.assertRunOk(f"adduser -D -h /tmp -H -s /bin/sh {test_user}")
 > +
 > +        # Create a test file, and make sure the owner is "root" with
 > +        # standard Unix permissions to read/write only for the owner.
 > +        self.assertRunOk(f"echo '{test_data}' > {test_file}")
 > +        self.assertRunOk(f"chown root:root {test_file}")
 > +        self.assertRunOk(f"chmod 0600 {test_file}")
 > +
 > +        # Check we have no ACL for the test user.
 > +        getacl_cmd = f"getfacl -c -p {test_file}"
 > +        out, ret = self.emulator.run(getacl_cmd)
 > +        self.assertEqual(ret, 0)

NIT: Maybe we should consider making assertRunOk() return the stdout
output so we don't need to open code the exit code check every time that
we also need stdout?

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
