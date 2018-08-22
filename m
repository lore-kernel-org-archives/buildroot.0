From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Aug 2018 19:21:34 +0200
Subject: [Buildroot] [PATCH 2/2] Adding btrfs rootfs option.
In-Reply-To: <20180822165751.GB2404@scaer>
References: <20180821160412.28757-1-robert.heywood@codethink.co.uk>
 <20180821160412.28757-2-robert.heywood@codethink.co.uk>
 <20180821202707.GP15347@scaer>
 <d8c27acc-81be-e5f2-08d1-c80a3f9d9a96@codethink.co.uk>
 <20180822165751.GB2404@scaer>
Message-ID: <20180822172134.GC2404@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robert, All,

On 2018-08-22 18:57 +0200, Yann E. MORIN spake thusly:
> On 2018-08-22 14:10 +0100, Robert Heywood spake thusly:
> > On 21/08/18 21:27, Yann E. MORIN wrote:
[--SNIP--]
> > >Given that the filsystem is specifically made for the target that will
> > >mount it, does it make sense to ffer that option at all? I.e. if the
> > >target uses a 4KiB page size, does it make sense to generatea rootfs
> > >that has a different secotr size, and thus not mountable on the target
> > >at all?
> > >
> > >My suggestion: don't add that option.
> > 
> > On my system (building for a raspi0) it autodetects the sector size to be
> > 4k, and the resulting image is bootable. However I'm worried the host won't
> > be able to detect the correct value for the target. In such a case I can see
> > why it would be useful to set the sector size explicitly.
> 
> Well, basically all architectures have a 4K page size, so does your
> x86_64 and so does the rpi (0/1/2/3), so the default for your host is
> valid for your target.
> 
> What architectures have a page-size that is not 4K?

After discussing on IRC with Paul (Cc), it turns out that quite a few
architectures can have a page size different from 4K, like mips, arc and
a few others. Sometimes it is even configrable. Thanks Paul.

4K just happens to be the most common, but definitely not the only one.

> > Is there another place where the sector size is specified? If so, it might
> > be better to use the existing value instead.
> I would also add a default here, to 4096. Users who want to change
> that value would know what they would be doing.

So yeah, just keep that option, and let set the default to 4K. People
who have a non 4K arch or kernel option will know to change that value.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
