From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 21:14:06 +0200
Subject: [Buildroot] [PATCH v4,
 1/1] package/grpc: fix build with uclibc on x86_64
In-Reply-To: <20190602162557.21667-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 2 Jun 2019 18:25:57 +0200")
References: <20190602162557.21667-1-fontaine.fabrice@gmail.com>
Message-ID: <87h88gdsht.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > On x86_64 if GPR_MUSL_LIBC_COMPAT is not set, grpc tries to link with
 > memcpy at GLIBC_2.2.5, see:
 > https://github.com/grpc/grpc/blob/618a3f561d4a93f263cca23abad086ed8f4d5e86/src/core/lib/gpr/wrap_memcpy.cc

 > Add a new GPR_DISABLE_WRAPPED_MEMCPY to disable wrapped memory without
 > changing CPU behavior

 > Fixes:
 >  - http://autobuild.buildroot.org/results/20d6f2489a4e291a53bd514da66105eb607e1014

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v3 -> v4:
 >  - Add upstream URL for patch
 >  - Fix typo in GPR_DISABLE_WRAPPED_MEMCPY

Committed to 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
