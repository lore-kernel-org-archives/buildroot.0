From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 16:13:25 +0200
Subject: [Buildroot] [PATCH] Revert "package/gettext-tiny: bump version
 to add --template option"
In-Reply-To: <20190407135543.GO2659@scaer>
References: <20190407073708.11205-1-yann.morin.1998@free.fr>
 <20190407151147.02ada3fa@windsurf> <20190407135543.GO2659@scaer>
Message-ID: <20190407161325.1d37e578@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 7 Apr 2019 15:55:43 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I think that, ideally, we would like to have:
>   - libintl headers that expose the same API as those from GNU gettext,
>   - a libintl (probably a static one) that exposes just stub functions.

Is this actually needed ? All of glibc, musl and uclibc provide
libintl.h, and a dummy implementation of libintl functions.

We only need the full-blown gettext on the target to provide libintl
with real functionality when NLS=y and uclibc/musl is used.

But other than that, when !NLS, the stub implementation in musl/uclibc
is fine, no ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
