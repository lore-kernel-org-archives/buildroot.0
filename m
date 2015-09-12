From: Doha Ehab <dohaehab@gmail.com>
Date: Sat, 12 Sep 2015 19:53:15 +0300
Subject: [Buildroot] using buildroot to statically build uclibc
In-Reply-To: <55F4314D.80606@mind.be>
References: <CAEjFr-Zk4HTs7NPYOtheUzGbHVtZmmAb5daRR_MrW4yS22daGA@mail.gmail.com>
 <55F4314D.80606@mind.be>
Message-ID: <CAEjFr-YUow8iFvMhv-DK3y390P3HunZD4nMUUpREMzk-2NtgWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So in order to use the generated uclibc to cross compile mpich (and link
everything statically) I have to extract the rootfs.tar and use it to
statically build the mpich is that correct ?

Regards,
Doha.

On Sat, Sep 12, 2015 at 5:06 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:

> On 11-09-15 11:50, Doha Ehab wrote:
> > Hello ,
> >  I am trying to statically build uclibc using buildroot to use it to
> cross
> > compile mpich . when I generate uclibc toolchain using make menuconfig
> the
> > executables in output/usr/host/bin are dynamically linked .
>
>  output/usr/host/bin contains executables for the host. These are linked
> dynamically and have an rpath setting to make sure the correct libraries
> are
> found in output/usr/host/lib.
>
>  The executables on the target (output/target and output/images) should be
> statically linked.
>
>  There is no way in buildroot to link the host binaries statically.
>
>  Regards,
>  Arnout
>
> > do I have to build uclibc from output/build/toolchain folder in order to
> get the
> > statically linked executables .
> > I'm new to this if I'm missing something kindly direct me .
> >
> > Regards,
> > Doha
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150912/ca44cc57/attachment.html>
