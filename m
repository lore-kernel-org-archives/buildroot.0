From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Nov 2014 08:52:24 +0100
Subject: [Buildroot] [PATCH 39/51] yajl: bump version
In-Reply-To: <1414349157-22749-39-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sun, 26 Oct 2014 19:45:45 +0100")
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414349157-22749-39-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87egtfxxaf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > The patches have been refreshed and their name have been changed.
 > The patches were not sent upstream, they will be sent shortly.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Strike that, it doesn't build here on uClibc:

[ 76%] Linking C executable gen-extra-close
make[3]: Entering directory '/home/peko/source/buildroot/output/build/yajl-2.1.0'
Building C object verify/CMakeFiles/json_verify.dir/json_verify.c.o
[ 80%] [ 84%] Building C object test/parsing/CMakeFiles/yajl_test.dir/yajl_test.c.o
[ 88%] Building C object reformatter/CMakeFiles/json_reformat.dir/json_reformat.c.o
Building C object example/CMakeFiles/parse_config.dir/parse_config.c.o
../../yajl-2.1.0/lib/libyajl.so.2.1.0: undefined reference to `__isnan'
../../yajl-2.1.0/lib/libyajl.so.2.1.0: undefined reference to `__isinf'
collect2: error: ld returned 1 exit status
test/api/CMakeFiles/gen-extra-close.dir/build.make:86: recipe for target 'test/api/gen-extra-close' failed
make[3]: *** [test/api/gen-extra-close] Error 1
make[3]: Leaving directory '/home/peko/source/buildroot/output/build/yajl-2.1.0'

Either we need to extend the 'fix-json_reformat linking on uClibc' patch
or disable the tests.

Care to take a look?

-- 
Bye, Peter Korsgaard
