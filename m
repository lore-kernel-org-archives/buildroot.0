From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 20:18:41 +0200
Subject: [Buildroot] [PATCH] package/libnspr: disable for musl toolchains
In-Reply-To: <1440870131-17263-1-git-send-email-romain.naour@openwide.fr>
References: <1440870131-17263-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150829201841.227bc47d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 29 Aug 2015 19:42:11 +0200, Romain Naour wrote:
> libnspr use getprotobyname_r() which is not available on musl.
> 
> Also there is another error due to missing _PR_HAVE_GETHOSTBYNAME2 define:
> prnetdb.c: In function ?PR_GetIPNodeByName?:
> prnetdb.c:898:2: error: #error "Unknown name-to-address translation function"
>  #error "Unknown name-to-address translation function"
> 
> _PR_HAVE_GETHOSTBYNAME2 is only set in pr/include/md/_linux.h if __GLIBC__
> is defined.
> 
> To conclude, libnspr is not ready for musl.
> Add reverse dependency on ecryptfs-utils and libnss.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c75/c756f82dfc49611fa3f650d9cf2a71b59d23c3d0/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Could you instead give a try to
http://git.alpinelinux.org/cgit/aports/tree/main/nspr/fix-getproto.patch ?

Generally speaking, for musl compatibility issues, always look at
http://git.alpinelinux.org/cgit/aports/tree/main/, it very often
contains interesting patches.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
