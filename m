From: Nicholas Kinar <n.kinar@usask.ca>
Date: Mon, 21 Dec 2009 18:47:51 -0600
Subject: [Buildroot] [Bug 821] New: cp: illegal operation
In-Reply-To: <bug-821-163@https.bugs.busybox.net/>
References: <bug-821-163@https.bugs.busybox.net/>
Message-ID: <4B301737.5020402@usask.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcus--

It is good to know that you were able to get some aspects of buildroot 
up and running on Mac OS X.  How do you deal with build dependencies?  I 
have been attempting to run buildroot on 10.5 Leopard using the Fink 
binutils, but I found that I would still have to build fakeroot (and a 
few other associated utilities and libraries) from scratch.

Is fakeroot included with Mac OS X 10.6?  When building, do you still 
receive errors when stripping executables?  When I last tried to run 
buildroot on OS X, some header files particular to Linux-based systems 
could not be found.
Nicholas

bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=821
>
>               Host: MacBook Pro running Snow Leopard
>             Target: ARM SX-560
>              Build: buildroot
>            Summary: cp: illegal operation
>            Product: buildroot
>            Version: 2009.11
>           Platform: Macintosh
>         OS/Version: Mac OS
>             Status: NEW
>           Severity: normal
>           Priority: P5
>          Component: Other
>         AssignedTo: unassigned at buildroot.uclibc.org
>         ReportedBy: markus.schabel at gmail.com
>                 CC: buildroot at uclibc.org
>    Estimated Hours: 0.5
>
>
> When building the toolchain on my Mac, it always halts because of an illegal
> parameter for cp. the parameter "-d" is not supported on Mac OS X. The
> following patch should work on all systems:
>
> --- Makefile    2008-02-25 09:15:31.000000000 +0100
> +++ Makefile    2009-12-22 00:04:29.000000000 +0100
> @@ -283,11 +257,11 @@
>  $(BR2_DEPENDS_DIR): .config
>         rm -rf $@
>         mkdir -p $(@D)
> +       cp -af $(CONFIG)/buildroot-config $@
> -       cp -dpRf $(CONFIG)/buildroot-config $@
>
>  dirs: $(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
>
>
>   
