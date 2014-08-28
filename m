From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 28 Aug 2014 10:42:14 +0200
Subject: [Buildroot] Rootfs for aarch64
In-Reply-To: <CAJ2SuLmuBCToiP5z56hTKXTB5hdJ0=mH0SkQAS4=hbmbK21g4w@mail.gmail.com>
References: <CAJ2SuL=yhZdq-aQ3Up4mkL29troM9ieq8qxXTVux0NYYapao=A@mail.gmail.com>
 <CAFbHwiSOfj7tctecfL7uAj3g2pSCLbg_282JhYE_SPRyja7ooQ@mail.gmail.com>
 <CAJ2SuLmY8rAq0aYmWpWeOdkbRXo+c50_YnLvtYP=JguLLmadqA@mail.gmail.com>
 <CAFbHwiQV9=HzA+pAESjiy2QsszZSbG2-itXqY0eh8bo5PppDGg@mail.gmail.com>
 <CAJ2SuLk6GF2STOTGRAKE2UavHr2m+xyjuLZpU4tZA5GFQpYK4w@mail.gmail.com>
 <CAJ2SuLmuBCToiP5z56hTKXTB5hdJ0=mH0SkQAS4=hbmbK21g4w@mail.gmail.com>
Message-ID: <20140828084214.GN12857@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pradeep,
Pradeep Kiruvale wrote,

> Hi Will,
> 
> I tested this rootfs you pointed. But it does not have the network devices in /
> dev and many other devices.
> 
> So if I say ifconfig it can't get network configurations. Please let me know
> how can I get full rootfs.

I recently started to get my linux system working in
qemu-system-aarch64. Important is that you use virtio drivers and
the right startup commands.
Something like this should work:
qemu-system-aarch64 -nographic -M virt -cpu cortex-a57 -smp 1 \
  -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 \
  -device virtio-blk-device,drive=vda \ 
  -drive file=qemu-aarch64.img,if=none,id=vda

I am using Qemu 2.1.

good luck
 Waldemar
