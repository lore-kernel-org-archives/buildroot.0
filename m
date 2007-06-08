From: Benjamin Tietz <benjamin@micronet24.de>
Date: Fri, 8 Jun 2007 19:47:28 +0200
Subject: [Buildroot] Easier adding of new packages / alsa-lib & utils
In-Reply-To: <007501c7a995$663af6b0$0302a8c0@atmel.com>
References: <20070607132945.GC4224@firebird.dresden.micronet24.de>
	<007501c7a995$663af6b0$0302a8c0@atmel.com>
Message-ID: <20070608174728.GB4273@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To 1) The main problem, I think, is that somebody has to maintain these
backup-addresses or to provide a backup-server containing all possibly
needed files. The rest of the problem is easy, as it can be solved
either by a scipt wrapping wget or by a File-downloading-rule caring
about backup-locations

To 2) This is a more difficult problem since you have to give the user a
chance to specify all supported versions. If you want to integrate it
into the current configuration-process you would have to specify a field
or list for every single package - Leaving the user alone with the
decision of hundred of different versions.

According to the introduction, we would have enough up to here :)

To 3) You have something like this, even if it could be improved. If you
"make package" the first time you build and install the package. If you
afterwards do "make package-clean" you remove it from the rootfs. Doing
"make package" again installs the stuff...

best regards

On Fri, Jun 08, 2007 at 08:22:26AM +0200, Ulf Samuelsson wrote:
> > Hi,
> > 
> > the attachment contains two patches. The first one will rapidly shorten
> > the Makefile to add a new package to the buildroot (at least for most
> > packages), while being fully compatible to the standard way used up to
> > now.
> 
> As I see it we lack two things in the build.
> 1) Ability to use backup sites if the main site is temporarily or permanently down.
> 2) Handling of distributions.    I.E. ability to specify which package version you 
>     want to build in a way which is separated from the package build script.
> 3) Ability to generate binary packages which can be added/removed from 
>     the root fs.
> 
> Any chance of looking into this?
> An alternative to this patch could be to use the OpenWRT build script
> which does (1) and (3) above.
> 
> OpenWRT seems to be a split from buildroot.
> Is there a heated history here?
> 
> > While the Config.in follows the same rules, the Makefile for the new
> > package provides only the NEEDED information to add the package. Let see
> > on an example (Its nearly the same included in the second patch):
> > 
> 
> 
> Best Regards
> Ulf Samuelsson 
> 
