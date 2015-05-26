From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 May 2015 16:40:44 +0200
Subject: [Buildroot] Auto loading out of the tree device driver using
 UDEV
In-Reply-To: <851200312.2153086.1432638360110.JavaMail.yahoo@mail.yahoo.com>
References: <851200312.2153086.1432638360110.JavaMail.yahoo@mail.yahoo.com>
Message-ID: <20150526164044.77ac3996@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tal Lubko,

On Tue, 26 May 2015 11:06:00 +0000 (UTC), Tal Lubko wrote:

> I'm trying to get an?out of the tree device driver?to be auto loaded
> when system starts using UDEV.I've managed to do so if I run depmod
> on target but I don't know how to do that on the host when building
> the file system.I'm not even sure that depmod is the correct way to
> do that.

If your out of tree driver is using the kernel build system, it should
already be doing the depmod invocation.

If it's not using the kernel build system, then you can invoke depmod
manually, like the nvidia-driver package is doing in Buildroot:

  $(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)

But really, to give you more details, we need to know which out of tree
driver we're talking about, see how it has been packaged in Buildroot,
and where it is installed in the root filesystem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
