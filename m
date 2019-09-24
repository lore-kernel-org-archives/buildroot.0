From: Timo Ketola <Timo.Ketola@exertus.fi>
Date: Tue, 24 Sep 2019 05:24:32 +0000
Subject: [Buildroot] [PATCH 1/1] fs/cpio: make initramfs init script
 survive 'console=' kernel argument
In-Reply-To: <80e3e080-0af3-99de-ff8f-9de5e3dca8a6@exertus.fi>
References: <80e3e080-0af3-99de-ff8f-9de5e3dca8a6@exertus.fi>
Message-ID: <0182085e-937d-beca-9f43-5176ed299460@exertus.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

I tested this as per Arnout's suggestion by booting with 'console=' /
'console=ttymxc0,115200' and with / without initramfs. The result
depends only on console setting:

# cat /proc/cmdline; ls -l /proc/1/fd
console=
total 0
lrwx------    1 root     root            64 Sep 24 05:01 0 -> /dev/null
lrwx------    1 root     root            64 Sep 24 05:01 1 -> /dev/null
lrwx------    1 root     root            64 Sep 24 05:01 2 -> /dev/null

# cat /proc/cmdline; ls -l /proc/1/fd
console=ttymxc0,115200
total 0
lrwx------    1 root     root            64 Sep 24 05:20 0 -> /dev/console
lrwx------    1 root     root            64 Sep 24 05:20 1 -> /dev/console
lrwx------    1 root     root            64 Sep 24 05:20 2 -> /dev/console

--

Timo
