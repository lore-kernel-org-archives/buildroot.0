From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 21 Oct 2018 19:27:08 +0200
Subject: [Buildroot] [PATCH] merge_config.sh: Fix finding redundant
 config mechanism
In-Reply-To: <7189ed78-6481-0290-f13b-88e3c1008937@mind.be>
References: <1539989903-19803-1-git-send-email-Afshin.Nasser@gmail.com>
 <CANQCQpaxMvn2OEfP0aztbFRk0KTOTnt8nugZ-gwKL7oML1eQUw@mail.gmail.com>
 <7189ed78-6481-0290-f13b-88e3c1008937@mind.be>
Message-ID: <20181021172707.GA19294@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> > The merge_config.sh is used for a couple scenarios
> >  - Appending kconfigs together (CONFIG_*)

>  ... I forgot about this one. Indeed, the buildroot merge_config.sh script is
> used in pkg-kconfig.mk to merge kernel configs. Ideally we should change that to
> use the package's merge_config.sh script. However, the location of that script
> may vary, or it may even be missing...

> >  - Buildroot cfgs for runtime tests (BR2_*)
> >  - As a tool by users to merge together Buildroot configs

> > I'm not sure of the cleanest approach to support both
> >  - you could detect if the file is one or the other and adjust the regex
> >  - do the inverse and build a list of lines that are not comments

>  I think Angelo's patch is the best approach after all.
+1. I also think keep using our merge_config.sh with -b switch from Angelo's
patch [1] is the way.

>  However, there is one comment that I made on Angelo's patch that still applies
> here:

>  Since the kconfig stuff comes from upstream but is modified, we also maintain
> the changes as a stack of patches in support/kconfig/patches. So you should
> generate a new patch for this change and add it to the series file. I'm not sure
> why we don't use a vendor branch and just merge, but that's the way we do it :-).
IMHO it's a common practice across distributions packaging to use quilt for own
patches. I guess it's to help show easily distro changes (in our case patches in
support/kconfig/patches/ directory are in tarballs, not just in git).


Kind regards,
Petr

>  Regards,
>  Arnout

> [1] http://patchwork.ozlabs.org/patch/824051/
