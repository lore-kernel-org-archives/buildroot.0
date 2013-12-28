From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 13:06:47 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: expose 'graph-depends' to
 generate a graph of the dependency tree
In-Reply-To: <20131228115634.GC3373@free.fr>
References: <cover.1388185918.git.yann.morin.1998@free.fr>
 <0fad080c135d79abdbe042514e30b393c25f5a77.1388185918.git.yann.morin.1998@free.fr>
 <20131228124607.193ac484@skate> <20131228115634.GC3373@free.fr>
Message-ID: <20131228130647.78e56259@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 28 Dec 2013 12:56:34 +0100, Yann E. MORIN wrote:

> > Why isn't that one done in the package infrastructure, i.e in
> > pkg-generic.mk ?
> 
> For two reasons:
>   - to have both graph-depends and %-graph-depends side-by-side, so it
>     is easier to update the rules,

Right, that's a pretty good reason.

>   - to limit the number of rules in the Makefile, which is already a bit
>     long to parse.

Well, you still have the rule in pkg-generic.mk, which you added to
make the completion work. So practically speaking, the number of rules
is the same.

> I initially added that in package/pkg-generic.mk:
>     $(1)-graph-depends:
>         @install -d $(O)/graphs

Should be $(INSTALL) maybe?

>         @./support/scripts/graph-depends $(1) \
>         |dot -Tpdf \
>         -o $(O)/graphs/$$(@).pdf
> 
> But this adds yet another rule per-package to the Makefile. So for the
> reasons above, I decided to move it with graph-depends.
> 
> But I don't really care, I can change it back to a per-package rule.

To me, it makes more sense to have all the per-package rules in the
package infrastructure, but that's not a very strong opinion, since the
argument of having both the per-package and the global rules together
also makes sense.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
