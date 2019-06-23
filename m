From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 22:56:01 +0200
Subject: [Buildroot] [PATCH 2/2] package/gerbera: add upstream patch to
 fix find_program with taglib-config
In-Reply-To: <20190610212023.9483-3-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Mon, 10 Jun 2019 23:20:23 +0200")
References: <20190610212023.9483-1-joerg.krause@embedded.rocks>
 <20190610212023.9483-3-joerg.krause@embedded.rocks>
Message-ID: <87mui8aun2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Add an from from upstream to fix linking Gerbera with taglib. The patch
 > fixes the following issue:

 > When cross-compiling CMakes `find_program()` will search for binaries on the
 > host. This is typically correct, e.g. when search for compilers or shells.

 > When cross-compiling, searching for `taglib-config` using `find_program` should
 > not find the binary on the host, instead it should find the binary in the sysroot
 > directory, as the host `taglib-config` will output the wrong host paths
 > and libs, whereas the sysroot `taglib-config` will output the correct sysroot
 > paths and libs.

 > Therefore, use the `CMAKE_FIND_ROOT_PATH_MODE_PROGRAM` variable when
 > cross-compiling. This variable controls whether the `CMAKE_FIND_ROOT_PATH`
 > and `CMAKE_SYSROOT` are used by find_program().

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
