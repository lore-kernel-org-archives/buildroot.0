From: Michael Roth <mroth@nessie.de>
Date: Wed, 7 Oct 2009 12:26:31 +0200
Subject: [Buildroot] [PATCH 08/23] qt: remove no longer needed
	'x86x86fix' workaround
In-Reply-To: <20091007115514.4d9f36c7@surf>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-9-git-send-email-mroth@nessie.de>
	<20091007115514.4d9f36c7@surf>
Message-ID: <200910071226.37310.mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wednesday 07 October 2009 11:55:14 schrieb Thomas Petazzoni:
> Le Wed,  7 Oct 2009 11:20:31 +0200,
>
> Michael Roth <mroth@nessie.de> a ?crit :
> > Tested with 4.5.2.
>
> Are you sure about this ? This workaround was added in April 2009, when
> the Qt version we packaged was 4.5.0. Was it fixed in the mean time ?

Yes (at least, I think... ;-)


> Did you try a configuration with an x86/uClibc toolchain on an x86
> host ? I also remember from confusions between the mkspecs file to be
> used for compiling host tools and target tools/libraries.

I built on a x86 box a full cross-toolchain f?r x86/uClibc. I even compiled
the analogclock example from Qt and run it and it worked flawless.

From the Qt-configure output on this test:

	[...]
	Building on:   linux-g++
	Building for:  qws/linux-x86-g++
	Architecture:  i386
	Host architecture: i386
	[...]

So it looks like that Qt-configure is getting this fully right. I also 
read the configure-script from Qt and found no reason for this x86x86fix.
But I didn't checked older Qt version.


> Note: I'm absolutely unsure whether the workaround is needed. I'm just
> asking for simple clarifications, not trying to be offensive in anyway.

No problem.


Michael Roth
