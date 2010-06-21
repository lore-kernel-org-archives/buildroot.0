From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 21 Jun 2010 18:41:47 -0500
Subject: [Buildroot] sdl demo app install problem
In-Reply-To: <201006220132.46363.PeterHuewe@gmx.de>
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
	<201006220132.46363.PeterHuewe@gmx.de>
Message-ID: <0D753D10438DA54287A00B027084269763715D5D47@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, June 21, 2010 4:33 PM, Peter H?we wrote:
> Am Dienstag 22 Juni 2010 01:25:24 schrieb H Hartley Sweeten:
>>  /home/bigguiness/extratech/buildroot/output/target/usr/bin/fire strip:
>>  Unable to recognise the format of the input file
>>  `/home/bigguiness/extratech/buildroot/output/target/usr/bin/fire'
>>  /usr/bin/install: strip process terminated abnormally
>
> Hi Hartley,
>
> what's the output of
> $ file /home/bigguiness/extratech/buildroot/output/target/usr/bin/fire

$ file /home/bigguiness/extratech/buildroot/output/target/usr/bin/fire
/home/bigguiness/extratech/buildroot/output/target/usr/bin/fire: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.14, not stripped

For a comparison busybox has this output:

$ file /home/bigguiness/extratech/buildroot/output/target/bin/busybox 
/home/bigguiness/extratech/buildroot/output/target/bin/busybox: setuid ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically linked (uses shared libs), stripped

> strip seems to have a problem with it - maybe its not an executable but a 
> shell script - I used to have this problem with a package I created myself 
> some while ago.

This is the first time I've seen it.  But, this is with the latest git of
buildroot from this morning so I wasn't sure if it's something new.

Hartley
