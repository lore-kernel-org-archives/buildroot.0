From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2011 10:17:09 +0200
Subject: [Buildroot] [RFC] New package: QSerialDevice
In-Reply-To: <4EA663BA.5030700@visionsystems.de>
References: <4EA663BA.5030700@visionsystems.de>
Message-ID: <20111025101709.3851667f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 25 Oct 2011 09:22:34 +0200,
Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :

> 1. I fetch it from git branch, how can I specify revision?

pkg_VERSION = ...

You can specify a git branch, a git commit, whatever commit identifier
that is valid for git.

> 2. how do I handle symlinking for libraries? If I just copy all 4
> files, I get 4 same files and not one library and 3 symlinks

Either use the "make install" of the package (or implement it), or use
ln to create the symlinks.

> 3. what
> about creating some kind of folders/menu (in package/Config.in) for
> Qt, python etc. add-ons?

I don't know. qserialdevice should go in Libraries -> Hardware
handling. I don't see why it would need to end up in a qt-specific
submenu.

> +define QSERIALDEVICE_CONFIGURE_CMDS
> +	$(QT_QMAKE) $(@D)/serialport.pro
> +endef

Should be:

	(cd $(@D); $(QT_QMAKE) serialport.pro)

Does it *absolutely* require udev ? I have never used QSerialDevice,
but QExtSerialPort instead, and udev wasn't necessary.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
