From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Feb 2015 22:31:11 +0100
Subject: [Buildroot] [PATCH] gcc: 4.9.2: Add patch to remove a wrong
	header
In-Reply-To: <1423659108-6073-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 (Ezequiel Garcia's message of "Wed, 11 Feb 2015 09:51:48 -0300")
References: <1423659108-6073-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <87fvaazujk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > This commit adds a patch to gcc removing a unistd.h header include
 > in libgcc/config/nios2/linux-atomic.c

 > The file is built as part of GCC first stage (host-gcc-initial),
 > and so the header is not accesible. Given the header is not needed
 > it's fine to simply remove it.

 > Chung-Lin Tang (GCC nios2 maintainer) confirmed patch is good:
 > ""
 > Thanks for noticing, this part appears to be unneeded now that Nios II
 > uses a kernel provided user function for Linux atomic operations. I'll
 > remove the include, and the #define's as well in upstream GCC.
 > ""

 > This commit is required to build a Nios-II internal toolchain.

I'll wait with this until you post the patches to actually build an
internal nios2 toolchain, ok?

-- 
Bye, Peter Korsgaard
