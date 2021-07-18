From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 21:18:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/tftpd: fix static build
In-Reply-To: <20210718190136.GH12203@scaer>
References: <20210710084313.893425-1-fontaine.fabrice@gmail.com>
 <20210716232144.7a9d3371@windsurf>
 <CAPi7W83fQbvzDfFGDMN4zh-VjfUCUZqQt2z_84Xe52-T_j3-oQ@mail.gmail.com>
 <20210718190136.GH12203@scaer>
Message-ID: <20210718211829.6c4dc00b@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 18 Jul 2021 21:01:36 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > However, given that this is an upstream commit that was applied 7
> > years ago, I think it is pretty safe to apply it to LTS.  
> 
> I was confused, because both commits (on tftpd and uClibc) are about 7
> years old, so I was wondering which you were referring to...
> 
> But yes, you were rerferring to the tftpd commit. Which got me wondering
> why we needed to apply a patch that have been applied upstream 7 years
> ago. Why can't we just bump the version rather than backport patches?
> 
> Ah, tftpd hasn't had any new release for the past 10 years now, so *are*
> up-to-date...
> 
> But then, yes, why can't we just switch to the latest commit in the git
> tree, then, rather than backport the fix? Given that tftpd hasn't seen
> any commit since 2015, we would not take too big a risk...

But besides that, I'm still confused as to why the problem happened
only once in the autobuilders. It does happen with the powerpc/internal
toolchain/static configuration that failed in the autobuilders, but
doesn't fail with the pre-built br-arm-full-static toolchain, which
also uses a statically-linked uClibc...

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
