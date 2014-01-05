From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jan 2014 17:20:14 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #5 (deadline
 January 19)
In-Reply-To: <CAAXf6LVcK-fx059K=tetV=NY78amOHczPkbVxkO1pKAuvDCwtA@mail.gmail.com>
References: <CAAXf6LVcK-fx059K=tetV=NY78amOHczPkbVxkO1pKAuvDCwtA@mail.gmail.com>
Message-ID: <20140105162014.GA16066@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-01-05 17:01 +0100, Thomas De Schampheleire spake thusly:
> Here is the session 5 of the patchwork cleanup.
[--SNIP--]
> [1/1,v2] Hide issue and hostname menu when using a custom skeleton.
> Sagaert Johan <sagaert.johan@skynet.be>
> http://patchwork.ozlabs.org/patch/211644

Since I've already been involved in that one, I'll handle it.
It needs a bit of a refresh.

> [1/2] makebootfat: new package
> Floris Bos <bos@je-eigen-domein.nl>
> http://patchwork.ozlabs.org/patch/213112

I'm not sure we need that one. We already have:
  - host-dosfstools to generate (empty) fat filesystems in a image file;
  - host-mtools to add files to a fat filesystem, and it works with
    image files.

For example, I use it as thus:
http://ymorin.is-a-geek.org/git/buildroot.config/tree/scripts/genimages.d/fs/vfat

So I suggest we just drop makebootfat, there's no need to duplicate our
host packages.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
