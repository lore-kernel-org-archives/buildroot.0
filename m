From: Daniel James Laird <daniel.j.laird@nxp.com>
Date: Thu, 22 Jan 2009 10:20:04 +0100
Subject: [Buildroot] svn
	commit:	trunk/buildroot/package/multimedia/gst-plugins-good
In-Reply-To: <200901221016.55678.markus.heidelberg@web.de>
References: <20090121133322.0FFA4770FC@busybox.osuosl.org>
	<87ocy0srp9.fsf@macbook.be.48ers.dk>
	<COL102-DS21A734A7B3DE9D3E1B2541DCD10@phx.gbl>
	<200901221016.55678.markus.heidelberg@web.de>
Message-ID: <C13DBBE85AD6974B85C118C35890CA5F1AF3847E8E@EU1RDCRDC1WX029.exi.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cheers for the feedback, What I will do is:
Move JPEG and PNG to top on Config.in
Disable ESD and OSS automatically in .mk file (as not yet available in buildroot)

I shall await your patch for the bzip2 etc stuff and then if you do not have direct access will test and apply.
is this ok?

Dan

-----Original Message-----
From: markus.heidelberg@web.de [mailto:markus.heidelberg at web.de] 
Sent: 2009 Jan 22 09:17
To: buildroot at uclibc.org
Cc: Daniel Laird; 'Peter Korsgaard'
Subject: Re: [Buildroot] svn commit: trunk/buildroot/package/multimedia/gst-plugins-good

Daniel Laird, 21.01.2009:
> Ok I will change to use select.
> 
> regarding:
> laird> +comment "plugins with external dependencies (more to come)"
>  laird> +
> 
> The package has a number of plugins with external dependencies the 5 I have
> added are ones that seems to end up being built by default but then fail due
> to missing dependencies (ESD being first culprit).

I encountered similiar problems, when working on the gstreamer packages.
The plugins that caused problems, I simple --disable-d in the .mk files.
Same can be done with esdsink and ossaudio, instead of introducing
config options, that won't work for anyone if enabled. If somebody needs
specific plugins, he can work on getting the package deps right.

I guess these problems are influenced by the host configuration, at
least I hit some strange issues. Do you have esd installed?

Markus
