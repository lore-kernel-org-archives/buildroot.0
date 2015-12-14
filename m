From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 14 Dec 2015 07:04:18 +0100
Subject: [Buildroot] revert GLIBC_MINOR bump in uClibc-ng 1.0 branch
Message-ID: <20151214060418.GA8958@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Khem, Alexey,

recently Khem tried to use systemd with openembedded and uClibc-ng.
Most of the needed stuff is ready and will be committed soon.

There is one open issue I want to discuss with you.
The GLIBC_MINOR bump in commit
4a05ed87ceb946608100642121c32e642b58cd0d is breaking SSP detection
in GCC. This was discovered in Buildroot and fixed.
It seems there is a major problem to fix it in OpenEmbedded, so
Khem is asking for revert of this commit for the next release.

What do you think about it?

Isn't the boost problem solved anyway in another way?

May be we just learned what it means to bump this number and
can revert it back to the old value. We should still try
to get a patch into gcc to avoid any misdetection regarding
SSP for the next major gcc release.

Thanks for any opinion,
 best regards
  Waldemar
