From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 19:21:15 +0200
Subject: [Buildroot] [PATCH v2 1/6] support/download: Add support to
 pass options directly to downloaders
In-Reply-To: <20160715155435.GC3692@free.fr>
References: <1468315820-9341-1-git-send-email-romain.perier@free-electrons.com>
 <1468315820-9341-2-git-send-email-romain.perier@free-electrons.com>
 <20160715155435.GC3692@free.fr>
Message-ID: <20160715192115.78cdb5a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Jul 2016 17:54:35 +0200, Yann E. MORIN wrote:

> With Thomas, we've recently discussed the way we currently pass options
> to the download helpers.
> 
> As you could experience first-hand, it is not trivial to add new options
> to those helpers, because they expect their arguments to be non-otions:
> URL, version, site... They only accept a single option, that nust be the
> first argument shen calling them.
> 
> Instead, Thomas suggested, and I concur, that we should change them all
> so that we pass them those as options. For example:

I concur, but isn't that independent from Romain's patch? Romain's
patch is about passing random additional options straight from the
package to the download helper. How would such custom options be passed
with your new scheme ? I guess we would pass first the downloader
wrapper options, then a "--" sign, and then the custom options passed
straight to the download tool. Do you see another way ?

Also, I'm tempted to say that Romain's patch can be merged as-is, since
switching to a different organization of the download helpers will no
affect the visible "API" exposed to packages.

What do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
