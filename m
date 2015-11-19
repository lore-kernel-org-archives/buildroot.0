From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Nov 2015 23:05:12 +0100
Subject: [Buildroot] [PATCH v3] sdl: overwrite libpth autodetection
In-Reply-To: <1447969367-21983-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Thu, 19 Nov 2015 22:42:47 +0100")
References: <1447969367-21983-1-git-send-email-ps.report@gmx.net>
Message-ID: <87wptd7ihz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > The sdl libpth autodetection gets confused in case a host
 > version is present. Overwrite libpth autodection for the
 > target build dependent on BR2_PACKAGE_LIBPTHSEM_COMPAT and
 > use pth-config from staging directory.

 > Fixes [1]:

 > checking for pthreads... no
 > checking for pth-config... /usr/bin/pth-config
 > checking pth... yes
 > [...]
 > ./src/SDL.c:33:17: fatal error: pth.h: No such file or directory
 >  #include <pth.h>

 > [1] http://autobuild.buildroot.net/results/733/73330e51b3c099d179004db0b9522ac13358b8f7

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v2 -> v3:
 >   - simplify libpth enable logic, check on BR2_PACKAGE_LIBPTHSEM_COMPAT is enough
 >    (suggested by Baruch Siach)

Committed, thanks.

-- 
Bye, Peter Korsgaard
