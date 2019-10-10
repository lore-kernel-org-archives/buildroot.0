From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 10 Oct 2019 13:22:35 +0200
Subject: [Buildroot] [PATCH 09/30] package/musl-fts: new package
In-Reply-To: <e1783520-5f18-5bd5-5de6-55825cdb32a9@mind.be>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
 <20190922090646.15130-10-thomas.petazzoni@bootlin.com>
 <e1783520-5f18-5bd5-5de6-55825cdb32a9@mind.be>
Message-ID: <20191010112234.GB17136@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

>  Now this is applied, a couple of additional packages/options might be enabled
> as well...

> - clamav's --disable-fanotify might be removed;
> - elfutils has a huge patch to add fts which might be removed;
> - libcgroup;
> - ltp-testsuite depends on !MUSL; neither the Config.in nor commit baedef979cda
> explain why exactly, but it might be due to fts.
Thanks for adding musl-fts, I was thinking about it.

ATM LTP on musl is not blocked by missing fts.h (I need to update that comment
in ltp-testsuite.mk), just cpuset tests aren't compiled if it's not available.
But it'd be nice to select it for uclibc to have these tests compiled.
Feel free to do it or I'll do it (hopefully soon).

LTP under musl itself has more problems. These are mainly caused by some old and
dirty code which depends on glibc specific features (we're slowly rewriting
these tests which fixes it). Some of these problems are on uclibc as well,
Waldemar Brodkorb solved it with just deleting problematic parts. For previous
release I enabled LTP for musl using the same way (more tests needed to be
deleted). I thought I posted it, but it looks like I didn't. I'll update the
patch and send it again.

Kind regards,
Petr
