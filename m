From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2016 15:11:16 +0200
Subject: [Buildroot] [PATCH 01/34] reproducibility: introduce config knob
In-Reply-To: <87mvnzl70e.fsf@dell.be.48ers.dk>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <878tzjn0du.fsf@dell.be.48ers.dk>
 <20160509145309.1ae28c04@free-electrons.com>
 <87mvnzl70e.fsf@dell.be.48ers.dk>
Message-ID: <20160509151116.1761093e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 09 May 2016 15:01:53 +0200, Peter Korsgaard wrote:

>  > I use timestamps all the time to verify that I'm indeed running the
>  > version of the code I intend to run. As I work on the kernel, I use the
>  > kernel timestamp, but I really use it all the time, to double check
>  > that I'm running the kernel image I just built and not one that was
>  > left around, built several days/weeks ago.  
> 
> Ok, what timestamps exactly? Embedded timestamps like uname -v or
> filesystem timestamps of the files?

The one I use for the kernel is obviously the embedded time stamp,
displayed at boot time (and also in uname -v).

I guess the filesystem time stamps are not that useful, but they are
the "easy" part (i.e they can be fixed globally when generating the
filesystem image). The embedded timestamps all over the place in
different programs/libraries are really the annoying part.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
