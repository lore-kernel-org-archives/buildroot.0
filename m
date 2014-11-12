From: Nathaniel Roach <nroach44@gmail.com>
Date: Wed, 12 Nov 2014 10:30:22 +0800
Subject: [Buildroot] Analysis of build results
In-Reply-To: <20141111234919.3178e9d3@free-electrons.com>
References: <20141111073014.AA83D101626@stock.ovh.net>
 <20141111234919.3178e9d3@free-electrons.com>
Message-ID: <5462C63E.2090107@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/11/14 06:49, Thomas Petazzoni wrote:
> Hello,
> 
> Yann, Gustavo, Bernd, Nathaniel, Maxime, Samuel, Peter, please read on,
> there is some stuff for you below :-)
> 
> On Tue, 11 Nov 2014 08:30:14 +0100 (CET), Thomas Petazzoni wrote:
>> Build statistics for 2014-11-10
>> ===============================
>>
>>         success : 197
>>        failures : 49 
>>        timeouts : 4  
>>           TOTAL : 250
> 
> So a 20% failure rate. Not too bad, but we definitely need to improve
> this.
> 
 ---- snip ----
> 
> 
>>       x86_64 |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a0ff4949d621caf4cada6ae3f66ed38f569d34b9/
> 
> checking for tgetent in -ltinfo... no
> checking for termcap functions library... configure: error: No curses/termcap library found
> 
> Missing host-ncurses dependency. Nathaniel, since this is happening on
> your build server, maybe you could have a look?
> 

I've checked and the configure script is checking for (or at least works
when) libncurses5-dev is installed on the host.

When lncurses is installed, the package from that specific config builds
fine. So it looks like host-mysql doesn't depend on host-ncurses, or
something along those lines.

I have removed libncurses5 from the autobuilder per our discussion on it
a few months back.


 ---- snip ----
> 
> Thomas
> 


Thanks,

Nathaniel.
