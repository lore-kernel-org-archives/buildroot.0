From: Stridh, Robin ActeSE <robin.stridh@acteembedded.se>
Date: Thu, 22 Jan 2009 13:45:45 +0100
Subject: [Buildroot]  busybox login problem on AT91SAM9263
References: <5B920D714A1C354D8949DBF58C2A35D604139AA8@freja.acte.local>
	<87d4egudlg.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139AAE@freja.acte.local>
	<8763k8uacw.fsf@macbook.be.48ers.dk>
	<1232559369.11888.20.camel@elrond.atmel.com>
Message-ID: <5B920D714A1C354D8949DBF58C2A35D604139ABA@freja.acte.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf> Last time I loaded the SAM9263 board was 10-12 days ago,
Ulf> and at that time I managed to get the board running
Ulf> without any such problem, 
Ulf> - I might have upgraded the uclibc-config though.

The log for at91sam9263ek_defconfig shows you last modified it in revision 24822:

svn log target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig 
------------------------------------------------------------------------
r24822 | ulf | 2009-01-13 19:45:19 +0100 (Tue, 13 Jan 2009) | 1 line

Update at91sam9263ek BSP
------------------------------------------------------------------------
r24790 | ulf | 2009-01-12 11:25:31 +0100 (Mon, 12 Jan 2009) | 1 line

Update sam9263EK  BSP
------------------------------------------------------------------------
r24728 | ulf | 2009-01-09 00:01:50 +0100 (Fri, 09 Jan 2009) | 1 line

Update sam9263ek configs, build completes

I checked out and built this version, an here the login works fine:
svn co -r24822 svn://uclibc.org/trunk/buildroot


The conclusion is that the problem occured somewhere between r24822 and r24922
(jan 13 and jan 21)

Best regards,
Robin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090122/5ea39022/attachment.htm 
