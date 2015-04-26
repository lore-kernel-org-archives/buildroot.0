From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 11:39:04 +0200
Subject: [Buildroot] [PATCHv3 07/18] pkg-generic: implement source-check
 targets
In-Reply-To: <20150425172837.GI4275@free.fr>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-8-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150425172837.GI4275@free.fr>
Message-ID: <20150426113904.7efb27c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 25 Apr 2015 19:28:37 +0200, Yann E. MORIN wrote:

> To be noted: packages hosted at github, when we download a released
> tarball, are broken, because the backing-store is AWS, which does not
> support the HEAD request. But that is not a change due to this patch, it
> was already broken previously.

Right. Let's not fix all the problems in this patch series :-)


> > +$(1)-all-source-check:	$$(foreach p, \
> > +				$$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES), \
> > +				$$(p)-all-source-check) \
> > +			$(1)-source-check
> 
> If you do the little trick I mentioned as a comment to your patch 2,
> you'd have to do it here, too.

Will be in v4.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
