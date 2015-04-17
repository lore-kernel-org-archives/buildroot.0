From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Apr 2015 17:27:14 +0200
Subject: [Buildroot] [PATCHv2 18/21] pkg-generic: propagate
 <pkg>_EXTRA_DOWNLOADS from target to host package
In-Reply-To: <552D8BC3.9040803@mind.be>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-19-git-send-email-thomas.petazzoni@free-electrons.com>
 <552D8BC3.9040803@mind.be>
Message-ID: <20150417172714.2d74113e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 14 Apr 2015 23:50:59 +0200, Arnout Vandecappelle wrote:
> On 12/04/15 18:38, Thomas Petazzoni wrote:
> > Just like <pkg>_PATCH, <pkg>_SOURCE or <pkg>_SITE, the
> > <pkg>_EXTRA_DOWNLOADS variable of a host package should be
> > automatically inferred from the <pkg>_EXTRA_DOWNLOADS value of the
> > corresponding target package, unless an explicit value is being
> > defined for the host package. This commit implements this for
> > <pkg>_EXTRA_DOWNLOADS.
> 
>  I'm not so sure about this one. _EXTRA_DOWNLOADS is currently used for the
> blackfin toolchains and for perl. Toolchains are target packages so no issue
> there, but for perl, we really only need perl-cross for the target perl. At the
> moment, host-perl is only built as a dependency of perl so it doesn't hurt to
> download perl-cross for host-perl, but it is unnecessary.
> 
>  Is there a hidden reason why you want this (i.e. is it required for some later
> patch)?

Not that I remember of. The only reason was pure consistency: since
source, site, version and patch are all inherited from the target
variant to the host variant, is seemed to make sense as well for extra
downloads.

I can get rid of this aspect if you think it's not really appropriate,
since I indeed don't really have a use case for it, except a pure
consistency feeling.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
