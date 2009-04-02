From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 2 Apr 2009 11:40:33 +1100
Subject: [Buildroot] [PATCH 4/5] mtd-utils: Version bump of the
	GIT	source
In-Reply-To: <1238098807-5648-5-git-send-email-mroth@nessie.de>
References: <1238098807-5648-1-git-send-email-mroth@nessie.de>
	<1238098807-5648-5-git-send-email-mroth@nessie.de>
Message-ID: <20090402004033.GC29488@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 26, 2009 at 09:20:06PM +0100, Michael Roth wrote:
> GIT version of mtd-utils bumped to 2009-03-26 and support
> for the included mkfs.ubifs added.
> 
[...]
> +config BR2_PACKAGE_MTD_MKFSUBIFS
> +	bool "mkfs.ubifs"

It's pretty unlikely that you would want mkfs.ubifs on your target
system but I guess it's correct to include it. Actually I may need it
for my current project anyway :-|

> +	default n

That's superflous.

> +	depends on BR2_PACKAGE_MTD_UTILS_GIT && BR2_LARGEFILE && BR2_PACKAGE_E2FSPROGS

Depending on BR2_PACKAGE_E2FSPROGS also means a bunch of other binaries
get included by default. I think libuuid needs to be split out into a
separate package built from the same source tarball.



Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
