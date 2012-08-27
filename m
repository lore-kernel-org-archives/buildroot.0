From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 27 Aug 2012 12:52:23 +0200
Subject: [Buildroot] [PATCH] schifra: new package
In-Reply-To: <20120825172140.4b4cdda7@skate>
References: <1345801194-28735-1-git-send-email-spdawson@gmail.com>
 <20120825172140.4b4cdda7@skate>
Message-ID: <503B5167.2060501@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Le Fri, 24 Aug 2012 10:39:54 +0100,
> spdawson at gmail.com a ?crit :
>
>> +SCHIFRA_LICENSE = schifra license
>> +SCHIFRA_LICENSE_FILES = schifra_license.txt
>
> Shouldn't we put something like "GPLv2 or commercial" here? Apparently,
> their license is: GPLv2 is you do something open-source, otherwise if
> you want to link in a proprietary application, you need to buy a
> commercial license. I would at least like to have explicitly "GPLv2"
> mentioned here as it would more clearly raise the attention of people
> checking the license compatibility of the libraries they are using.
>
> Luca, thoughts?

Disclaimer: I'd like remind everybody I'm not a lawyer. I implemented
the legal-info feature in Buildroot, but do not consider my views about
licensing as legal advice. These are only my interpretations of the
various package licenses (which happen to be very fancy sometimes!).

GPL licenses natively imply that you cannot use the code in a proprietary
application (unless you obtain a license otherwise, of course). This used
to be the case for Qt before Nokia released them under the LGPL. This is
also the case of other libraries, such as eXosip:
(http://git.savannah.gnu.org/cgit/exosip.git/tree/COPYING).

But schifra has a more restrictive (and a bit ambiguous, IMHO) license.
They grant a GPLv2 license only "within an open source, academic or other
noncommercial/not-for-profit environment"
(http://www.schifra.com/license.html).

So, a for-profit company might ship a device containinga "regular"
GPL-licensed library (e.g. eXosip), plus a GPL application using it (e.g.
Linphone), plus a proprietary application not using that library.

But for schifra this is not the case: even though all code using schifra
is GPL, if it lives in a commercial device side-by-side to a proprietary
application not using schifra, this breaks the schifra license.

Since most embedded devices in the world are built in a commercial
environment, I think it is very difficult to use schifra in the embedded
world without buying a license. But this is not a problem of mine, of
course.

Bottom line, how to encode all of this in SCHIFRA_LICENSE is a challenge.
"GPLv2 only for open source, academic, noncommercial, not-for-profit" is
not concise, but quite informative. "General Schifra License agreement",
which is how they name it in  schifra_license.txt, is the safest option,
and an invitation to potential users to read such a convoluted piece of
licensing literature and learn how not to license a package...

Luca
