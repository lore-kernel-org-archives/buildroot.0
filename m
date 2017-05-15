From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 13:35:17 +0200
Subject: [Buildroot] [PATCH] efibootmgr: backport upstream patch to fix
	build with gcc 6.x
In-Reply-To: <1494488882-32282-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 11 May 2017 09:48:02 +0200")
References: <1494488882-32282-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zieejqtm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > efibootmgr was built with -fshort-wchar, which causes gcc to use
 > 2-byte wchar_t instead of the normal 4-byte wchar_t. But this doesn't
 > work anymore with gcc 6.x, as it causes a build failure:

 > /home/test/autobuild/run/instance-3/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/6.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: warning: efibootmgr.o uses 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of wchar_t values across objects may fail
 > /home/test/autobuild/run/instance-3/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/6.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: warning: efi.o uses 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of wchar_t values across objects may fail
 > /home/test/autobuild/run/instance-3/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/6.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: warning: unparse_path.o uses 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of wchar_t values across objects may fail

 > Upstream solution was do simply drop -fshort-wchar:

 >   https://github.com/rhinstaller/efibootmgr/commit/3466fd05c8c6f1052e0426d64eed40f8a88fd78f

 > So this commit simply backports this upstream patch.

 > Fixes:

 >   http://autobuild.buildroot.net/results/87c3ff2427331eb9ab31c9eb685fe80954a0a98f/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
