From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Aug 2016 23:59:00 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: fix build with uClibc
In-Reply-To: <1472144466-17003-1-git-send-email-rahul.bedarkar@imgtec.com>
 (Rahul Bedarkar's message of "Thu, 25 Aug 2016 22:31:06 +0530")
References: <1472144466-17003-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <878tvkecij.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rahul" == Rahul Bedarkar <rahul.bedarkar@imgtec.com> writes:

 > domoticz.cpp currently assumes that on GNU/Linux systems header
 > <execinfo.h> is available. But that is not true. Since it provided by
 > C library and uClibc can be built without backtrace support. And in
 > such cases we get following build error.

 >   domoticz-3.4834/main/domoticz.cpp:48:22: fatal error: execinfo.h: No such file or directory
 >    #include <execinfo.h>
 >                         ^
 >   compilation terminated.

 > This commit adds patch for detecting presence of <execinfo.h>
 > and guards code accordingly.

 > Fixes:

 >   http://autobuild.buildroot.net/results/393/393f839e160b51ca12ac36058718ad2f0c1b50a6/

 > Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
