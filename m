From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Jun 2013 14:06:58 +0200
Subject: [Buildroot] [PATCH] strace: upgrade to 4.8,
	supporting now aarch64, arc, and xtensa
In-Reply-To: <51b4f749.c4a9440a.27a8.ffffd1a5@mx.google.com> (Chris Zankel's
 message of "Sun, 9 Jun 2013 14:35:44 -0700")
References: <51b4f749.c4a9440a.27a8.ffffd1a5@mx.google.com>
Message-ID: <87d2ru6ufx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Zankel <chris@zankel.net> writes:

 Chris> Remove 'strace-fix-arm-bad-syscall.patch'. This patch had been
 Chris> integrated in v4.6 (commit: 9bc6340d2) and was later replaced
 Chris> with a generic solution in v.7 (commit: 2ce12ed31c2).

 Chris> Strace still cannot handle non-LFS environments, so a modified
 Chris> version of strace-fix-disabled-largefile-syscalls.patch
 Chris> remains. The 64-bit syscalls (sys_truncate64, etc.) are
 Chris> references in the sysent structure but the functinon definitions
 Chris> are commented out becuase of the missing LFS support.

 Chris> The workaround for the 'forced lfs mode' doesn't seem to be
 Chris> necessary anymore.

 Chris> Build tested on arm w and w/o LFS support.

 Chris> Signed-off-by: Chris Zankel <chris@zankel.net>

 Chris> diff --git a/package/strace/Config.in b/package/strace/Config.in
 Chris> index 153bcf6..bbb582a 100644
 Chris> --- a/package/strace/Config.in
 Chris> +++ b/package/strace/Config.in
 Chris> @@ -1,6 +1,5 @@
 Chris>  config BR2_PACKAGE_STRACE
 Chris>  	bool "strace"
 Chris> -	depends on !(BR2_xtensa || BR2_aarch64 || BR2_arc)

There's still no arc support. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
