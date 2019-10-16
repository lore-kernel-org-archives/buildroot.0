From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 16 Oct 2019 22:34:32 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libopenssl: set no-asm for static builds
In-Reply-To: <20191016210735.2b91a53f@windsurf.home>
References: <20191016171026.3913-1-fontaine.fabrice@gmail.com>
 <20191016210735.2b91a53f@windsurf.home>
Message-ID: <CAPi7W80Rnjva5s1LMg6P42pb_4Mz=uKWd_J4fnvD_3M3PQK+Jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mer. 16 oct. 2019 ? 21:07, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Wed, 16 Oct 2019 19:10:26 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Use no-asm when building statically with a generic architecture such as
> > gcc, see
> >
> > This will fix a static build failure on x86_64 due to the removal of
> > x86/x86_64 BSAES and AES_ASM support by
> > https://github.com/openssl/openssl/commit/87bea6550ae0dda7c40937cff2e86cc2b0b09491
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/e4f04bb13ec1b82b73db645bea4933e52bca4185
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> I am still confused, because the github issue says that no-asm should
> be used whenever linux-generic{32,64} is used, not just for static
> linking scenarios. Am I missing something ?
Indeed, I missed that we're setting linux-generic32 by default. I'll
set no-asm for this one. The other architectures such as linux-x86_64
are not generic.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
