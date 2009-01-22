From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 22 Jan 2009 10:16:55 +0100
Subject: [Buildroot]
 =?iso-8859-1?q?svn_commit=3A=09trunk/buildroot/packag?=
 =?iso-8859-1?q?e/multimedia/gst-plugins-good?=
In-Reply-To: <COL102-DS21A734A7B3DE9D3E1B2541DCD10@phx.gbl>
References: <20090121133322.0FFA4770FC@busybox.osuosl.org>
	<87ocy0srp9.fsf@macbook.be.48ers.dk>
	<COL102-DS21A734A7B3DE9D3E1B2541DCD10@phx.gbl>
Message-ID: <200901221016.55678.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
