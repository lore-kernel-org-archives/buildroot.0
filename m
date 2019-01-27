From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Jan 2019 21:45:24 +0100
Subject: [Buildroot] [PATCH v2] syslog-ng: fix builds with static libc
In-Reply-To: <20190124195848.16647-1-judge.packham@gmail.com>
References: <20190124195848.16647-1-judge.packham@gmail.com>
Message-ID: <20190127214524.3eb64084@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Chris,

On Fri, 25 Jan 2019 08:58:48 +1300
Chris Packham <judge.packham@gmail.com> wrote:

> diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
> index 1f83e39ff0..69c94da02b 100644
> --- a/package/syslog-ng/syslog-ng.hash
> +++ b/package/syslog-ng/syslog-ng.hash
> @@ -3,3 +3,4 @@ sha256 5cf931a9d7bead0e6d9a2c65eee8f6005a005878f59aa280f3c4294257ed5178  syslog-
>  sha256 835219c8ca76156e6337236d1bcb8e617c0b1c2783b4a8bc478e18a86743d607  COPYING
>  sha256 ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
>  sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
> +sha256 feb26f77921b42fa7e5468229d883c5fae0b349cd075013eec2cb071a677179b  d85121c0dc700cad4bd9735b0ee1dab9addf9dd7.patch
> diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
> index ecde9e8181..f96b97f30e 100644
> --- a/package/syslog-ng/syslog-ng.mk
> +++ b/package/syslog-ng/syslog-ng.mk
> @@ -18,6 +18,7 @@ SYSLOG_NG_AUTORECONF = YES
>  SYSLOG_NG_CONF_ENV = LIBS=-lrt
>  SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
>  	--disable-java --disable-java-modules --disable-mongodb
> +SYSLOG_NG_PATCH = https://github.com/balabit/syslog-ng/commit/d85121c0dc700cad4bd9735b0ee1dab9addf9dd7.patch

We no longer want to download patches from github, because their hashes
change once in a while (when a new commit is made to the repository,
the beginning of its SHA1 may be identical to the one of an existing
commit, in which case the SHA1 mentioned in patches are extended in
length, causing the contents of the patch and therefore its hash to
change). So we need such patches directly stored in package/syslog-ng/.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
