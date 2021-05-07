From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 May 2021 09:28:56 +0200
Subject: [Buildroot] [PATCH v2 1/1] Fix -latomic for CMake packages
In-Reply-To: <de634e81-64a4-285d-7e25-247ca3903e15@mind.be> (Arnout
 Vandecappelle's message of "Sat, 1 May 2021 15:02:43 +0200")
References: <20210413060942.2530596-1-glex.spb@gmail.com>
 <20210413062615.2808309-1-glex.spb@gmail.com>
 <de634e81-64a4-285d-7e25-247ca3903e15@mind.be>
Message-ID: <87sg2z0zpj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 13/04/2021 08:26, Gleb Mazovetskiy wrote:
 >> The poppler package failed to build for me with errors such as this one:
 >> 
 >> host/aarch64-buildroot-linux-gnu/include/c++/10.3.0/cstdlib:75:15: fatal error: stdlib.h: No such file or directory
 >> 75 | #include_next <stdlib.h>
 >> |               ^~~~~~~~~~
 >> 
 >> Changing the CMake option to a link-specific one fixes the issue.

 >  Applied to master, thanks.

 >  Your SoB was missing here, but it was on v1 so I re-added it.

 >  Normally we expect to have one patch per package. This makes it easier to:
 > - port to the stable branch (only the packages that apply to the stable branch);
 > - partially revert.

 >  In this case, I couldn't be bothered to change it though. Just for the future,
 > know that that's the preferred way. It also helps increase your ranking in the
 > contribution statistics :-)

 >  There are a few other packages that do something similar: bctoolbox with
 > -liconv, kf5-kcoreaddons with -latomic, libcpprestsdk with -latomic, mariadb
 > with -latomic, ogre with -latomic, opencv3 with -latomic. Could you change (and
 > test) those ones as well?

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
