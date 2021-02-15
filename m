From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Feb 2021 14:00:01 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/x265: update project URL
In-Reply-To: <20210215094134.2250-1-sebastien.szymanski@armadeus.com>
References: <20210215094134.2250-1-sebastien.szymanski@armadeus.com>
Message-ID: <20210215140001.2659f390@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Feb 2021 10:41:34 +0100
S?bastien Szymanski <sebastien.szymanski@armadeus.com> wrote:

> diff --git a/package/x265/x265.hash b/package/x265/x265.hash
> index 3d70ac0c67..a2246fc84d 100644
> --- a/package/x265/x265.hash
> +++ b/package/x265/x265.hash
> @@ -1,5 +1,4 @@
> -# From https://mailman.videolan.org/pipermail/x265-devel/2020-February/012880.html
> -md5  0c8c747b59b5411dea8cf557554636c1  x265_3.3.tar.gz
>  # Locally generated
> -sha256  f26e148ed1f4dfb33fd1eb3ff5e60e08078d1b2017e88bcbb045b3fb58300b9c  x265_3.3.tar.gz
> +md5  be6ea7a139b01fa6f2614d5c1197492d  x265_3.3.tar.gz
> +sha256  c6d744a87eda55560da715f56f878640554ddc06e2d0fcbd822fa330affc22cc  x265_3.3.tar.gz

This will not work: the same file having two different hashes.
2020.11.x has the same 3.3 version. So if we merge this patch in next,
we will have 2020.11.x and 2021.02.x using the old tarball with the old
hash, and 2021.05.x using the new tarball with the new hash. Except
that sources.buildroot.net can only store one of those tarballs... as
they have the same name.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
