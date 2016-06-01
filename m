From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 11:28:02 +0200
Subject: [Buildroot] UID management
In-Reply-To: <35ca1901-4687-d84a-716b-30b52d460890@gmail.com>
References: <35ca1901-4687-d84a-716b-30b52d460890@gmail.com>
Message-ID: <20160601112802.3b66873f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Jun 2016 11:15:02 +0200, Marco Trapanese wrote:
> Hello, I kindly ask a suggestion about the best way to manage UIDs.
> On my host system, where I have the overlay directory, the UID of the user is 1000.
> The home directory of my normal user in the target system is /opt.
> 
> The overlay files copied into /opt belong to the dbus user, which has the UID 1000.
> The owner of that home directory should be user defined in the user_table file, with UID 1100:
> 
> user 1100 user 1100 =user /opt /bin/sh dialout,wheel,lp,pulse,audio,network,pulse-access
> root:x:0:
> user:x:1100:
> dbus:x:1000:dbus
> 
> I'm not sure which is the recommended way to get rid of this.
> I have to (manually?) chown the overlay file and set them to UID 1100?

By default, Buildroot chowns all files of the root filesystem to the
root user (i.e UID 0, GID 0). You can override that:

 1/ On a per-package basis using the <pkg>_PERMISSIONS variable.

 2/ Globally on your system, by passing a permission table using the
    BR2_ROOTFS_DEVICE_TABLE option.

See the Buildroot manual for details.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
