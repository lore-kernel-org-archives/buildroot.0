From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 02 Jan 2009 23:23:25 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/toolchain:	export-toolchain uClibc
In-Reply-To: <87fxkf6vdl.fsf@macbook.be.48ers.dk>
References: <20081221171134.7BAB176ABE@busybox.osuosl.org>
	<87fxkf6vdl.fsf@macbook.be.48ers.dk>
Message-ID: <1230935005.8886.13.camel@linux-yrgm.site>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2008-12-23 klockan 11:25 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2008-12-21 17:11:33 +0000 (Sun, 21 Dec 2008)
>  ulf> New Revision: 24480
> 
>  ulf> Log:
>  ulf> Allow creating a script for external use of Buildroot toolchain
> 
>  ulf> Added:
>  ulf>    trunk/buildroot/toolchain/export-toolchain/
>  ulf>    trunk/buildroot/toolchain/export-toolchain/Config.in
>  ulf>    trunk/buildroot/toolchain/export-toolchain/Makefile.in
> 
> That seems very specific - What's wrong with the currently documented
> way of adding build_$ARCH/staging_dir/usr/bin to the path? Where's the
> documentation of this thing?

Sorry about the late answer.
Have had a disk crash and did not install the account
for reading buildroot mail until after the holidays.

Adding a path is manual and error prone.
This is more productive since you can with a single 
click create something that works.

You can of course also have several toolchains, 
and select which you want at a specific time.

> 
>  ulf> Modified:
>  ulf>    trunk/buildroot/toolchain/Config.in
>  ulf>    trunk/buildroot/toolchain/Makefile.in
>  ulf>    trunk/buildroot/toolchain/uClibc/Config.in
> 
>  ulf> +++ trunk/buildroot/toolchain/Makefile.in	2008-12-21 17:11:33 UTC (rev 24480)
>  ulf> @@ -47,3 +47,5 @@
>  ulf>  # gcc has a bunch of needed stuff....
>  ulf>  include toolchain/gcc/Makefile.in
>  
>  ulf> +include toolchain/export-toolchain/Makefile.in
>  ulf> +
> 
> This seems to break the build as the dependencies target isn't
> executed before the other toolchain stuff - I've disabled it in
> r24519.


What exactly is broken?
"Seems do" != "does".
Have you tested and found that you cannot build a toolchain or what??


> 
>  ulf> +config BR2_EXPORT_TOOLCHAIN
>  ulf> +	bool "Create script exporting toolchain to home directory"
>  ulf> +	default n
>  ulf> +	help
>  ulf> +	  This will generate a batchfile which, if run
>  ulf> +	  will add the Buildroot toolchain to the user PATH
>  ulf> +	  The file is called "$(ARCH)-uclibc-gcc-$(GCC_VERSION).sh"
>  ulf> +
> 
> Batchfile? shell script? I take it that you need to source the file
> for the changes to take effect?

Exactly.


> 
>  ulf> +~/$(GCC_SCRIPT): cross_compiler
> 
> I'm not sure ~ in make targets are a good idea.
> 

If you want to have a script file in your top directory, why not?
It is a possibility to fix so that it gets built in a subdirectory
to ~ as well or by defining a BUILDROOT_<XXX> shell variable 
and install it in $(BUILDROOT_XXX)/?$(GCC_SCRIPT).

/Ulf
