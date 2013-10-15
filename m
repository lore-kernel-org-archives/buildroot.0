From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Oct 2013 13:59:06 +0200
Subject: [Buildroot] Ncurses wide support
In-Reply-To: <525D2D6E.9000108@zacarias.com.ar>
References: <CAAEAJfCkpC6-ZnpcxYCgTiZN8=QJNY+wZg83Jjyzs8-e7jPkkw@mail.gmail.com>
 <525D1693.3010509@zacarias.com.ar>
 <CAAEAJfD_YaKXY5cMn9H7DcUe3fyJ8L7wJ+RkmaOy40D0KmSZtw@mail.gmail.com>
 <20131015133626.180de72d@skate> <525D2D6E.9000108@zacarias.com.ar>
Message-ID: <20131015135906.10b43a4a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 15 Oct 2013 08:56:30 -0300, Gustavo Zacarias wrote:

> > Not sure to follow the original problem. If nano needs ncursesw, why
> > don't you enable wchar support in your toolchain so that ncursesw gets
> > built?
> 
> Because ncurses (upstream) just builds the narrow or wide versions, not
> both. Currently we build only the narrow version no matter what.
> And IIRC some packages don't expect the wide version even if the
> toolchain is WCHAR.

ncurses is crap :)

A possible solution would be to have a package/ncursesw/ in Buildroot,
that does the same thing as package/ncurses/, but builds the ncursesw
library. This way, packages who want one or the other variant of the
library can have proper dependencies.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
