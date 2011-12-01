From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 1 Dec 2011 08:00:11 -0600
Subject: [Buildroot] [git commit] dropbear: bump to version 2011.54
In-Reply-To: <20111201145224.197356c8@skate>
References: <20111201085828.CEE7D8F626@busybox.osuosl.org>
 <201112010722.35449.minimod@morethan.org> <20111201145224.197356c8@skate>
Message-ID: <201112010800.26994.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu December 1 2011, Thomas Petazzoni wrote:
> Le Thu, 1 Dec 2011 07:22:33 -0600,
> "Michael S. Zick" <minimod@morethan.org> a ?crit :
> 
> > Has the "DROPBEAR_SOURCE" line been accidentally dropped here?
> > At "DROPBEAR_SITE" the package is named: dropbear-2011.54.tar.gz
> > (or .tar.bz2)
> 
> This <pkg>_SOURCE value is the default one:
> 
> $(2)_BASE_NAME  =  $(1)-$$($(2)_VERSION)
> $(2)_SOURCE     ?= $$($(2)_BASE_NAME).tar.gz
>

Ah, so -
The infrastructure builds the correct name and 
the deleted line was not required.

Sorry, was looking only at the patch out of context.

Mike 
> (from package/Makefile.package.in)
> 
> Regards,
> 
> Thomas
