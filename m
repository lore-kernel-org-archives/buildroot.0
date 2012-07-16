From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Sun, 15 Jul 2012 22:17:14 -0400
Subject: [Buildroot] Systemd update (cc the list)
Message-ID: <CADiAo4JS71qm3fphCE2ica_SZPO1zTvWvkB-g84h2Q1+Ru6mxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Jul 15, 2012 at 10:19 AM, Diego Iastrubni <diegoiast@gmail.com> wrote:
> How does it compare with a similar setup, using "normal" logins and
> busybox's init?
>
> How much time does it take to boot under both setups?

Here is dmesg output on a VM:

http://pastebin.com/ZbQmMiTU

[   16.881460] systemd[1]: Startup finished in 14s 40ms 662us (kernel)
+ 2s 840ms 704us (userspace) = 16s 881ms 366us.

of these 16sec:

[    0.392041] Trying to unpack rootfs image as initramfs...
[   13.790005] Freeing initrd memory: 37216k freed

13 secs were spent to unpack initrd. So it could be under 10sec from
boot to DHCP ready.

--
Dmitry Golubovsky

Anywhere on the Web


-- 
Dmitry Golubovsky

Anywhere on the Web
