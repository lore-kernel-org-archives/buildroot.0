From: Matthew Weber <matt@thewebers.ws>
Date: Tue, 7 Aug 2012 10:39:02 -0500
Subject: [Buildroot] Prebuilt concept
In-Reply-To: <CAHXCMMKfgsM8JAdN=vbtmt2JPv1OSccq7SCYQRVpisqAg8HLyg@mail.gmail.com>
References: <CAFt09wNhCtxZcG63uJ8iCuaLeSWEMZrFRd-VuoNw3cTPkFXGAg@mail.gmail.com>
 <CAHXCMMKfgsM8JAdN=vbtmt2JPv1OSccq7SCYQRVpisqAg8HLyg@mail.gmail.com>
Message-ID: <CAFt09wMkzusGNstiUyX-WN18PtzRvwUhu6EU7ww204sVXPW9eQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yeah, that's my thought exactly.  I'll post my results later today.

rm output/build/.root
rm -rf output/target
find output/build/* -name "*target_installed" -type f -exec rm -f {} \;
make

Thanks!

On Tue, Aug 7, 2012 at 10:28 AM, Samuel Martin <s.martin49@gmail.com> wrote:

> Hi Matthew,
>
> 2012/8/7 Matthew Weber <matt@thewebers.ws>:
> > My problem is overall build time for recreating the large # of packages
> I'm
> > building.  When I perform a verification of the target rootfs for a
> release,
> > I really just need it to recreate the output/target folder and don't
> need to
> > do a complete rebuild.  Has anyone tried to trick buildroot into just
> > re-installing the target folder using all the existing (built) packages?
>
> A solution could be (not tested):
> rm -rf output/target && find output/build -name
> .stamp_target_installed -delete && make
>
> Cheers,
>
> --
> Sam
>



-- 
Thanks,
Matt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120807/c211a233/attachment.html>
