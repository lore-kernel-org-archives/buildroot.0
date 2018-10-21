From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 14:50:52 +0200
Subject: [Buildroot] [PATCH] file: explicitly disable libseccomp support
 for host
In-Reply-To: <20181008202834.13821-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 8 Oct 2018 22:28:34 +0200")
References: <20181008202834.13821-1-peter@korsgaard.com>
Message-ID: <87k1mb79ar.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/8a2/8a2ea2e4426416447705492237f526fc84b595d7/
 > http://autobuild.buildroot.net/results/a1f/a1f2369d31c2387efdec908877e0bcaa728b5aeb/

 > file-5.33 added optional seccomp support, but the filters did not cover all
 > needed syscalls, leading to errors when the freshly built host-file is
 > executed as part of the build on distributions with seccomp support (E.G.
 > Arch Linux):

 > checking for seccomp_init in -lseccomp... yes
 > ..
 > ../src/file -C -m magic
 > make[3]: *** [Makefile:764: magic.mgc] Bad system call

 > This has been fixed in file-5.34, but it anyway makes sense to explicitly
 > disable libseccomp support for consistency as we do not need it for the host
 > build.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
