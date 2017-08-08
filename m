From: Eugene Yudin <e.yudin@ndmsystems.com>
Date: Tue, 8 Aug 2017 22:07:26 +0300
Subject: [Buildroot] buildroot uClibc-ng build failure
In-Reply-To: <298e3d5a-5994-3704-fba6-d292d32bfd4c@dawncrow.de>
References: <20170803054828.GB7682@waldemar-brodkorb.de>
 <20170803092346.02d02371@windsurf.home>
 <CAPmKWpEX5YNKAgi-SbFh_4k3yvYBDMhhPB4Rm8W7m9ZQa0LELA@mail.gmail.com>
 <298e3d5a-5994-3704-fba6-d292d32bfd4c@dawncrow.de>
Message-ID: <CAPmKWpEnqQEiUjjjYDkGiwtvGu-4XmCmrK04sbVQzJdCOff-gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes. Please install the locale "en_US.UTF-8".
It's used in buildroot by default:
package/uclibc/uclibc.mk:46:UCLIBC_LOCALES = en_US

On Tue, Aug 8, 2017 at 7:52 PM, Andr? Hentschel <nerv@dawncrow.de> wrote:

> Am 03.08.2017 um 10:11 schrieb Eugene Yudin:
> > Hi Thomas,
> >
> >> Is this check insufficient now ?
> > I think it's sufficient.
> >
> > Please post output of the following commands:
> > $ locale
> > $ locale -a
> > $ cat /etc/os-release
> $ locale
> LANG=de_DE.utf8
> LANGUAGE=de_DE.utf8
> LC_CTYPE="de_DE.utf8"
> LC_NUMERIC="de_DE.utf8"
> LC_TIME="de_DE.utf8"
> LC_COLLATE="de_DE.utf8"
> LC_MONETARY="de_DE.utf8"
> LC_MESSAGES="de_DE.utf8"
> LC_PAPER="de_DE.utf8"
> LC_NAME="de_DE.utf8"
> LC_ADDRESS="de_DE.utf8"
> LC_TELEPHONE="de_DE.utf8"
> LC_MEASUREMENT="de_DE.utf8"
> LC_IDENTIFICATION="de_DE.utf8"
> LC_ALL=de_DE.utf8
>
> $ locale -a
> C
> C.UTF-8
> de_DE.utf8
> POSIX
>
> OS is Ubuntu 14.04.5 LTS
> Should I install the english locale?
>



-- 
Best regards,
Eugene
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170808/0197ea4b/attachment.html>
