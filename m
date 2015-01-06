From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 09:24:38 +0100
Subject: [Buildroot] [PATCH v4 03/17] package/pkg-rebar: new
 infrastructure
In-Reply-To: <20150105215956.GC5077@free.fr>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
 <1418135662-773-4-git-send-email-johan.oudinet@gmail.com>
 <20150104222307.009f6e73@free-electrons.com>
 <20150104222038.GD31970@free.fr>
 <20150105103116.74bbc777@free-electrons.com>
 <20150105215956.GC5077@free.fr>
Message-ID: <20150106092438.1d427cc3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 5 Jan 2015 22:59:56 +0100, Yann E. MORIN wrote:

> In the end, I did not implement that because it is too much overkill.
> Also, I kept _CONFIGURE because it is what people do expect: the package
> needs to be configured before being built. But I am not completely
> opposed to changing the variable name. _USE_AUTOTOOLS or _USE_AUTOCONF
> is equally fit, I guess (although I'd still prefer _AUTOTOOLS, because
> it matches the fact that we call back to the autotools infrastructure
> underneath.

Unfortunately, I disagree on this. "Configure" is a very vague term,
which does not necessarily mean "run an autoconf generated ./configure
script". We do have certain generic-package packages that do provide an
implementation for the <pkg>_CONFIGURE_CMDS that aren't calling an
autoconf generated ./configure script.

Moreover, a non-autoconf using rebar package may want to implement its
<pkg>_CONFIGURE_CMDS to do some stuff. But it would have to keep
<pkg>_CONFIGURE set to NO. This is really confusing.

Please, use <pkg>_USE_AUTOTOOLS, <pkg>_AUTOTOOLS or <pkg>_USE_AUTOCONF.
I tend to prefer the latter, because this is really what the user is
seeing: the package is using autoconf. You say you prefer _AUTOTOOLS
because it matches the fact that we're using the autotools
infrastructure underneath, but that's an implementation detail. It's
much better to expose things that make sense for the package developer
that things that relate to implementation details, IMO.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
