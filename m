From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jan 2017 14:45:01 +0100
Subject: [Buildroot] [PATCH 1/1] iptables: bump to version 1.6.1
In-Reply-To: <20170128225859.10877-1-Adamduskett@outlook.com>
References: <20170128225859.10877-1-Adamduskett@outlook.com>
Message-ID: <20170129144501.358cc011@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Jan 2017 17:58:59 -0500, Adam Duskett wrote:
> Also removed the 3 patches as they have been added into the latest
> version.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/iptables/0001-fix-build-with-musl.patch    | 67 ----------------------
>  ...-xtables-config-parser.h-to-BUILT_SOURCES.patch | 39 -------------
>  .../0003-extensions-added-AR-substitution.patch    | 33 -----------
>  package/iptables/iptables.hash                     |  6 +-
>  package/iptables/iptables.mk                       |  2 +-
>  5 files changed, 4 insertions(+), 143 deletions(-)
>  delete mode 100644 package/iptables/0001-fix-build-with-musl.patch
>  delete mode 100644 package/iptables/0002-iptables-add-xtables-config-parser.h-to-BUILT_SOURCES.patch
>  delete mode 100644 package/iptables/0003-extensions-added-AR-substitution.patch

You forgot to drop IPTABLES_AUTORECONF = YES, which was no longer
needed since we no longer have any patches on this package. I've fixed
this and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
