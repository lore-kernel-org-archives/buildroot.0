From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 May 2016 16:19:10 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-05-13
In-Reply-To: <20160514154655.57ae0bad@free-electrons.com>
References: <20160514063024.2C7B91025E9@stock.ovh.net>
 <20160514154655.57ae0bad@free-electrons.com>
Message-ID: <20160514161910.309e5f33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 May 2016 15:46:55 +0200, Thomas Petazzoni wrote:

> >      powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1b8ace1a083b419c1ab913fda0d36a1d2d910f13/
> >       xtensa | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/5bb304c91367f1570903c8c527b387c65e572e56/
> >      powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/5f6cacf3125518d8c071397582569c659461690a/  
> 
> This was due to an issue building on big endian systems, I'm about to
> send a patch that fixes it.

Patch available at http://patchwork.ozlabs.org/patch/622247/

> >          arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/445a401da2f63a6c43d7c166516287db6cc977ab/  
> 
> Caused by using PIE, which requires Scrt1.o, which isn't available in
> our uClibc toolchains. Since we don't really need PIE support, I've
> sent a patch that disables it.

Patch available at http://patchwork.ozlabs.org/patch/622248/

> >          arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/96a280a8115cd01d64670e4caf2471d3ee4581d9/
> >          arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/43babb56cf9860ac60e51452d2f9362fc4a331e2/
> >       x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/cd064a8bcb297ba47168bde44cefeb2db9721cc6/  
> 
> musl build issue, due to the usage of <error.h>. I'm tempted to simply
> mark the package as not available on musl.

Patch available at http://patchwork.ozlabs.org/patch/622249/


> >          arc |                        unknown | NOK | http://autobuild.buildroot.net/results/ae3cbba85934100f7f4dc7361de544f87d84d433/
> >          arm |                        unknown | NOK | http://autobuild.buildroot.net/results/21e45cee04fd983c85c6702595ee3f7ed8470931/  
> 
> Some dependency problem.

Patch available at http://patchwork.ozlabs.org/patch/622250/

Review welcome :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
