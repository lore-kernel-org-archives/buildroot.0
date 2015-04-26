From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 11:38:28 +0200
Subject: [Buildroot] [PATCHv3 02/18] pkg-generic: take into account
 patch dependencies in source, external-deps and legal-info
In-Reply-To: <20150425164109.GG4275@free.fr>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150425164109.GG4275@free.fr>
Message-ID: <20150426113828.4a1e07c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 25 Apr 2015 18:41:09 +0200, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2015-04-25 16:42 +0200, Thomas Petazzoni spake thusly:
> > The $(1)-all-{source,external-deps,legal-info} targets currently only
> > take care of the dependencies in <pkg>_DEPENDENCIES, but not
> > <pkg>_PATCH_DEPENDENCIES. This patch fixes that.
> > 
> > Long term, we might want to refactor this to have a single variable
> > containing all dependencies. But this requires more work in
> > pkg-generic than we want to do at the moment.
> 
> Well, you can still introduce $(2)_FINAL_ALL_DEPENDENCIES. That would
> make the code reall much more readable.

Right. v4 will have a $(2)_FINAL_ALL_DEPENDENCIES variable.

> Well, that's really unreadable.

A matter of taste I'd say :)

> What about:
> 
>     $(1)-all-source: $(1)-source
>     $(1)-all-source: $$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source)
> 
> Of course that require _FINAL_ALL_DEPENDENCIEs, but I guess the cost is
> worth the gain.

Ok, right, it's in v4.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
