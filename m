From: Woody Wu <narkewoody@gmail.com>
Date: Thu, 23 May 2013 11:19:14 +0800
Subject: [Buildroot] Does buildroot toolchain support GNU EABI?
In-Reply-To: <20130522173703.GB14196@free.fr>
References: <20130522092041.GA15526@zuhnb712.ap.bm.net>
 <CAGm1_kt83BK9b4vQqZpH+mjArK6SmbhdruUUEn4TSAUcS2JXXg@mail.gmail.com>
 <CAAsE_uenmk7_qFshg+8z=T4x+oEso143z0r_u8zbKdH10Z2gGQ@mail.gmail.com>
 <20130522173703.GB14196@free.fr>
Message-ID: <CAAsE_udQ_PgFX0257psjpuDuLmK-K8DteaY4eu7xdk1Yvq9PpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Understood.   Thanks a lot!


On 23 May 2013 01:37, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> Woody, All,
>
> On 2013-05-22 23:12 +0800, Woody Wu spake thusly:
> > ? 2013-5-22 PM5:34?"Yegor Yefremov" <yegorslists@googlemail.com>???
> > >
> > > On Wed, May 22, 2013 at 11:20 AM, Woody Wu <narkewoody@gmail.com>
> wrote:
> > > > Hi,
> > > >
> > > > I found my buildroot toolchain is using EABI version 5. But I want to
> > > > create executable run an existed system that is using GNU EABI.
> > > >
> > > > Actuall, I don't know what GNU EABI is.  Can I configure buildroot to
> > > > support this? And, how?
> > >
> > > BR toolchains are always EABI unless you specify it to generate OABI
> > > binaries. See Wikipaedia for EABI info:
> > > http://en.wikipedia.org/wiki/EABI#EABI
> > >
> > > Yegor
> >
> > Hi, Yegor
> >
> > When I compile my new program using buildroot toolchain and link it to a
> > old shared library buit from another uClibC toolchain, it reported EABI
> > version mismatch. My new program is EABI version 5, and the expected to
> be
> > linked (-lfoo) is EABI version 0. When using readelf to check the library
> > file, it reported it's GNU EABI.  That why I thought I should try to make
> > my buildroot to generate GNU EABI object.  If I messed some concept,
> could
> > you please tell me what should I do?
>
> I don't know the details but "GNU EABI" (aka "EABI v0") was following
> the draft EABI (there's also EABIv4 floating around with the same
> shortcomings), and was incompatible with the final EABI. That's more or
> less what I understood myself (but I may be wrong).
>
> So, today's toolchains do not produce EABIv0 (nor EABIv4) binaries, only
> EABIv5; this is the case for Buildroot-built toolchains.
>
> If you want to target these libraries, you have to use the same toolchain
> as was used to build your library. Buildroot won't be able to build one
> for you.
>
> Besides, if you wanted to build such a toolchain, you'd have to use the
> tools that were current at the time, not the latest versions.
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>     |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
> conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>



-- 
Life is the only flaw in an otherwise perfect nonexistence
    -- Schopenhauer

narke
public key at http://subkeys.pgp.net:11371 (narkewoody at gmail.com)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130523/a4a7a970/attachment-0001.html>
