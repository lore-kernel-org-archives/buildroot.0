From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Date: Sun, 18 Mar 2012 16:51:25 -0300
Subject: [Buildroot] [PATCH] bifferboard: new board
In-Reply-To: <201203181813.30601.arnout@mind.be>
References: <201203031529.36487.arnout@mind.be>
 <201203181450.44385.arnout@mind.be> <4F660977.4040806@yahoo.co.uk>
 <201203181813.30601.arnout@mind.be>
Message-ID: <CAAAP30GjEg_an8EZnq=z4JjcDXv_wcSCDgX_0NXk5Ao=7e-rhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> I learnt something new the other day - an initramfs compiled into the
>> kernel can be compressed, however the kernel compression works ontop of
>> that. ?So if you specify CONFIG_INITRAMFS_SOURCE it is pointless to
>> specify initramfs compression other than 'None'
>
> ?Hm, good point, we should probably change our initramfs setup to disable
> compression if the kernel image itself is compressed.

The compression option is useful anyway. This is from the kernel menuconfig:

config INITRAMFS_COMPRESSION_NONE
        bool "None"
        help
          Do not compress the built-in initramfs at all. This may
          sound wasteful in space, but, you should be aware that the
          built-in initramfs will be compressed at a later stage
          anyways along with the rest of the kernel, on those
          architectures that support this.
          However, not compressing the initramfs may lead to slightly
          higher memory consumption during a short time at boot, while
          both the cpio image and the unpacked filesystem image will
          be present in memory simultaneously

So in some situations were you have just enough memory, enabling
compression may get you to go through.
