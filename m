From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 May 2013 21:52:44 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix bug #5054
In-Reply-To: <1368283774-19848-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 11 May 2013 11:49:34 -0300")
References: <1368283774-19848-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87li7l1egj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The external toolchain logic checks (and finds) the proper
 Gustavo> ARCH_LIB_DIR and forcibly copies it to */lib even if it's in
 Gustavo> */lib64 This is all well until the check is done for
 Gustavo> create_lib64_symlinks which only verifies if
 Gustavo> ARCH_SYSROOT_DIR/lib64 is a symlink, which in some toolchain
 Gustavo> it's a real directory (like sourcery x86_64 2012.09) and thus
 Gustavo> doesn't make the symlink in the target.

 Gustavo> Fix this by also checking for a real directory.

 Gustavo> Easily reproducible by running "make qemu_x86_64_defconfig",
 Gustavo> switching to an external toolchain before build, building and
 Gustavo> then trying to run the resulting image.

 Gustavo> Closes bug #5054

Committed, thanks.

-- 
Bye, Peter Korsgaard
