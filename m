From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 19:36:20 +0200
Subject: [Buildroot] [PATCH 1/2] Revert "package/luvi: bump version to
 2.8.0"
In-Reply-To: <58d29e4a3c7adbeec389a9e6fc4fc115faba6759.camel@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?= Krause"'s message of "Sun, 14 Oct 2018 17:57:37
 +0200")
References: <20181013080103.29974-1-bernd.kuhls@t-online.de>
 <58d29e4a3c7adbeec389a9e6fc4fc115faba6759.camel@embedded.rocks>
Message-ID: <877eica5bf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Hi Bernd,
 > On Sat, 2018-10-13 at 10:01 +0200, Bernd Kuhls wrote:
 >> This reverts commit ac6fedda6b43996545ff498cd19a781698a96050.
 >> 
 >> Fixes
 >> http://autobuild.buildroot.net/results/111/11146b138d3d092c3a230d197528d5dbe293e3fc/
 >> and many others.

 > Does this really fix the issue about missing "c-api/compat-5.3.h" for
 > you? Because it is a luv (not luvi) issue.

It does not:

fatal error: c-api/compat-5.3.h: No such file or directory
 #include "c-api/compat-5.3.h"
                              ^
compilation terminated.
CMakeFiles/luvi.dir/build.make:74: recipe for target 'CMakeFiles/luvi.dir/src/main.c.o' failed
make[4]: *** [CMakeFiles/luvi.dir/src/main.c.o] Error 1
CMakeFiles/Makefile2:180: recipe for target 'CMakeFiles/luvi.dir/all' failed
make[3]: *** [CMakeFiles/luvi.dir/all] Error 2
Makefile:127: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:229: recipe for target '/home/peko/source/buildroot/output-test/build/luvi-v2.7.6/.stamp_built' failed
make[1]: *** [/home/peko/source/buildroot/output-test/build/luvi-v2.7.6/.stamp_built] Error 2

 > Nevertheless, I am happy about the revert as it takes ages to fetch all
 > submodules.

Ok, applied with the autobuilder references removed, thanks.

How should the luv issue be fixed?

-- 
Bye, Peter Korsgaard
