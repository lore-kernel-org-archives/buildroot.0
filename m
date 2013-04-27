From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Apr 2013 19:34:07 +0200
Subject: [Buildroot] initramfs doesn't get linked into kernel
In-Reply-To: <klg76d$b42$1@ger.gmane.org>
References: <klf34k$81s$1@ger.gmane.org> <20130427031758.363b222f@skate>
 <klg76d$b42$1@ger.gmane.org>
Message-ID: <20130427193407.0e7423c6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Adam Nielsen,

On Sat, 27 Apr 2013 19:53:20 +1000, Adam Nielsen wrote:

> Ahh ok, so what I did should have worked then.  Since then I have added 
> Ethernet support for my board and tried booting with a root filesystem on NFS. 
>   This worked (it mounted the filesystem) but it doesn't seem to be able to 
> run the init binary (in this case Busybox built by buildroot.)  Looking at 
> tcpdump it correctly follows the symlinks and appears to download the busybox 
> binary, but then fails saying it couldn't find init.
> 
> I'm not quite sure what the problem is (I'm wondering whether it's a 
> compatibility issue like OABI vs EABI or something) but it's possible this is 
> what was causing the apparent initramfs failure, since it's the same 
> filesystem (I just unzipped the .tar of the root filesystem that buildroot 
> generated, into the NFS share.)  I built the kernel with and without EABI 
> support though and there was no difference, so I'm not really sure what it 
> might be.

Again, please post your Buildroot .config and kernel .config. Another
issue you might be having if you're building your kernel outside of
Buildroot is that you may have enabled the usage of devtmpfs as
the /dev strategy, but forgot to enable CONFIG_DEVTMPFS and
CONFIG_DEVTMPFS_MOUNT in your kernel configuration. See
http://buildroot.org/downloads/manual/manual.html#_dev_management for
more details.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
