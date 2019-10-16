From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:07:35 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libopenssl: set no-asm for static builds
In-Reply-To: <20191016171026.3913-1-fontaine.fabrice@gmail.com>
References: <20191016171026.3913-1-fontaine.fabrice@gmail.com>
Message-ID: <20191016210735.2b91a53f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Oct 2019 19:10:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use no-asm when building statically with a generic architecture such as
> gcc, see https://github.com/openssl/openssl/issues/9839
> 
> This will fix a static build failure on x86_64 due to the removal of
> x86/x86_64 BSAES and AES_ASM support by
> https://github.com/openssl/openssl/commit/87bea6550ae0dda7c40937cff2e86cc2b0b09491
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e4f04bb13ec1b82b73db645bea4933e52bca4185
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I am still confused, because the github issue says that no-asm should
be used whenever linux-generic{32,64} is used, not just for static
linking scenarios. Am I missing something ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
