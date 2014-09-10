From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Sep 2014 12:23:14 +0200
Subject: [Buildroot] Problem with building Divine; wrong Path
In-Reply-To: <5B70540BA10E7D49BEC1ACD5D4148853540BB0C614@FS-SBS2008.fs-net.local>
References: <5B70540BA10E7D49BEC1ACD5D4148853540BB0C614@FS-SBS2008.fs-net.local>
Message-ID: <20140910122314.59055cd2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Zeiler,

On Wed, 10 Sep 2014 11:22:03 +0200, Andreas Zeiler wrote:

> I merged our Buildroot 2013.02 to the version 2013.05. Everything was
> ok. As default config we configure with directfb which includes the
> divine lib. When the divine package gets build, there is a failure.
> Seems that the lib path for the toolchain gets set wrong. So the
> libtool says it cannot find the archive/directory. When I'm building
> without directfb, the build process ends without any failures. Here
> is a failure output: (I hope this is enough of Output)

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

Remove the toolchains from your PATH, i.e
remove /usr/local/arm/fs-toolchain-4.7.2-cortexa5-neonvfpv4/bin
and /opt/freescale/usr/local/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin.
Also, make sure to try to reproduce with ccache support disabled.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
