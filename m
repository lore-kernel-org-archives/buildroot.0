From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Oct 2018 22:48:55 +0200
Subject: [Buildroot] [PATCH 1/1] erlang: always use Buildroot's zlib
In-Reply-To: <20181012141149.72489-1-fhunleth@troodon-software.com> (Frank
 Hunleth's message of "Fri, 12 Oct 2018 10:11:49 -0400")
References: <20181012141149.72489-1-fhunleth@troodon-software.com>
Message-ID: <87sh18p83s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 > While Erlang includes a version of zlib, it's intended for Windows and
 > there's an expectation that non-Windows platforms provide it. It's also
 > not as regularly updated as the one in Buildroot. This change makes
 > Erlang always use a Buildroot-provided zlib.

 > Fixes this compile error:

 >  CC	/home/buildroot/autobuild/run/instance-0/output/build/erlang-21.0/erts/emulator/zlib/obj/x86_64-buildroot-linux-musl/opt/adler32.o
 > In file included from zlib/adler32.c:11:0:
 > zlib/zutil.h:172:39: error: "_LFS64_LARGEFILE" is not defined [-Werror=undef]
 >      (!defined(_LARGEFILE64_SOURCE) || _LFS64_LARGEFILE-0 == 0)
 >                                        ^~~~~~~~~~~~~~~~

 > See http://autobuild.buildroot.net/results/fc633f80c7c36a90e641487f5a888fbb767c2a54/.

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
