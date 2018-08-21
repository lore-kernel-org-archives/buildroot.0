From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 21 Aug 2018 23:07:59 +0300
Subject: [Buildroot] [PATCH 1/1] package/gettext-tiny: Add new package
In-Reply-To: <20180821193616.5634b4dc@windsurf>
References: <20180821142226.2309-1-vadim4j@gmail.com>
 <87r2irvljb.fsf@tkos.co.il> <20180821172913.1a7eb830@windsurf>
 <CAMw6YJ+FS=z0MQqWj3K-21QYR5m-20wE2RbfFHQnc1WdgrYwLA@mail.gmail.com>
 <20180821193616.5634b4dc@windsurf>
Message-ID: <CAMw6YJLASMAVyjqKs26zzzpxdpHV5ezQhaXu=nNyO3UwnQF-Yw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Aug 21, 2018 at 8:36 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Tue, 21 Aug 2018 18:51:00 +0300, Vadim Kochan wrote:
>
> > I got the point, so it is not really useful to add gettext-tiny just as a
> > package but integrate it
> > as gettext alternative. So let me clarify - you expect to see this at least
> > as series:
> > 1) add package
> > 2) integrate it as gettext alternative
>
> Yes, exactly. And as Baruch suggested, it would be excellent if we
> could also use host-gettext-tiny as an alternative to host-gettext.
>
> This will raise a few questions:
>
>  - There are a few packages that unconditionally need host-gettext. Is
>    this really true ?
Not sure about this)

>
>  - Some packages need host-gettext because of the AM_ICONV m4 macro
>    provided by gettext.m4. Is gettext-tiny also providing the
>    gettext-related m4 macros ?
Yes it has some set of m4 macrosses, but it needs to be tested how it
works for the buildroot.

What if I will start from converting gettext package into the virtual
one (with renaming the original
gettext -> gettext-gnu)  ? And after I will try to add gettext-tiny as
gettext provider.

Regards,
Vadim Kochan
