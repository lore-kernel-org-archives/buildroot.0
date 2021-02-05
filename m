From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Feb 2021 19:38:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: fix build on
 sparc64
In-Reply-To: <20210204193111.1318198-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 4 Feb 2021 20:31:11 +0100")
References: <20210204193111.1318198-1-fontaine.fabrice@gmail.com>
Message-ID: <878s82742m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure on sparc64:
 > /home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc64-buildroot-linux-gnu/9.3.0/../../../../sparc64-buildroot-linux-gnu/bin/ld:
 > /tmp/ccylTux8.o: in function `find_kaslr_offsets':
 > /home/giuliobenetti/autobuild/run/instance-0/output-1/build/makedumpfile-1.6.8/makedumpfile.c:4017:
 > undefined reference to `get_kaslr_offset'

 > Even if this build failure is only raised with version 1.6.8,
 > get_kaslr_offset was also undeclared on sparc64 in version 1.6.7

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1421f54f7599bba62c0a4bd5c65ce21c8cc7ee1a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
