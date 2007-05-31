From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 31 May 2007 18:45:43 +0200
Subject: [Buildroot] BR2_STAGING_DIR config?
In-Reply-To: <465EF8D5.30902@gmail.com>
References: <465EF8D5.30902@gmail.com>
Message-ID: <20070531164543.GA22322@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 31, 2007 at 09:33:25AM -0700, Tom wrote:
>Hello,
>
>I want to use the cross development toolchain also for other projects 
>and thus defined:
>BR2_STAGING_DIR="/tw/tools/gnu/cygwin/arm-linux"
>
>However, I am getting this error in libutils, what am I missing please?

I was looking into toolchains that can be moved around to other machines
without problems.
See the archives, thread
Subject: Re: [Buildroot] [patch] sysroot support in toolchain,
        use correct pathes in staging_dir

for details.
The last patch is here:
http://uclibc.org/~aldot/buildroot.mine.cow.20070515-1321.diff.bz2

But i am hesitating to fix this, since the outdated, deprecated gcc-3.4
series will break with these changes (and i didn't see yet how to fix
that without touching this ancient gcc, which i refuse to do).
