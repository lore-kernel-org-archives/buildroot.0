From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 2 Feb 2015 09:44:12 +0100 (CET)
Subject: [Buildroot] Best-Practice Suggestions for developing package
 patches in buildroot
In-Reply-To: <20150131230620.2236108e@free-electrons.com>
Message-ID: <1210001435.31028837.1422866651969.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
> Either quilt or git, but more and more I use git. I generally clone
> the
> upstream repository somewhere completely separate from Buildroot,
> then
> create a branch called 'buildroot' with the starting point being the
> tag indicating the release of the software currently in use by
> Buildroot. Then, I import as separate Git commits each of the
> individual patches that Buildroot has for this package (if any). I do
> my work, and then use 'git format-patch' to format the patches and
> copy
> them back in Buildroot.
> 

That's a great way of handling buildroot-provided patches, I hadn't
thought of that...

I'll add that to the buildroot-submodule documentation, that's a good 
practice...

> Quite ironically, I never use <pkg>_OVERRIDE_SRCDIR: I simply copy
> the
> patches back to the Buildroot package directory, and restart the
> package build process from scratch. Yes, this is inefficient, but one
> could pretend that it forces you to think twice before testing a
> stupid
> change :-)
> 
> Also, I tend to very often start by hacking directly in
> output/build/<pkg>-<version>/, and once I have a good idea of the
> change that needs to be done, I do the Git work flow described above.
> 
> Hope this helps,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
