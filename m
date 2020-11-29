From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Nov 2020 22:19:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcap: fix libcap.pc
In-Reply-To: <20201128215432.2326411-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Nov 2020 22:54:32 +0100")
References: <20201128215432.2326411-1-fontaine.fabrice@gmail.com>
Message-ID: <87mtyzq2sq.fsf@dell.be.48ers.dk>
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

 > Fix this error by passing lib=lib in {HOST_LIBCAP,LIBCAP}_BUILD_CMDS

 > Fixes:
 >  - https://bugs.buildroot.org/show_bug.cgi?id=13276

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
