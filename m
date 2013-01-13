From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 13 Jan 2013 23:15:46 +0100
Subject: [Buildroot] [PATCH 1/4] Makefile: export a few variables to
	help support scripts
In-Reply-To: <d9e98990b22abeb96d52d72687ccf52883521e69.1358113846.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 13 Jan 2013 22:52:20 +0100")
References: <cover.1358113846.git.yann.morin.1998@free.fr>
 <cover.1358113846.git.yann.morin.1998@free.fr>
 <d9e98990b22abeb96d52d72687ccf52883521e69.1358113846.git.yann.morin.1998@free.fr>
Message-ID: <877gngviel.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Support scripts (in support/) may need to parse the .config file, so give
 Yann> them an easy access to it, by exporting BUILDROOT_CONFIG with the fully-
 Yann> qualified path to .config.

 Yann> Also, post-build scripts may need to reference a few locations, so export
 Yann> those, too.

 Yann> Note: we export both O and BASE_DIR. Although they are the same,
 Yann> BASE_DIR is used internally, while O is used on the command line,
 Yann> which makes it a bit ambiguous to know which to use. As users use
 Yann> O= on the command line, they will probably tend to use that in
 Yann> their post-build scripts.

Ok. I guess most people don't need the upper O/BASE_DIR variables, but
lets add the for completeness.

 Yann> +++ b/docs/manual/customize-rootfs.txt
 Yann> @@ -37,6 +37,13 @@ there are a few ways to customize the resulting target filesystem.
 Yann>    certain package generates wrong or unneeded files, you should fix
 Yann>    that package rather than work around it with a post-build cleanup
 Yann>    script. _Among these first 3 methods, this one should be preferred_.
 Yann> +  You may also use these variables in your post-build script:
 Yann> +    - +BUILDROOT_CONFIG+: the path to the Buildroot .config file
 Yann> +    - +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+: see
 Yann> +      xref:generic-package-reference[]
 Yann> +    - +BINARIES_DIR+: the place were all binary files (aka images) are

s/were/where/

Committed with the typo fixed, thanks.

-- 
Bye, Peter Korsgaard
