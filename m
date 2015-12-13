From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:29:59 +0100
Subject: [Buildroot] [PATCH v4] openal: New package
In-Reply-To: <5665F394.4010008@dawncrow.de>
References: <5665F394.4010008@dawncrow.de>
Message-ID: <20151213222959.1f56cad8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Mon, 7 Dec 2015 22:01:08 +0100, Andr? Hentschel wrote:

> diff --git a/package/openal/Config.in b/package/openal/Config.in
> new file mode 100644
> index 0000000..cfd41fa
> --- /dev/null
> +++ b/package/openal/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_OPENAL
> +	bool "openal"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib

The comment "# alsa-lib" was bogus, since you don't select alsa-lib.
However, even without ALSA support, OpenAL needs thread support, so
I've removed this comment.

The rest of your patch looked good, so I applied it. However, quickly
after being pushed, a first build issue appeared:

  http://autobuild.buildroot.org/results/3b8/3b8dadb1fcb71dae3daf500df95e270c2f86ec3b/build-end.log

Can you have a look ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
