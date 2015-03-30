From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:29:26 +0200
Subject: [Buildroot] [PATCH 1/2] package/libseccomp: bump version to
 2.2.0
In-Reply-To: <1427638949-3191-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427638949-3191-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150330232926.2904e95b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 29 Mar 2015 16:22:28 +0200, Bernd Kuhls wrote:

> diff --git a/package/libseccomp/0001-remove-static.patch b/package/libseccomp/0001-remove-static.patch

Do you think you could try to submit this upstream? If not, maybe we
should just make the package depends on !BR2_STATIC_LIBS.

> diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
> index f87633e..6bca5c2 100644
> --- a/package/libseccomp/libseccomp.hash
> +++ b/package/libseccomp/libseccomp.hash
> @@ -1,2 +1,2 @@
> -# Locally computed:
> -sha256  8812c11e407c383f5ad6afb84a88e5a0224477bcfe8ff03f0c548e5abaac841c  libseccomp-2.1.1.tar.gz
> +# From https://github.com/seccomp/libseccomp/releases/tag/v2.2.0
> +sha1	5aa8a230f8529d6ee777098550245e43d2247395fdfd5a2176e28cf7236f1b10	libseccomp-2.2.0.tar.gz

Since you're switching to github, I've removed the hash file, because
github does not guarantee to offer identical tarballs for a given
release.

Committed with the hash file removed (for the static issue, I've kept
your patch).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
