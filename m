From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 15:45:44 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/supertux: fix build with RELRO
In-Reply-To: <20200914203329.3432074-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 14 Sep 2020 22:33:29 +0200")
References: <20200914203329.3432074-1-fontaine.fabrice@gmail.com>
Message-ID: <87zh58y9vb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable static building of external/squirrel to fix the following build
 > failure with RELRO:

 > /home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld:
 > CMakeFiles/sq_static.dir/sq.c.o: relocation R_X86_64_32 against
 > `.rodata.str1.8' can not be used when making a PIE object; recompile
 > with -fPIC
 > /home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld:
 > final link failed: nonrepresentable section on output
 > collect2: error: ld returned 1 exit status

 > Fixes:
 >  - http://autobuild.buildroot.org/results/46e8f5e622ce450a89bc6d70f4bfd38182557901
 >  - http://autobuild.buildroot.org/results/a43720492d817e4555d728546da9114e3ccba952

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Disable static building of external/squirrel instead of adding -fPIC

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
