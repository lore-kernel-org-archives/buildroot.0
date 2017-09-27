From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 23:12:42 +0200
Subject: [Buildroot] [PATCH v3 0/7] glibc: bump to 2.26
In-Reply-To: <20170923212414.16744-1-romain.naour@gmail.com>
References: <20170923212414.16744-1-romain.naour@gmail.com>
Message-ID: <e2bc3587-ca5e-9aef-752e-3902abe1624d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-09-17 23:23, Romain Naour wrote:
> This series bump glibc to the latest release and allow to remove all
> patches required for the previous version! But glibc come with some
> new issue that are hopefully already fixed in the 2.26.x stable branch.

 Applied the series to master, thanks.


> While testing this new version, some build issues has been dicovered.
> Two gcc patch are needed to build a toolchain with older compiler
> (gcc 4.9 to 6.4), gcc 7.2 contain already the fix.
> 
> Backport a series related to bug 21930 and 22146.
> Without them the float128 support break the C++ build for some
> packages.
> 
> https://sourceware.org/bugzilla/show_bug.cgi?id=21930
> https://sourceware.org/bugzilla/show_bug.cgi?id=22146
> 
> This third series is for testing and review.
> Let's hope that glibc 2.26.1 will be released soon :)

 As discussed on IRC:

 Apparently there won't be a glibc 2.26.1. It's up to distros to pick a git
commit to release. So we have the choice to either keep a lot of patches in
Buildroot, or use a git download instead of a tarball. The latter has the
disadvantage of having a silly version "number" (the sha1), and that git
downloads are generally much slower.

 For now, we have those 6 patches in Buildroot. This may change in the future.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
