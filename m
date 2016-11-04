From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Nov 2016 22:27:27 +0100
Subject: [Buildroot] warp7_defconfig build error
In-Reply-To: <CAOMZO5AjUAJqMuny_xn3OHEhdvtiZwkAQB-zJcZDvFr+z=LVTA@mail.gmail.com>
References: <CAOMZO5CjVc=qA2u95KydQrLkkjTUZUdB8t+v_QdX-NViRJs4LQ@mail.gmail.com>
 <CAOMZO5AjUAJqMuny_xn3OHEhdvtiZwkAQB-zJcZDvFr+z=LVTA@mail.gmail.com>
Message-ID: <20161104212727.GB3766@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2016-11-04 18:38 -0200, Fabio Estevam spake thusly:
> On Fri, Nov 4, 2016 at 5:52 PM, Fabio Estevam <festevam@gmail.com> wrote:
> > Hi,
> >
> > Getting the following build error on a warp7_defconfig build with
> > latest mainline:
[--SNIP--]
> > /home/fabio/buildroot/output/host/usr/bin/pseudo --
> > /home/fabio/buildroot/output/build/_fakeroot.fs
> > Warning: PSEUDO_PREFIX unset, defaulting to
> > /home/fabio/buildroot/output/host/usr.
> > rootdir=/home/fabio/buildroot/output/target
> > table='/home/fabio/buildroot/output/build/_device_table.txt'
> > makedevs: line 23: Couldnt create node
> > /home/fabio/buildroot/output/target/dev/console: File exists
> > fs/ext2/ext2.mk:46: recipe for target
> > '/home/fabio/buildroot/output/images/rootfs.ext2' failed
> > make[1]: *** [/home/fabio/buildroot/output/images/rootfs.ext2] Error 1

We've recently switched to using pseudo instead of fakeroot (in an
attempt to solve #9286). But this is causing more problems.

We're investigating a solution, but it's not trivial.

In the meantime, you can try reverting ade91bc and 3cd88f1 (which we may
end up doing if we can't find a solution quickly).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
