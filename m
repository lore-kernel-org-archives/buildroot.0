From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jan 2014 18:50:08 +0100
Subject: [Buildroot] [PATCH 3/5] board/raspberrypi: provide partition
 description for the new genimages
In-Reply-To: <CAGduivzo5nQ8V6FGPvG3OPRT5SxHqDGtL_i76yFhmja+r6sFCg@mail.gmail.com>
References: <cover.1388768519.git.yann.morin.1998@free.fr>
 <ac4d914078b3e77edc1704e0ada84c4fa8ef57f5.1388768519.git.yann.morin.1998@free.fr>
 <CAGduivyP4sdDKUpSG4ZJcfV5b5S7gipteUd=gFsWZ=_KfOMk7A@mail.gmail.com>
 <20140104170530.GB3417@free.fr>
 <CAGduivzo5nQ8V6FGPvG3OPRT5SxHqDGtL_i76yFhmja+r6sFCg@mail.gmail.com>
Message-ID: <20140104175008.GD3417@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-01-04 18:12 +0100, Maxime Hadjinlian spake thusly:
> On Sat, Jan 4, 2014 at 6:05 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2014-01-04 17:40 +0100, Maxime Hadjinlian spake thusly:
> >> On Fri, Jan 3, 2014 at 6:19 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >> > +partalign=$((1048576))
> >> > +size=$((32*1048576))
> >> > +mbr_type=$((0x83))
> >> > +size=$((9*1048576))
> >> > +mbr_type=$((0xc))
> >> Could you please add comments over the various size and also the
> >> different type used, 0x83 is not really user friendly to read.
> >
> > 0x83 and 0xc are partition types, and there is a pointer in the manual
> > for where to find their meanings and the different values:
> >
> >     * mbr_type (mandatory): the partition [type]
> >
> > where [type] is a pointer to:
> >     https://en.wikipedia.org/wiki/Partition_type#List_of_partition_IDs
> >
> > But I can add such comments as this is an example.
> Even if it's not an example.
> This kind of file are meant to be read by humans, and as such, every
> information such as partition type or size, should be along side a
> comments for the human reader.

<humour>
Sorry, but I can read 9*1048576 very easily. But I'm no good reference,
since I know by heart those powers of 2 up to about 16777216... :-p

As for 0x83 and 0xc, I have run fdisk so many a time that I know what
they mean, too! :-p
</humour>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
