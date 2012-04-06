From: PHilip RUshik <prushik@gmail.com>
Date: Fri, 6 Apr 2012 13:36:33 +0900
Subject: [Buildroot] customizing xorg package
In-Reply-To: <CALB96NmatmTxO=ZuOo_DVkw6bCBs19f9BuDDgWr_cSHn-OgE9g@mail.gmail.com>
References: <CALB96NmatmTxO=ZuOo_DVkw6bCBs19f9BuDDgWr_cSHn-OgE9g@mail.gmail.com>
Message-ID: <CAGmOteO=tp1o2cF7meTjX3G3ten7ARWept1jNv7ah7z6aa_9tA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 6, 2012 at 6:54 AM, Dechesne, Nicolas <n-dechesne@ti.com> wrote:

> hi there,
>
> i am starting to look into building a distro with X and h/w accelerated
> drivers for pandaboard, with buildroot. i never really built Xorg with
> buildroot before. so after looking around, it seems that buildroot has
> packages ready for X11R7.6. however i would need to use 7.6 with some
> customization, like a more recent xserver version. debian/ubuntu allow such
> combination because they build each X component using the 'individual'
> releases, instead of the global X11R7.x release.
>
> so my questions are:
>
> - has anyone already tried to build a modular X11 with  buildroot with
> similar customization (e.g. from individual packages, not full release)?
> - would that be interesting to get that into buildroot (assuming I or
> someone here can come up with the patches for this...)?
> - if there is an interest, has someone thought about the best way to do
> that? i can try to give this some thinking, but if there is some work i can
> reuse it's always better...
>
> thx
>
> nico
>
>
I'm pretty sure it does build all the different components the same way
that you would without buildroot. Look at the packages in
buildroot/package/x11r7/ it should all be there, the libraries are prefixed
with xlib_ If you want to change only the version, then just change it in
buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk. It's
pretty easy.

--PHil
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120406/ddcc94e6/attachment-0001.html>
