From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Wed, 4 Jul 2018 10:47:18 +0200
Subject: [Buildroot] [PATCH 4/5] dropbear: add option to disable CBC
 mode ciphers
In-Reply-To: <20180704073057.dr3qp4t34daf434s@sapphire.tkos.co.il>
References: <20180704070739.7259-1-thomas.de_schampheleire@nokia.com>
 <20180704070739.7259-5-thomas.de_schampheleire@nokia.com>
 <20180704073057.dr3qp4t34daf434s@sapphire.tkos.co.il>
Message-ID: <20180704084718.GD8766@australia.be.alcatel-lucent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Wed, Jul 04, 2018 at 10:30:58AM +0300, Baruch Siach wrote:
> Hi Thomas,
> 
> On Wed, Jul 04, 2018 at 09:07:38AM +0200, Thomas De Schampheleire wrote:
> > CBC mode ciphers are considered insecure. Add an option to disable it.
> 
> We have a patch from Stefan S?rensen to disable all weak algorithms by 
> default:
> 
>   http://patchwork.ozlabs.org/patch/938595/
> 
> I prefer Stefan's patch over this and the next patch.
> 
> Stefan's patch doesn't deal with the MD5 HMAC as the next patch does. But I 
> find it highly unlikely that upstream would enable MD5 by default ever again. 
> Upstream commit 34ee32607598 adds this code in sysoptions.h:
> 
> /* might be needed for compatibility with very old implementations */
> #ifndef DROPBEAR_MD5_HMAC
> #define DROPBEAR_MD5_HMAC 0
> #endif
> 
> default_options.h doesn't mention MD5 at all.


Thanks for this info. I'm perfectly fine with Stefan's patch instead of these
two.

/Thomas
