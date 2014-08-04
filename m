From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Aug 2014 23:04:03 +0200
Subject: [Buildroot] manipulating raw disk images as non-root user
In-Reply-To: <CAE9DZUThNrdD2AOHwsJRZG6fJh3=MRGe+Ggnh4ZrRxgXatJvWA@mail.gmail.com>
References: <CAE9DZUThNrdD2AOHwsJRZG6fJh3=MRGe+Ggnh4ZrRxgXatJvWA@mail.gmail.com>
Message-ID: <20140804210403.GG3875@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dallas, All,

On 2014-08-02 11:45 -0500, Dallas Clement spake thusly:
> I am trying to figure out a way to produce a uSD card image file during my
> build process and do it as a non-root user.  I am hoping to do this from a
> post image script.
> 
> I can create the image file with dd and partition it with parted as a
> non-root user.  However, I have not figured out how to format, and populate
> the image file.  Tools such as kpartx and losetup seem ideal for this
> purpose except that they must be run as root.
> 
> Does anyone know of a way to do this using qemu or fuse or related tools?

Well, as already pointed out, we do have a few host tools just for that
kind of usage, in the "Host utilities" sub-menu.

Also, if you want to have a look, I make use of those tools in my
Buildroot.config project:
    http://ymorin.is-a-geek.org/git/buildroot.config/

You may want to have a look at:
    http://ymorin.is-a-geek.org/git/buildroot.config/tree/scripts/genimages.d
and the subfolders for how to use those tools.

Note that all the scripts there in are part of a bigger infra. Feel free
to poke around the project tree.

(Warning: no doc, bleeding edge, unstable, no support... ;-) )

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
