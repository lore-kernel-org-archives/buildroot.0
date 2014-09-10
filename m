From: Andreas Zeiler <zeiler@fs-net.de>
Date: Wed, 10 Sep 2014 14:26:06 +0200
Subject: [Buildroot] Problem with building Divine; wrong Path
Message-ID: <5B70540BA10E7D49BEC1ACD5D4148853540BB0C644@FS-SBS2008.fs-net.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello Thomas,

thanks for reply. I cannot try this with 2014.08. I know that there are many fixes but first I need to merge to 2013.05 because another platform has this version and we want to merge these platforms to one.

Also I tried with removing toolchain from PATH. This had no effect. I also removed the toolchainpath from the menuconfig but then the toolchain couldn't been found at all.

Which elements do you need exactly? I'm new to this all. ;)






Mit freundlichen Gr??en / With kind regards

Andreas Zeiler
(zeiler at fs-net.de)

F&S Elektronik Systeme GmbH
70569 Stuttgart
Untere Waldpl?tze 23
Tel.: 0711/123722-0
Fax: 0711/123722-99
www.fs-net.de


armStone: Pico-ITX ARM based Single Board Computer 

F&S Elektronik Systeme GmbH, Stuttgart, Germany
Geschaeftsfuehrer: Holger Froelich, Guenther Scholz Handelsregister Stuttgart HRB 18493, VAT DE178964418 

-----Urspr?ngliche Nachricht-----
Von: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
Gesendet: Mittwoch, 10. September 2014 12:23
An: Andreas Zeiler
Cc: buildroot at busybox.net
Betreff: Re: [Buildroot] Problem with building Divine; wrong Path

Dear Andreas Zeiler,

On Wed, 10 Sep 2014 11:22:03 +0200, Andreas Zeiler wrote:

> I merged our Buildroot 2013.02 to the version 2013.05. Everything was 
> ok. As default config we configure with directfb which includes the 
> divine lib. When the divine package gets build, there is a failure.
> Seems that the lib path for the toolchain gets set wrong. So the 
> libtool says it cannot find the archive/directory. When I'm building 
> without directfb, the build process ends without any failures. Here is 
> a failure output: (I hope this is enough of Output)

Usual questions:

 * Can you reproduce with Buildroot 2014.08 ? We have fixed many many
   issues since 2013.05.

 * Please send the .config file that allows to reproduce the issue (as
   well as the different elements needed for us to reproduce the build).


> But the File is under ""/home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/ lib/libstdc++.la". So somewhere something adds the wrong path.
> 
> ?  "local/arm/fs-toolchain-4.7.2-cortexa5-neonvfpv4/lib/gcc/arm-fs-linux-gnueabi/4.7.2/../../../../arm-fs-linux-gnueabi/"
> This is the path from my toolchain on my hostpc under the directory "/usr/local/......"
> 
> This is my $PATH Variable: "/usr/lib/qt-3.3/bin:/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin/bin:/home/zeiler/bin:/usr/local/arm/fs-toolchain-4.7.2-cortexa5-neonvfpv4/bin:/opt/freescale/usr/local/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin"
> 
> Can someone help me with this?

Remove the toolchains from your PATH, i.e remove /usr/local/arm/fs-toolchain-4.7.2-cortexa5-neonvfpv4/bin
and /opt/freescale/usr/local/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin.
Also, make sure to try to reproduce with ccache support disabled.

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ATT20202.config
Type: application/xml
Size: 53547 bytes
Desc: ATT20202.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140910/ff9e9444/attachment.wsdl>
