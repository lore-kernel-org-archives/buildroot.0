From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 26 May 2016 22:47:43 +0200
Subject: [Buildroot] [PATCH v2 resend 1/3] add odroid mali GL support.
In-Reply-To: <20160525174632.7086-1-daggs@gmx.com>
References: <20160525174632.7086-1-daggs@gmx.com>
Message-ID: <20160526224743.70f1c378@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 May 2016 20:46:30 +0300,
Dagg <daggs@gmx.com> a ?crit :

> add GL support to the odroid c2 boards
> 
> Signed-off-by: Dagg <daggs@gmx.com>

I took the liberty to update this patch as follow:

1. extract the commands from the sysv service from first patch to an
helper tool (odroid-setup-display).
2. add sys/systemd services installation according to Buildroot standards.
3. fix installation of the libs on the target.

So, now you can drop the first patch, as there is no need anymore for a
dedicated fs overlay.

I tested it on a systemd-based firmware on my odroidc2 device. To spawn
a tty on the screen, the following commands should be executed on the
target:

```
cd /etc/systemd/system/getty.target.wants/
ln -s ../../../../lib/systemd/system/getty at .service getty at tty0.service
reboot
```

Regards,

--
ELB

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-odroid-mali-new-package.patch
Type: text/x-patch
Size: 9270 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160526/b0a29c99/attachment.bin>
