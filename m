From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Dec 2020 23:02:14 +0100
Subject: [Buildroot] [PATCH v3,1/1] package/libcap: fix libcap.pc
In-Reply-To: <20201201192703.402854-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 1 Dec 2020 20:27:03 +0100")
References: <20201201192703.402854-1-fontaine.fabrice@gmail.com>
Message-ID: <87v9dlxk0p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libcap builds an incorrect libcap.pc because libdir is pulled from the
 > host os:

 > ifndef lib
 > lib=$(shell ldd /usr/bin/ld|egrep "ld-linux|ld.so"|cut -d/ -f2)
 > endif

 > Fix this error by passing lib=lib and prefix in
 > {HOST_LIBCAP,LIBCAP}_BUILD_CMDS

 > Fixes:
 >  - https://bugs.buildroot.org/show_bug.cgi?id=13276

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Reviewed-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v2 -> v3 (after review of Peter Seiderer):
 >  - Merge with initial patch that was not committed yet

 > Changes v1 -> v2:
 >  - Also fix host libcap

Committed, thanks.

-- 
Bye, Peter Korsgaard
