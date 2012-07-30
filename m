From: Avery Pennarun <apenwarr@gmail.com>
Date: Mon, 30 Jul 2012 17:34:00 -0400
Subject: [Buildroot] populating an initramfs
In-Reply-To: <CAE9DZURcJ-4nb5-xA+yVyLf8msVr=ca6DAX2ZTY_OD0w+1n6vQ@mail.gmail.com>
References: <CAE9DZURcJ-4nb5-xA+yVyLf8msVr=ca6DAX2ZTY_OD0w+1n6vQ@mail.gmail.com>
Message-ID: <CAHqTa-0Ek0+Tc8E6TgcS9acDe6NDhABoHadxEdRArKf3WurzWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 30, 2012 at 5:13 PM, Dallas Clement
<dallas.a.clement@gmail.com> wrote:
> Forgive me in advance for asking a newb question.  I'm in the process
> of converting from Yocto/OE.
>
> I have the need to populate both an initramfs as well as a rootfs with
> the contents of packages I build using buildroot.  What is the best
> way to do this?   Should I create two separate projects, one for the
> initramfs and one for the rootfs?  Or is there a way to select which
> contents go in each and keep it all in the same project?

What we did on our project is we made a new package that we called
simpleramfs.  It hand-copies a specific list of filenames from the
"real" output/target/ directory into the simpleramfs project, then
generates an initramfs cpio in time for the kernel to be compiled.

We experimented with building twice (once for initramfs and once for
rootfs), but that's both slow and a maintenance nightmare, and
resulted in much huger initramfs than we wanted (as well as a lot of
duplication between initramfs and rootfs).

Hope this helps.

Have fun,

Avery
