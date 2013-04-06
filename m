From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 6 Apr 2013 20:19:32 +0200
Subject: [Buildroot] Quick analysis of the last build failures
In-Reply-To: <20130405141247.67149ee7@skate>
References: <20130405141247.67149ee7@skate>
Message-ID: <CAHXCMMJjy-R6h7Hc2G1hkXyubgzSPKf_k7hQpe3BZy5_e4ORqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Yann, all,

2013/4/5 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Hello,
>
> Here is a quick analysis of the last build failures, so that we discuss
> how to solve them. If anyone is interested in taking any of the
> following issues and work on it, that would be great.
>
[...]
>
>  * lttng-libust on arm
>    http://autobuild.buildroot.org/results/dff75bdc6383714588f69981761f09f72b516de3/build-end.log
>
>    Compiler failure. I've reported this failure some time ago on the
>    Crosstool-NG mailing list (because it happens with a toolchain
>    generated with Crosstool-NG). See
>    http://sourceware.org/ml/crossgcc/2013-01/msg00011.html. 4.6.3 is
>    still the latest version in the 4.6.x series.
>
>    We could also bump lttng-libust to 2.1.2 and see if any code change
>    happens to workaround the compiler bug.

Bumping lttng-libust to 2.1.2, or 2.2.0-rc1, does not fix the problem.
However, adding this patch (from Yocto) to crosstool-NG does fix this
lttng-libust build issue:
http://git.openembedded.org/openembedded-core/plain/meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-50099.patch?id=61dac2f6f68bc46d8f3f6f7a8757924f103c7c54

So, I think now it's Yann's call to integrate this patch in crosstool-NG.

Note that this patch does not seem applied upstream since it can be
applied on all the following branches of gcc:
gcc-4_6-branch, gcc-4_7-branch gcc-4_8-branch, master.


Regards,


-- 
Samuel
