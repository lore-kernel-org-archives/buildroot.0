From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Fri, 19 Oct 2018 12:53:11 +0000
Subject: [Buildroot] Legacy patches for Binutils?
In-Reply-To: <20181019143722.32f0109b@windsurf>
References: <4881796E12491D4BB15146FE0209CE6468177130@DE02WEMBXB.internal.synopsys.com>
 <20181019143722.32f0109b@windsurf>
Message-ID: <4881796E12491D4BB15146FE0209CE646817718F@DE02WEMBXB.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Romain,

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at bootlin.com]
> Sent: Friday, October 19, 2018 3:37 PM
> To: Alexey Brodkin <alexey.brodkin@synopsys.com>
> Cc: buildroot at buildroot.org; Yann E. MORIN <yann.morin.1998@free.fr>; ARC Buildroot mailing list <arc-buildroot@synopsys.com>;
> Romain Naour <romain.naour@smile.fr>; Peter Korsgaard <peter@korsgaard.com>
> Subject: Re: Legacy patches for Binutils?
> 
> Hello,
> 
> On Fri, 19 Oct 2018 12:24:26 +0000, Alexey Brodkin wrote:
> 
> > This might be quite a na?ve and silly question but I'd like to understand
> > if some patches for Binutils are still really needed.
> >
> > 1. https://urldefense.proofpoint.com/v2/url?u=https-3A__git.buildroot.org_buildroot_tree_package_binutils_2.31.1_0002-2Dld-
> 2Dmakefile.patch&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=CY8nik3Tm93
> O8isZ-48ZTZZXFjySwIKdtEC36EnnaWs&s=zD8Ya-IfQBGEcRID7FsUMup6xUOXxagtv7TaB6JfVVM&e=
> > This one I may track down to at least 2.15.94.0.2.2 here:
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__git.buildroot.org_buildroot_commit_toolchain_binutils_-3Fid-
> 3Dc1f119b500b487dac34a730609e6a0f1c30f8bfd&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55yt
> Wkhpk5R81I&m=CY8nik3Tm93O8isZ-48ZTZZXFjySwIKdtEC36EnnaWs&s=OeEURDBE18QSXtmef-lNZsbHsaFmYtrXGeC-L5023L0&e=
> > Also from that patch I may conclude it came from Debian still no rationale why it was
> > created, what it fixe or improves...
> >
> > But in OpenEmbedded they got rid of it long ago on switch to 2.26, see
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_openembedded_openembedded-
> 2Dcore_commit_3c7fe424f850af70989ad682dd9c5be70cd02ca5&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656e
> ViXO7breS55ytWkhpk5R81I&m=CY8nik3Tm93O8isZ-
> 48ZTZZXFjySwIKdtEC36EnnaWs&s=Lou90XS2s5qA4NzeqJSGi_PkRgDoNpcVELp4gT3lJz0&e=
> >
> > 2. Same here: https://urldefense.proofpoint.com/v2/url?u=https-
> 3A__git.buildroot.org_buildroot_tree_package_binutils_2.31.1_0003-2Dcheck-2Dldrunpath-
> 2Dlength.patch&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=CY8nik3Tm93O
> 8isZ-48ZTZZXFjySwIKdtEC36EnnaWs&s=YI9n1_ictMK820ddEwETzxc8wgvpGntsKkcmZuj8uxM&e=
> >
> > 3. This one is pretty much the same: https://urldefense.proofpoint.com/v2/url?u=https-
> 3A__git.buildroot.org_buildroot_tree_package_binutils_2.31.1_0004-2Dadd-2Dsysroot-2Dfix-2Dfrom-2Dbug-
> 2D3049.patch&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=CY8nik3Tm93O8i
> sZ-48ZTZZXFjySwIKdtEC36EnnaWs&s=MFlW850c-1cjdjQqpZXVTWTS6b2KOlYIT_qRGvvCQVg&e=
> > And bug mentioned in this patch was "fixed" a long ago, see https://urldefense.proofpoint.com/v2/url?u=https-
> 3A__sourceware.org_bugzilla_show-5Fbug.cgi-3Fid-
> 3D10340&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=CY8nik3Tm93O8isZ-
> 48ZTZZXFjySwIKdtEC36EnnaWs&s=txQm-D6mMYoEtxpjNbtSosbMMaLn4Q5J8sqn547r7UI&e=
> >
> > Any thoughts?
> 
> I don't have anything specific thought, but I share the general feeling
> that the stack of patches we have on binutils should be
> analyzed/revisited, as I'm also sure that a number of those patches are
> no longer needed.

Should I add this as a topic for the meeting?

-Alexey
