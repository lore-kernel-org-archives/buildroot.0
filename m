From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 21:34:27 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-11-07
In-Reply-To: <a652d705-f8cd-c28e-08ed-4e9531ccb51c@gmail.com>
References: <20161108073019.811FA20D80@mail.free-electrons.com>
 <a652d705-f8cd-c28e-08ed-4e9531ccb51c@gmail.com>
Message-ID: <20161111213427.24dac9c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Nov 2016 13:23:54 +0100, Romain Naour wrote:

> >          arm |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/02df1e57b392a5ec7d4b812e9b0dd4f293c12160  
> 
> It seems that the arm-cortex-m4 toolchain needs to be rebuild.
> 
> We need this fix:
> https://git.buildroot.net/buildroot/commit/?id=90e38737a699a25f577684742c767375e74683c5

Thanks for the notification, I've rebuilt the toolchain and deployed
the new version, see:

  https://git.buildroot.org/buildroot-test/commit/?id=003d1938d911a577cb627bb08548f99ad190cb8c

Following the pthread.h fix, I rebuilt the Blackfin, Microblaze and
m68k, but I forgot that ARM Cortex-M was also using the linuxthreads
thread implementation.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
