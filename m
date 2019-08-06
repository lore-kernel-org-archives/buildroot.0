From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 22:21:51 +0200
Subject: [Buildroot] [PATCH] package/mdadm: fix build with musl libc
In-Reply-To: <bce23fa411b7cac84c3602105105ab5d2c35baba.1565097477.git.baruch@tkos.co.il>
References: <bce23fa411b7cac84c3602105105ab5d2c35baba.1565097477.git.baruch@tkos.co.il>
Message-ID: <20190806222151.4851c1c6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  6 Aug 2019 16:17:57 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Add a patch to make sys/sysmacros.h include unconditional for the
> major/minor macros. musl libc recently removed include of
> sys/sysmacros.h from sys/types.h (musl commit a31a30a0076c28).
> 
> Fixes:
> http://autobuild.buildroot.net/results/37d6b351f989ceaf1acf0fe0b3b9be6d1c5c300e/
> http://autobuild.buildroot.net/results/a0d9b49c99b36468e2ef506d55a1c3cbbcf43a4e/
> http://autobuild.buildroot.net/results/979b5e9dd8fb27969ed6bd0b82d9dd5f88b2b986/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...-include-sysmacros.h-unconditionally.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/mdadm/0002-mdadm.h-include-sysmacros.h-unconditionally.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
