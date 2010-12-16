From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 16 Dec 2010 21:53:45 +0100
Subject: [Buildroot] Build failures...
In-Reply-To: <72247.47890.qm@web121804.mail.ne1.yahoo.com>
References: <72247.47890.qm@web121804.mail.ne1.yahoo.com>
Message-ID: <1292532825.15771.7.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joe,

Le jeudi 16 d?cembre 2010 ? 11:58 -0800, Joe a ?crit :
> I'm new to buildroot, so I hope I don't cause any extra work on anyones behalf 
> if I'm incorrect about these...I would just like to help participate to make 
> this project better...so I thought I'd post what I've encountering so far.

Can you tell us what buildroot version you're using ?

> 
> My host environment if a VMware Centos v5.5 system, and I've encountered a 
> couple issues during building of the most current buildroot release.
> 
>   1) When building ncurses it got hung up when running the terminfo compiler 
> (tic).  I let it run for over an hour, but decided to cancel it when top 
> indicated it had already consumed >43 minutes of CPU time and was still not 
> finished.
>   

I have encountered this problem too. It comes from the ncurses version
from your host system being different from the one buildroot is trying
to build.

This patch should fix the problem :

http://git.potipota.net/cgi-bin/cgit.cgi/buildroot/commit/?h=2011.02-fix-n-bump&id=d6fe6099b7aeb21a624507c5c3e5c05feedae25e

>   2) When building host-zlib-1.2.5 it failed during the make install phase it 
> invokes install-libs, which attempted to copy (cp command) SHAREDLIBV (which was 
> empty) and received a failure on the cp command due to only a single argument.  
> I simply commented the line out and then the make of that component completed.

Please provide some traces.

>   
>   3) When configuring buildroot I checked off the item (in menuconfig) to build 
> the uClibc tests.  When it was building the tests it got a compile error (not 
> sure now what file or error).  I simply went back into the configure and 
> unselected to build the tests and then it went past this.
>   
>   4) When invoking /usr/bin/msgfmt it got a parse failure in ./de.po on the 
> keyword "msgctxt".  Not sure what it's building or how to get around this.

Please provide some traces.

> 
> 
> I'm unable to complete the make process, so currently I dead in the water with 
> this tool, and I'm not sure where to go from here with it.  Perhaps it's my 
> build environment?   What Linux version has this been known to build without 
> failures on?

I'm running debian unstable here, no problem so far, but I've been in
troubles with Fedora Core 10 at work...

> 
> Hope this helps.
> 

Thanks for this report.

Regards,

--
Lionel Landwerlin
