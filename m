From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 31 Mar 2021 14:02:54 -0700
Subject: [Buildroot] building a kernel+ramdisk separate from rootfs for
 using dm_crypt filesystem
Message-ID: <CAJ+vNU3mdFXbCL95QQ-67xj8w3cLv6e7_BB6ou=YwPC3AqJSPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I'm using buildroot to build a kernel and rootfs but now need to
implement dm_crypt for a secure filesystem.

I'm not all that familiar with dm_crypt but it would appear that I
need to use an initramfs to open (unlock) the encrypted filesystem and
mount it.

Do I need to build a separate buildroot config for the initramfs image
from the buildroot config that builds my traditional kernel and
rootfs? I was hoping to be able to build this all as a single project.

Perhaps there is a way of using dm_crypt without an initramfs that I'm
not aware of.

Perhaps I don't even need dm_crypt and there are other simple ways to
secure my root filesystem? I am working with a system that is secure
up to and including the bootloader and am using U-Boot verified boot
to boot a signed kernel from a FIT image.

Any suggestions?

Best regards,

Tim
