From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 29 Jun 2014 21:37:46 +0200
Subject: [Buildroot] [PATCH] uclibc: fix tests building in uClibc
	0.9.33.2
In-Reply-To: <1404069506-13826-1-git-send-email-abrodkin@synopsys.com>
References: <1404069506-13826-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <0565f572-9253-4d0c-992b-6de65c123f83@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey Brodkin <Alexey.Brodkin@synopsys.com> schreef:
>Following patches are required for successful bulding of uClibc built-int tests
>(BR2_UCLIBC_INSTALL_TEST_SUITE=y):
>
>1.
>uclibc-0059-test-cater-for-config.patch
>http://git.uclibc.org/uClibc/commit/test?id=7598eeaa1defa2884adaa890bb115c493d69cc35
>
>2.
>uclibc-0058-test-tls-fix-build-with-newer-binutils.patch
>http://git.uclibc.org/uClibc/commit/test?id=931e8391565323ed2e589c83b83a7345813a5514
>
>3.
>uclibc-0060-test-Fix-math-c-dependency.patch
>http://git.uclibc.org/uClibc/commit/test/math?id=a20a91ad7c042c46e4a2adee6d03315f857f9985
>
>All mentioned patches must be removed as obsolete on bumping uClibc to the next
>release.
>
>Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
>
>Cc: Anton Kolesov <akolesov@synopsys.com>
>Cc: Peter Korsgaard <peter@korsgaard.com>
>Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
>Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
>---
> ...58-test-tls-fix-build-with-newer-binutils.patch | 37 ++++++++++
> .../uclibc-0059-test-cater-for-config.patch        | 81 ++++++++++++++++++++++
> .../uclibc-0060-test-Fix-math-c-dependency.patch   | 30 ++++++++
> 3 files changed, 148 insertions(+)
> create mode 100644 package/uclibc/0.9.33.2/uclibc-0058-test-tls-fix-build-with-newer-binutils.patch
> create mode 100644 package/uclibc/0.9.33.2/uclibc-0059-test-cater-for-config.patch
> create mode 100644 package/uclibc/0.9.33.2/uclibc-0060-test-Fix-math-c-dependency.patch
>
>diff --git a/package/uclibc/0.9.33.2/uclibc-0058-test-tls-fix-build-with-newer-binutils.patch b/package/uclibc/0.9.33.2/uclibc-0058-test-tls-fix-build-with-newer-binutils.patch
>new file mode 100644
>index 0000000..04dfb1e
>--- /dev/null
>+++ b/package/uclibc/0.9.33.2/uclibc-0058-test-tls-fix-build-with-newer-binutils.patch
>@@ -0,0 +1,37 @@
>+From 931e8391565323ed2e589c83b83a7345813a5514 Mon Sep 17 00:00:00 2001
>+From: Baruch Siach <baruch@tkos.co.il>
>+Date: Wed, 02 Oct 2013 07:08:29 +0000
>+Subject: test: tls: fix build with newer binutils
>+
>+Fix the following build failures:
>+
>+ld: tst-tls10.o: undefined reference to symbol 'f2a'
>+ld: tst-tls12.o: undefined reference to symbol 'a1'
>+
>+binutils ld defaults to --no-copy-dt-needed-entries since version 2.22. Add
>+library dependencies explicitly.
>+
>+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>+---
>+(limited to 'test')

When taking patches via a git web interface, it's important to check the full patch, not limited to a particular file or subdirectory, as is the case here. You can do that by browsing up the file hierarchy once a revision is selected, or do manual editing of the url remove the path.

This is because there may be changes in other places for this patch...

Same comment on the other patches added...

Best regards,
Thomas
