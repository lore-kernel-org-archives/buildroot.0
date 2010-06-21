From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Tue, 22 Jun 2010 01:47:29 +0200
Subject: [Buildroot] sdl demo app install problem
In-Reply-To: <0D753D10438DA54287A00B027084269763715D5D47@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
	<201006220132.46363.PeterHuewe@gmx.de>
	<0D753D10438DA54287A00B027084269763715D5D47@AUSP01VMBX24.collaborationhost.net>
Message-ID: <201006220147.29583.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Am Dienstag 22 Juni 2010 01:25:24 schrieb H Hartley Sweeten:
>>  /home/bigguiness/extratech/buildroot/output/target/usr/bin/fire strip:
>>  Unable to recognise the format of the input file
>>  `/home/bigguiness/extratech/buildroot/output/target/usr/bin/fire'
>>  /usr/bin/install: strip process terminated abnormally

I've checked it here and got this result:

$ strip /avr/buildroot-2010.02/output/target/usr/bin/fire                   
strip: Unable to recognise the format of the input file `/avr/buildroot-2010.02/output/target/usr/bin/fire'    

$ ./output/staging/usr/avr32-linux-uclibc/bin/strip /avr/buildroot-2010.02/output/target/usr/bin/fire
$

It seems to use the wrong strip command - not the one from the buildroot toolchain, but rather the host one -- 
so maybe you have to patch one of the files (configure/install) from fire - nevertheless I'll have a look at it too

Peter
