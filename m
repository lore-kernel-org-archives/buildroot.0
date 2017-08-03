From: Eugene Yudin <e.yudin@ndmsystems.com>
Date: Thu, 3 Aug 2017 12:48:10 +0300
Subject: [Buildroot] Fwd:  buildroot uClibc-ng build failure
In-Reply-To: <CAPmKWpEX5YNKAgi-SbFh_4k3yvYBDMhhPB4Rm8W7m9ZQa0LELA@mail.gmail.com>
References: <20170803054828.GB7682@waldemar-brodkorb.de>
 <20170803092346.02d02371@windsurf.home>
 <CAPmKWpEX5YNKAgi-SbFh_4k3yvYBDMhhPB4Rm8W7m9ZQa0LELA@mail.gmail.com>
Message-ID: <CAPmKWpH7PgK0410BXoEhFDLtc-6J0=4-c4wu_cicSsptbpUseQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I resent the mail.
Previous was rejected by mailing list.
Sorry for duplication.

---------- Forwarded message ----------
From: Eugene Yudin <e.yudin@ndmsystems.com>
Date: Thu, Aug 3, 2017 at 11:11 AM
Subject: Re: [Buildroot] buildroot uClibc-ng build failure
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>, Andr? Hentschel <nerv@dawncrow.de>,
devel at uclibc-ng.org, buildroot at buildroot.org


Hi Thomas,

> Is this check insufficient now ?
I think it's sufficient.

Please post output of the following commands:
$ locale
$ locale -a
$ cat /etc/os-release

It would be very helpful to reproduce build failure.

On Thu, Aug 3, 2017 at 10:23 AM, Thomas Petazzoni <thomas.petazzoni@free-
electrons.com> wrote:

> Hello,
>
> On Thu, 3 Aug 2017 07:48:28 +0200, Waldemar Brodkorb wrote:
>
> > we are seeing a build error on your machine when
> > locales in uClibc-ng are enabled:
> > http://autobuild.buildroot.net/results/d5b/d5ba81eea9223569b
> a5b363551c4a2f7044ff8ec/
> >
> > Can you show us locale -a from your machine?
> >
> > For a working tolower(), the uClibc-ng code needs to use setlocale
> > on the host.
> >
> > But it seems only these are tried to use:
> > en_US en_US en_GB
>
> It is worth mentioning that Buildroot is already checking that at least
> one UTF-8 locale is available on the host machine, for the needs of
> uClibc locale support. From support/dependencies/dependencies.sh:
>
> if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
>         if ! which locale > /dev/null ; then
>                 echo
>                 echo "You need locale support on your build machine to
> build a toolchain supporting locales"
>                 exit 1 ;
>         fi
>         if ! locale -a | grep -q -i utf8$ ; then
>                 echo
>                 echo "You need at least one UTF8 locale to build a
> toolchain supporting locales"
>                 exit 1 ;
>         fi
> fi
>
> And the only package selecting BR2_NEEDS_HOST_UTF8_LOCALE is:
>
> package/uclibc/Config.in:       select BR2_NEEDS_HOST_UTF8_LOCALE
>
> Is this check insufficient now ?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>



-- 
Best regards,
Eugene



-- 
Best regards,
Eugene
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170803/7b16e1e1/attachment.html>
