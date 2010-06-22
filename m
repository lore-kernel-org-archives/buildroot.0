From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 21 Jun 2010 20:05:38 -0500
Subject: [Buildroot] sdl demo app install problem
In-Reply-To: <201006220147.29583.PeterHuewe@gmx.de>
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
	<201006220132.46363.PeterHuewe@gmx.de>
	<0D753D10438DA54287A00B027084269763715D5D47@AUSP01VMBX24.collaborationhost.net>
	<201006220147.29583.PeterHuewe@gmx.de>
Message-ID: <0D753D10438DA54287A00B027084269763715D5D81@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, June 21, 2010 4:47 PM, Peter H?we wrote:
>> Am Dienstag 22 Juni 2010 01:25:24 schrieb H Hartley Sweeten:
>>>  /home/bigguiness/extratech/buildroot/output/target/usr/bin/fire strip:
>>>  Unable to recognise the format of the input file
>>>  `/home/bigguiness/extratech/buildroot/output/target/usr/bin/fire'
>>>  /usr/bin/install: strip process terminated abnormally
>
> I've checked it here and got this result:
>
> $ strip /avr/buildroot-2010.02/output/target/usr/bin/fire                   
> strip: Unable to recognise the format of the input file `/avr/buildroot-2010.02/output/target/usr/bin/fire'    
>
> $ ./output/staging/usr/avr32-linux-uclibc/bin/strip /avr/buildroot-2010.02/output/target/usr/bin/fire
> $
>
> It seems to use the wrong strip command - not the one from the buildroot
> toolchain, but rather the host one -- so maybe you have to patch one of
> the files (configure/install) from fire - nevertheless I'll have a look
> at it too

Well, I got it to install.  But, I'm not sure if this was the right way to
do it.  I added the following to the *.mk file:


FIRE_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install


I had to export SDL_NOMOUSE=1 on the board (I can't find a USB mouse and a
hub right at the moment) but the 'fire' app does run on the i.MX35.  Now
on to my actuall app....

Thanks,
Hartley
