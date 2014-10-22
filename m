From: Ray Cordova <rayzinpwr@gmail.com>
Date: Wed, 22 Oct 2014 13:16:58 -0700
Subject: [Buildroot] SERIOUS bug in coreutils / cut command
In-Reply-To: <5447FC33.4060007@zacarias.com.ar>
References: <CAKat-EbixBqGzvLhR_utUyWKTknWF3S7=TNqfJJai1JfgOohkQ@mail.gmail.com>
 <5447FC33.4060007@zacarias.com.ar>
Message-ID: <CAKat-EaReet=FyKzHhVZwWDbNqGFQ_y-P17sW0Sk-q7=2hkpqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I started with all default configs, then tweaked and added packages. Both
are arch i386. One kernel is i686 and the other is for a Via C3-2
processor. I'm currently running them both on vmware. One is vmware
workstation 9 and the other is ESXi 5.5. The toolchain is the default.

On Wed, Oct 22, 2014 at 11:49 AM, Gustavo Zacarias <gustavo@zacarias.com.ar>
wrote:

> On 10/22/2014 03:06 PM, Ray Cordova wrote:
>
> > Hello,
> >
> > echo "word1 word2 word3" | cut -d' ' -f1
> >
> > word1
> >
> > echo "word1 word2 word3" | cut -d' ' -f2
> >
> > wword2 <-- ??!?!??
> >
> > Yes, it really is 'wword2'.
> >
> > echo "word1 word2 word3" | cut -d' ' -f3
> >
> > word3
> >
> > This is the September 1st, 2014 release. Coreutils 8.22. Two different
> > builds, same versions, same bug.
>
> Hi.
> Works fine for me with latest git (same coreutils) using the
> qemu-arm-versatile sample defconfig with the latest available external
> toolchain.
> How about a little more detail of architecture, toolchain and so on?
> (i.e. savedefconfig defconfig)
> Regards.
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141022/6c21e2c7/attachment.html>
