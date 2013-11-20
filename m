From: Chris Zankel <chris@zankel.net>
Date: Wed, 20 Nov 2013 14:28:18 -0800
Subject: [Buildroot] (no subject)
In-Reply-To: <20131120220942.8505D8D0A8@whitealder.osuosl.org>
References: <20131120220942.8505D8D0A8@whitealder.osuosl.org>
Message-ID: <528D3782.60609@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry about the invalid and missing subject lines for this and the other 
two emails...

On 11/20/13, 2:09 PM, chris at zankel.net wrote:
>  From 2f2ca743fab0a0b2aaf5658a532e09b2d64248c3 Mon Sep 17 00:00:00 2001
> Message-Id: <cover.1384984956.git.chris@zankel.net>
> From: Chris Zankel <chris@zankel.net>
> Date: Wed, 20 Nov 2013 14:02:36 -0800
> Subject: [PATCH 0/2] *** SUBJECT HERE ***
> To: buildroot at busybox.net
>
> Hi,
>
> These two patches fix two of the broken builds for Xtensa:
> - coreutils
> - cdrkit
>
> The first patch enables valloc for recent versions of uClibc (snapshot), which
> is still used by cdrkit. The second patch disables libnsrp for Xtensa
> (!BR_xtensa), which is used by libnss, and consequently libnss and ecryptfs.
>
> Thanks,
> -Chris
>
> Chris Zankel (2):
>    uclibc-snapshot: enable option UCLIBC_SUSV2_LEGACY
>    libnspr: Add dependency on !BR2_xtensa
>
>   package/ecryptfs-utils/Config.in      | 1 +
>   package/libnspr/Config.in             | 3 ++-
>   package/libnss/Config.in              | 1 +
>   package/uclibc/uClibc-snapshot.config | 1 +
>   4 files changed, 5 insertions(+), 1 deletion(-)
>
