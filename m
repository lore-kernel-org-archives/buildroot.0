From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Feb 2015 15:34:42 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-02-10
In-Reply-To: <20150211080111.GQ16955@sapphire.tkos.co.il>
References: <20150211073015.D49F7101159@stock.ovh.net>
 <20150211080111.GQ16955@sapphire.tkos.co.il>
Message-ID: <20150211153442.5a122bc6@free-electrons.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 11 Feb 2015 10:01:11 +0200, Baruch Siach wrote:

> On Wed, Feb 11, 2015 at 08:30:15AM +0100, Thomas Petazzoni wrote:
> >         i686 |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/e3c42b2a8334d910f44f7a908371796a332f20e2/
> >          arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/04940f2f0110bc3bb19cd96cc75a6d2d7e8affd5/
> >         i686 |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/e733fac165c7b90b529855b0e1ccf92ad4ac9eca/
> 
> Looks like a broken cached tar file with missing files, as it only happens on 
> your build server. Can you remove this file?

I'm not sure about this explanation, since the extract of the tarball
doesn't complain at all:

[3m>>> host-google-breakpad 1373 Extracting[23m
gzip -d -c /home/buildroot/instance-1/dl/google-breakpad-1373.tar.gz | tar --strip-components=1 -C /home/buildroot/instance-1/output/build/host-google-breakpad-1373  -xf -
[3m>>> host-google-breakpad 1373 Patching[23m

If the tarball was somewhat partial or corrupted, I would expect to see
at least some warnings here.

Maybe in any case, we should add a hash file to the google-breakpad
package, so that we're sure the tarball being built is the right one.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
