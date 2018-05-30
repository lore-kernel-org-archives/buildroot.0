From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 May 2018 18:24:20 +0200
Subject: [Buildroot] [PATCH 1/2] configs/stm32f429: force usage of
 BINUTILS 2.28.x
In-Reply-To: <5d5e71dc-66ad-3a09-9e1e-863df0de89f2@gezedo.com>
References: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
 <20180529233219.0eca0f54@windsurf.home>
 <5d5e71dc-66ad-3a09-9e1e-863df0de89f2@gezedo.com>
Message-ID: <20180530162420.GC2592@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Laurent, All,

On 2018-05-30 14:12 +0200, Laurent GONZALEZ spake thusly:
> On 29/05/2018 23:32, Thomas Petazzoni wrote:
> > On Tue, 29 May 2018 12:09:27 +0000, Christophe PRIOUZEAU wrote:
> > So in fact the proposal that was made back in April at
> > http://lists.busybox.net/pipermail/buildroot/2018-April/219223.html was
> > in the end better.
> Similarly, one can argue that this patch impacts every software, whereas
> only linux kernel is not compatible with newer binutils.

That's not true, as other packages have been reportedly broken as well,
namely libavcodec and openssl (at least):
    http://lists.infradead.org/pipermail/linux-arm-kernel/2017-November/543467.html

So, it's not just about the kernel; virtually any package that has some
ARM/Thumb assembly is impacted.

But once those packages are fixed upstream, well eventually get an
updated version in Buildroot, which fixes that issue, and in the end,
only the kernel wil end up being impacted (because there are so many
older kernels out there in the wild...).

Regards,
Yann E. MORIN.

> Using this kernel patch may help to only fix what need to be fixed:
> 
> http://lists.infradead.org/pipermail/linux-arm-kernel/2018-March/565390.html
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
