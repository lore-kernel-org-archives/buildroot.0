From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Jun 2019 13:09:39 +0200
Subject: [Buildroot] [PATCH for-next 2/3] package/swig: enable PCRE
 regex matching in host-swig
In-Reply-To: <20190601092802.2b4102ac@windsurf>
References: <20190529151655.7098-1-romain.naour@gmail.com>
 <20190529151655.7098-2-romain.naour@gmail.com>
 <20190601092802.2b4102ac@windsurf>
Message-ID: <20190601110939.GE3407@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-06-01 09:28 +0200, Thomas Petazzoni spake thusly:
> On Wed, 29 May 2019 17:16:54 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> > The upcoming ogre package needs a host swig binary with PCRE
> > regex support.
> > 
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > ---
> >  package/swig/swig.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> I never really like the addition of mandatory host package dependencies
> just for the sake of one use case. I was considering adding a hidden
> BR2_PACKAGE_HOST_PCRE option for this, but since pcre takes only 17
> seconds to build, maybe it was not worth the effort. So I've applied to
> next as-is, but I'd be interested to know what Arnout/Peter/Yann thing
> about adding a hidden BR2_PACKAGE_HOST_PCRE hidden option for that kind
> of situation. We had decided to not systematically add such options in
> all host packages, but that we could add some in a case-by-case basis.
> This case-by-case basis however will look "weird": ogre would have
> host-swig in its <pkg>_DEPENDENCIES, but in Config.in would select
> BR2_PACKAGE_HOST_PCRE and not BR2_PACKAGE_HOST_SWIG. This could start
> getting a bit clunky.

As I understand what we said about host packages and their options, what we
would have in this case would be BR2_PACKAGE_HOST_SWIG_NEEDS_PCRE, and ogre
would select that, and BR2_PACKAGE_HOST_SWIG_NEEDS_PCRE would cause swig to
depend on host-pcre, without the need for BR2_PACKAGE_HOST_PCRE.

Consider it from another angle: what you suggested above could also
represent the case that ogre needs host-pcre and host-swig, not that it
needs a host-swig with pcre support.

But I'm OK with adding an unconditional dependency.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com													

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
