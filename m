From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 23:40:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/alac: new package
In-Reply-To: <CAAj6r7pq7-oEbgVzNwDWDb74NFYWTxD=hYB-WnRmcrz_iiQBkQ@mail.gmail.com>
References: <20200727152720.8427-1-marc.chalain@gmail.com>
 <5f13e688-783b-40ef-fe4d-e8483b135fa4@gmail.com>
 <CAAj6r7pq7-oEbgVzNwDWDb74NFYWTxD=hYB-WnRmcrz_iiQBkQ@mail.gmail.com>
Message-ID: <20200907234027.35445e3f@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marc,

On Mon, 27 Jul 2020 18:36:47 +0200
Marc Chalain <marc.chalain@gmail.com> wrote:

> No in fact, I didn't find this library. I just looked for the original
> library from Apple.
> This library is used by shairplay, but it is integrated inside the source
> files.

I am sorry, but I don't really understand your answer. In the end, do
you need the alac package, or not ?

The alac library as available at
https://github.com/macosforge/alac/tree/master/codec indeed seems to be
the same as one integrated inside audiofile:
https://github.com/mpruett/audiofile/tree/master/libaudiofile/alac.

However, the alac code in shairplay seems vastly different:
https://github.com/juhovh/shairplay/tree/master/src/lib/alac.

Could you clarify why you need this alac package? For your message, it
seems like you wanted to package shairplay.. but shairplay has a
bundled version of alac, and this bundled version is apparently very
different from the official alac library, which means this separate
alac library can probably not be used by shairplay.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
