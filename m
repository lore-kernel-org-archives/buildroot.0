From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 20:58:36 +0100
Subject: [Buildroot] [PATCH 2/2] package/tegrarcm: select host-cryptopp
 and drop BR2_arm dependency
In-Reply-To: <794738414.2421573.1544608748810.JavaMail.zimbra@datacom.com.br>
References: <20181212025605.19382-1-casantos@datacom.com.br>
 <20181212025605.19382-2-casantos@datacom.com.br>
 <20181212094647.57b4149d@windsurf>
 <cef20847-8bd5-b6e6-5a74-5a5fc3b79365@mind.be>
 <794738414.2421573.1544608748810.JavaMail.zimbra@datacom.com.br>
Message-ID: <20181213205836.29997ef4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Wed, 12 Dec 2018 07:59:08 -0200 (BRST), Carlos Santos wrote:

> > Of course we can't do it all in one big shot, but still it should probably be
> > approached in a somewhat more structured way. For example, when we add a
> > Config.in.host for a package, we also (perhaps in a separate commit) add the
> > select statements for it in all packages that depend on it.
> > 
> > 
> > Also note that the idea was to make these Config.in.host options blind (i.e.
> > promptless).  
> 
> Make sense if the host package exists only to support building another
> package (that selects and depends on it) but there are other reasons
> why a host package may be necessary, e.g. I need host-mtools for a
> post-image script.

Yes, of course, we want *some* host packages to be visible in
menuconfig.

Basically, the current situation is:

 * Most host packages don't have any Config.in.host options (blind or
   visible), because they are merely build dependencies of other
   packages.

 * A few host packages do have a visible Config.in.host because they
   are useful by themselves, and not just as a build dependency of
   something else: image generation tools, flashing tools, qemu, etc.

The idea we have for the future is:

 * All host packages have a Config.in.host option.

 * The host packages that are only build dependencies of other packages
   have a blind Config.in.host option

 * The host packages that are useful by themselves continue to have a
   visible Config.in.host option.

Does that clarify where we want to go ?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
