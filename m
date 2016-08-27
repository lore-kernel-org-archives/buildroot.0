From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Aug 2016 16:16:50 +0200
Subject: [Buildroot] [PATCH 02/16 v3] core: commonalise the bundled and
 br2-external %_defconfig rules
In-Reply-To: <20160827161249.26d4c72e@free-electrons.com>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e302f10d06b7406978bbc888b903cb917cb0e754.1468750623.git.yann.morin.1998@free.fr>
 <20160827161249.26d4c72e@free-electrons.com>
Message-ID: <20160827141650.GB5755@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-27 16:12 +0200, Thomas Petazzoni spake thusly:
> On Sun, 17 Jul 2016 12:34:22 +0200, Yann E. MORIN wrote:
> 
> > +define percent_defconfig
> > +%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
> > +	# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
> 
> This comment in here was a bit annoying, because it appears on stdout
> when you run "make <foo>_defconfig". So I've moved it outside of the
> target definition instead, in order to preserve the existing behavior
> in terms of what appears on stdout when loading a defconfig.

Well, that's how I did it first, but Arnout contended that the comment
should be moved like I did (or at least that's what I understood from
his review).

I'm happy you moved it. ;-)

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
