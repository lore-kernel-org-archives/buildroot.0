From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 8 Oct 2016 06:14:32 +0200
Subject: [Buildroot] [PATCH 2/3] ltp-testsuite: bump to version 20160920
In-Reply-To: <1475322624-20518-2-git-send-email-nunes.erico@gmail.com>
References: <1475322624-20518-1-git-send-email-nunes.erico@gmail.com>
 <1475322624-20518-2-git-send-email-nunes.erico@gmail.com>
Message-ID: <20161008041431.GO2052@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erico,
Erico Nunes wrote,

> Patch 0001-fix-uClibc-build.patch is now part of upstream so it is not
> needed in Buildroot anymore. The remaining patches were just rebased and
> then renumbered so that they apply cleanly to this new version.
> 
> This has been build-tested with both glibc and uClibc toolchains and
> run-tested on x86_64 and aarch64.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> 
> ---
> I wonder if we should really maintain the uClibc-related patches given
> that even the patches themselves mention that they are not upstreamable.
> This feels a bit like maintaining feature patches. If upstream adds more
> changes that break uClibc, we would need to maintain that ourselves.
> I'm interested in maintaining this package but if it turns out that it
> eventually starts breaking for uClibc in future versions, I'd vote for
> removing uClibc support for it.

No, I disagree here. The patches for uClibc are upstreamable.
Only the libtirpc patch has the comment and this is related to
features missing in uClibc and musl. (DES)

If more ltp tests should break and you want to maintain the package
please work with me and LTP people to get things working.

Compiling and running LTP with uClibc-ng is an important part of
getting missing features or bugs fixed.

It is not an option to disable the package for uClibc-ng.

This worked fine in the past, see exp10 related issues.

best regards
 Waldemar
