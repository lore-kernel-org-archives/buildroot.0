From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Feb 2015 16:22:38 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-02-10
In-Reply-To: <20150211144814.GV16955@sapphire.tkos.co.il>
References: <20150211073015.D49F7101159@stock.ovh.net>
 <20150211080111.GQ16955@sapphire.tkos.co.il>
 <20150211153442.5a122bc6@free-electrons.com>
 <20150211144814.GV16955@sapphire.tkos.co.il>
Message-ID: <20150211162238.3470acdd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 11 Feb 2015 16:48:15 +0200, Baruch Siach wrote:

> The tar file itself is not corrupted, but apparently the original svn checkout 
> was partial. From the first failure log 
> (http://autobuild.buildroot.net/results/98e/98e6a4a4046231598f5380e7ec5ac5a6833c5c41/build-end.log):

[...]

Aah, indeed! Weird that svn returns with success if the download was
partial. But who knows, maybe it's possible.

> > Maybe in any case, we should add a hash file to the google-breakpad
> > package, so that we're sure the tarball being built is the right one.
> 
> I'm not sure the tar file generation is guaranteed to be deterministic.

I didn't realize that this package is getting its source code from SVN.
Then indeed, using a hash is not possible.

So, yes Richard should remove this tarball from his cache.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
