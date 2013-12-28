From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Dec 2013 12:56:34 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: expose 'graph-depends' to
 generate a graph of the dependency tree
In-Reply-To: <20131228124607.193ac484@skate>
References: <cover.1388185918.git.yann.morin.1998@free.fr>
 <0fad080c135d79abdbe042514e30b393c25f5a77.1388185918.git.yann.morin.1998@free.fr>
 <20131228124607.193ac484@skate>
Message-ID: <20131228115634.GC3373@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-28 12:46 +0100, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Sat, 28 Dec 2013 00:12:51 +0100, Yann E. MORIN wrote:
> 
> > +%-graph-depends:
> > +	@install -d $(O)/graphs
> > +	@./support/scripts/graph-depends $(@:-graph-depends=) \
> > +	|dot -Tpdf \
> > +	-o $(O)/graphs/$(@).pdf
> 
> Why isn't that one done in the package infrastructure, i.e in
> pkg-generic.mk ?

For two reasons:
  - to have both graph-depends and %-graph-depends side-by-side, so it
    is easier to update the rules,
  - to limit the number of rules in the Makefile, which is already a bit
    long to parse.

I initially added that in package/pkg-generic.mk:
    $(1)-graph-depends:
        @install -d $(O)/graphs
        @./support/scripts/graph-depends $(1) \
        |dot -Tpdf \
        -o $(O)/graphs/$$(@).pdf

But this adds yet another rule per-package to the Makefile. So for the
reasons above, I decided to move it with graph-depends.

But I don't really care, I can change it back to a per-package rule.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
