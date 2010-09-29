From: Martin Banky <Martin.Banky@gmail.com>
Date: Wed, 29 Sep 2010 12:59:33 -0700
Subject: [Buildroot] Libtool work: a tentative summary
In-Reply-To: <AANLkTikZEe+tS3WtxULNLNq80QrVRy0U5XWzneRcHRnw@mail.gmail.com>
References: <20100928223652.6dc72083@surf>
	<AANLkTi=Sf1+acAXfCgJcTv+4Yrtw0nEH+_Ugv3+0dVk0@mail.gmail.com>
	<20100929105151.76bd6230@surf>
	<AANLkTikZEe+tS3WtxULNLNq80QrVRy0U5XWzneRcHRnw@mail.gmail.com>
Message-ID: <AANLkTik068UsF1Pjb+4HOB5j2VUewvcu4vL_sKwBR84r@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the libtool heads up patch that I had sent, I didn't include some of the
preliminary work that I've been doing with libtool 2.4. I've been taking the
approach of both our methods. I'm autoreconfiguring the packages that don't
have issues, and patching the others with a modified
Makefile.autotools.inthat recognizes both 1.5 and 2.2 ltmain.sh files
and ignores the 2.4 ones.
If I remember correctly, the packages that I've had issues with
autoreconfiguring are expat, libusb, and libvorbis. I've not done a full
package build yet. I feel that Lionel has spent far more time on his
solution, than I have on mine. For me, I discovered the
buildroot-libtool.patch issue when I started upgrading some of the packages,
and didn't want to keep including a v2.2 patch for every package that needed
it. So, I just came up with this fast and easy method to solve this issue.
Currently, I'm working on converting the rest of the packages to either
autotargets or gentargets, and was planning on looking at incorporating
libtool 2.4 after this. That is, if Lionel hasn't already done something by
then.

Martin

On Wed, Sep 29, 2010 at 4:01 AM, Paulius Zaleckas <
paulius.zaleckas@gmail.com> wrote:

> On Wed, Sep 29, 2010 at 11:51 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello Paulius,
> >
> > On Wed, 29 Sep 2010 11:32:29 +0300
> > Paulius Zaleckas <paulius.zaleckas@gmail.com> wrote:
> >
> >> I would go for a conservative solution.
> >> The main reason here is compile speed.
> >> Currently my configuration takes ~1 hour to compile on my 4x3.4GHz
> >> machine with DDR3 RAM...
> >
> > Are you using internal toolchain or external toolchain ?
>
> internal
>
> >> The worst part here is that autoreconfigure and ./configure scripts
> doesn't
> >> scale on multicore CPU :(
> >> So adding a lot more autoreconfigure usage would drastically reduce
> >> build time.
> >
> > Thanks for your feedback.
> >
> > For what it's worth, I've started to experiment the modification of our
> > package infrastructure in order to use real file targets instead of
> > phony targets for the steps sequencing (download -> extract -> patch ->
> > configure, etc.). This is one of the requirements to be able to do
> > top-level parallel builds, which I think, definitely becomes necessary
> > to parallelize the autoreconf/configure steps of packages. This is
> > however a lot of work, and I don't expect this to be ready anytime soon.
> >
> > Regards,
> >
> > Thomas
> > --
> > Thomas Petazzoni, Free Electrons
> > Kernel, drivers, real-time and embedded Linux
> > development, consulting, training and support.
> > http://free-electrons.com
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100929/ccb86115/attachment.html>
