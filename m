From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 17:30:25 +0100
Subject: [Buildroot] [PATCH 07/51] core: add a global variable with
 already-unquoted global patch dir
In-Reply-To: <20151123171833.089fc12a@free-electrons.com>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <6fdfa014a8ab2bd00ae19074e82a6c91fdeb71de.1448289515.git.yann.morin.1998@free.fr>
 <20151123171833.089fc12a@free-electrons.com>
Message-ID: <20151123163025.GC3857@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-23 17:18 +0100, Thomas Petazzoni spake thusly:
> On Mon, 23 Nov 2015 15:47:37 +0100, Yann E. MORIN wrote:
> >  		package/gcc/$(GCC_VERSION)/*.patch \
> > -		$(addsuffix $((PKG)_RAWNAME)/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
> > -		$(addsuffix $((PKG)_RAWNAME)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
> > +		$(addsuffix $((PKG)_RAWNAME)/$(GCC_VERSION)/*.patch,$(BR2_GLOBAL_PATCH_DIR)) \
> > +		$(addsuffix $((PKG)_RAWNAME)/*.patch,$(BR2_GLOBAL_PATCH_DIR))))
> 
> Should be BR_GLOBAL_PATCH_DIR, not BR2_GLOBAL_PATCH_DIR.

Good catch, thanks! :-)

It worked in my test-case, because I was using a single directory in
there.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
