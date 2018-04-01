From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 23:03:49 +0200
Subject: [Buildroot] [PATCH v2 18/37] docs/manual: add check-package to
 "Tips and tricks"
In-Reply-To: <5ac146b11189_68703fb01132093c86945@ultri4.mail>
References: <20180401091649.217db6e8@windsurf>
 <5ac146b11189_68703fb01132093c86945@ultri4.mail>
Message-ID: <20180401230349.7f6f7661@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 01 Apr 2018 17:53:05 -0300, Ricardo Martincoski wrote:

> > I'm not sure to understand what you mean by "does not check package
> > infra types". Do you mean that the code in package/pkg-*.mk is not
> > checked ? Or that it doesn't check the $(eval $(autotools-package))
> > line at the end of every package ?  
> 
> I meant package/pkg-*.mk and similar files.

OK, so "infra types" is not really the right word to express that.

> "and similar" because we have such files in bool/, fs/ and toolchain/ and the
> user can also have such files inside a br2-external.
> 
> What I am trying to state is that the script does not validate the language of
> any file in the tree or even any Makefile, it only checks for common mistakes in

I guess you wanted to say "does not validate the language of all files
in the tree". Your formulation means that the tool is not validating
any file!

> the standardized naming and style we use for variables declared in package files
> to be picked up by the package infra.
> 
> Maybe one of these?
> 
> "but it does not check package infra files."
> "but it does not check +package/pkg-*.mk+."
> "but it does not check +package/pkg-*.mk+ and similar files."
> "but it does not check files that define a package infra."
> "but it does not check files that define a package infra and not a
> package itself."
> "but it does not understand package infra files."
> "but it does not understand +package/pkg-*.mk+."
> "but it does not understand +package/pkg-*.mk+ and similar files."
> "but it does not understand files that define a package infra."
> "but it does not understand files that define a package infra and not a
> package itself."

Perhaps:

"""
It does not check the files defining the package infrastructures and
some other files containing similar common code.
"""

> >> +The tool can also be used for proprietary packages in a br2-external:  
> > 
> > I would say "external packages" or just "packages", because packages in
> > a br2-external are not necessarily proprietary.  
> 
> You are right.
> Just "packages" is more accurate.
> 
> >> +++ b/docs/manual/adding-packages.txt
> >> @@ -12,6 +12,8 @@ tuning their configuration.
> >>  When you add a new package, be sure to test it in various conditions;
> >>  see xref:testing-package[]
> >>  
> >> +Also check the new package for coding style; see xref:check-package[]  
> > 
> > Final dot ?  
> 
> OK. Nit: should we also add a final dot to the paragraph above?

Probably :)

> Or even join the two:
> 
> "
> When you add a new package, be sure to test it in various conditions
> (see xref:testing-package[]) and also check it for coding style
> (see xref:check-package[]).

I like this one.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
