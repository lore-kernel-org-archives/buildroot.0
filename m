From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jan 2014 18:17:02 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #5 (deadline
 January 19)
In-Reply-To: <20140105162014.GA16066@free.fr>
References: <CAAXf6LVcK-fx059K=tetV=NY78amOHczPkbVxkO1pKAuvDCwtA@mail.gmail.com>
 <20140105162014.GA16066@free.fr>
Message-ID: <20140105171702.GC16066@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Floris, All,

On 2014-01-05 17:20 +0100, Yann E. MORIN spake thusly:
> On 2014-01-05 17:01 +0100, Thomas De Schampheleire spake thusly:
> > Here is the session 5 of the patchwork cleanup.
[--SNIP--]
> > [1/2] makebootfat: new package
> > Floris Bos <bos@je-eigen-domein.nl>
> > http://patchwork.ozlabs.org/patch/213112
> 
> I'm not sure we need that one. We already have:
>   - host-dosfstools to generate (empty) fat filesystems in a image file;
>   - host-mtools to add files to a fat filesystem, and it works with
>     image files.

It seems I've spoken a bit fast on that one. There's one thing this
package provides that is not provided by dosfstools or mtools: an MBR
bootcode.

However, we already have syslinux, which does provide an MBR bootcode.
It's currently not installed; it's just a matter of adding one more
option to syslinux, to install its MBR bootcode.

So, my previous position still stands: we already have the required
packages; no need to duplicate what we already have.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
