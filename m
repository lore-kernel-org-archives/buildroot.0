From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Oct 2013 15:21:41 +0200
Subject: [Buildroot] [PATCHv3 09/20] toolchain: modify the wildcard
	logic for shared libraries copying
In-Reply-To: <1381256237-27948-10-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 8 Oct 2013 20:17:06 +0200")
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87siwa37h6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Until now, the copy_toolchain_lib_root function took as argument the
 Thomas> base name of a library (e.g: libm.so), and was assuming that the usual
 Thomas> scheme libm.so.<x> being a symbolic link to the real library was used.

 Thomas> However, with musl based toolchains, the C library is named libc.so
 Thomas> directly, with no symbolic link at all. Therefore, this commit changes
 Thomas> the copy_toolchain_lib_root to move the responsibility of using a
 Thomas> wildcard or not after the library name the caller's responsibility.

 Thomas> So, all the existing LIB_EXTERNAL_LIBS values are modified to have a
 Thomas> .* at the end, so that the behavior is effectively unchanged.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
