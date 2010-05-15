From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 15 May 2010 16:19:42 +0200
Subject: [Buildroot] endian issue
In-Reply-To: <201005151547.02656.korgull@home.nl>
References: <201005151547.02656.korgull@home.nl>
Message-ID: <1273933182.28330.87.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 15 mai 2010 ? 15:47 +0200, Marcel a ?crit :
> Hi,
> 
> I'm using an Atmel sam9g45 using buildroot with linux 2.6.33.
> 
> I currently have most of my things working but run into an issue which is 
> endian related.
> 
> My driver outputs it's data in big-endian mode (ADC data). This is fine with 
> me.I added a package to buildroot with my own software that talks to the 
> driver. This package than transfers the results either over ethernet, usb or 
> rs232. This all works great as long as I don't perform any calculations in the 
> package that I added. When I do so, all data will be messed up and I'm sure 
> it's related to endiannes.
> I think my package is compiled in little-endian mode and I'm quite sure this 
> is the issue. I did some byte swapping to proof it's the issue and this byte 
> swapping makes things fine. 

The endianness configuration of your processor isn't something you can
usually change 'on-the-fly'. It's usually set up early in the boot
process.
So you have to choose whether you want to compile all your system in big
or little endian, you can select that from the buildroot architecture
configuration (arm -> little, armeb -> big, for example).

> 
> Is there any way to compile my package in big-endian mode from buildroot ?
> Or is there another way I should force this ?
> 

You can't select that for 1 package, it's for the whole system or
nothing.
Otherwise, the smartest approch would be to make endian detection (at
compile time or at running time) to adapt your processing algorithm.

Regards,

--
Lionel Landwerlin
