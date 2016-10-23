From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Oct 2016 17:08:13 +0200
Subject: [Buildroot] [PATCH] pkg-infra: allow dumping reverse
 dependencies of a package
In-Reply-To: <20161023152333.3f9d3f64@free-electrons.com>
References: <1474808171-5652-1-git-send-email-yann.morin.1998@free.fr>
 <20161023152333.3f9d3f64@free-electrons.com>
Message-ID: <20161023150813.GA3605@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-10-23 15:23 +0200, Thomas Petazzoni spake thusly:
> On Sun, 25 Sep 2016 14:56:11 +0200, Yann E. MORIN wrote:
> > Finding the packages that select another one in a specific configuration
> > is not very trivial:
> > 
> >   - when optional, the dependency is not expressed in Kconfig
> > 
> >   - looking at the .mk files is not very nice.
> > 
> > Introduce a way to dump reverse dependencies of packages, i.e. the list
> > of packages that directly depend on that package. Like for direct
> > dependencies, we limit the list to the first-order reverse dependencies.
> > 
> > Document it in the main help; use the opportunity to also docuemnt
> > foo-show-depends.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> I was about to apply this patch, but after testing it, I'm a little bit
> skeptical.
[--SNIP--]
> So in the end, I find the semantic of this "show-rdepends" a bit weird.
> It shows reverse dependencies, some according to the current
> configuration, some not.

Right, good catch.

I've fixed it here now to take this into account. It should now match
the behaviour of -show-depends.

I'll spin it soon.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
