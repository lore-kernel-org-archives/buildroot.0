From: David De Grave <david.degrave@mind.be>
Date: Thu, 2 Aug 2018 13:49:15 +0200
Subject: [Buildroot] [PATCH v2 1/1] boot/uboot: missing dtc build
 dependency
In-Reply-To: <af3ceed9-cf95-a656-9df4-c6a0cf50fa82@mind.be>
References: <20180801143336.25420-1-david.degrave@mind.be>
 <af3ceed9-cf95-a656-9df4-c6a0cf50fa82@mind.be>
Message-ID: <CAD6XyYxv5wkiGA-=KEoUcXJqdG-MRW5bRr9rTHC39qY7hDkJhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, Aug 2, 2018 at 12:45 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:

> >
> > So better to keep using the U-Boot provided dtc and add a patch to fix
> > this issue by adding a dependency on OF_CONTROL for OF_LIST and
> > by selecting DTC for MULTI_DTB_FIT in dts/Kconfig.
>
>  Unfortunately, since the U-Boot version is user-selectable, adding
> patches for
> some random version doesn't make a whole lot of sense.
>
>  In this particular case, it's easily solvable by adding
> CONFIG_OF_CONTROL=y to
> your custom config fragment. Still, it would be good to send the patch
> below
> upstream to U-Boot itself, because it's still not fixed in the latest
> version
> AFAICS.
>

Indeed, I tested the last version and there is the same problem...
Ok so, just forget about this patch then.


> > --- /dev/null
> > +++ b/boot/uboot/2018.01/0001-missing-dtc-dependency-in-kconfig.patch
> > @@ -0,0 +1,19 @@
>
>  You should use a git-formatted patch, i.e. clone the U-Boot git repo,
> check out
> the particular version you want to patch, commit your modification, and
> make
> sure there is a proper commit message + SoB.
>
>  For sure, the patch *must* have a description and a SoB line.
>

Ok thanks to point this out, I didn't know.
I will do it that way next time such a case happens. Thx.

Regards,
David.

-- 

*David De Grave*
Senior Embedded Software Developer
Gsm : +32(0)496.364.960 | Tel : +32-16-28.65.00 | Fax : +32-16-28a.65.01
Essensium-Mind <https://www.mind.be/> - Gaston Geenslaan 9, B-3001 Leuven,
Belgium
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180802/3dcb9003/attachment.html>
