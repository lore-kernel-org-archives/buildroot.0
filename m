From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Jan 2017 14:03:29 +0100
Subject: [Buildroot] [PATCH] flac: fix benchmark linking issue with
	older glibc versions
In-Reply-To: <20170109212938.15613-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 9 Jan 2017 22:29:38 +0100")
References: <20170109212938.15613-1-peter@korsgaard.com>
Message-ID: <87d1fvkqxq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/b64/b643824d797050d7c001a3b72598158d8f1c6128/
 > http://autobuild.buildroot.net/results/a2f/a2f2d7b4e9e7b57bc8691e3ec29ecf818be3f79b/

 > The benchmark tool uses clock_gettime which is available in librt instead of
 > libc in older glibc versions.  The build system correctly links with -lrt on
 > Linux systems, but misdetects non-x86 linux systems as !linux, causing build
 > failures.

 > Add a patch to relax the linux OS detection to also work on non-x86 systems.

 > Patch submitted upstream:
 > http://lists.xiph.org/pipermail/flac-dev/2017-January/006103.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
