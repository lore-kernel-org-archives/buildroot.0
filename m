From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Jul 2019 12:01:47 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-infra/show-info: dump
 install_{staging, target} info
In-Reply-To: <20190728095640.GC21875@scaer>
References: <20190723123355.22313-1-vadim4j@gmail.com>
 <20190723144459.5bfcc0fd@windsurf> <20190728095640.GC21875@scaer>
Message-ID: <20190728100147.GD21875@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vadim, Thomas, All,

On 2019-07-28 11:56 +0200, Yann E. MORIN spake thusly:
> On 2019-07-23 14:44 +0200, Thomas Petazzoni spake thusly:
> > On Tue, 23 Jul 2019 15:33:55 +0300
> > Vadim Kochan <vadim4j@gmail.com> wrote:
> > > provide info if the package will be installed to staging/target
> > > destinations. Might be useful for analyzing the packages which
> > > installed only for target/staging.
[--SNIP--]
> > Also, maybe you can write it like this:
> > 	"install-target": $(if $($(1)_INSTALL_TARGET),true,false),
> > 	"install-staging": $(if $($(1)_INSTALL_STAGING),true,false),
> +1

And I missed Carlos' reply that this does not work, in fact.
So maybe something like:

    $(if $(subst NO,,$($(1)_INSTALL_TARGET)),true,false)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
