From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 08:56:22 +0200
Subject: [Buildroot] [PATCH v2 2/2] fs/cpio: make cpio rootfs
 reproducible
In-Reply-To: <20190716173518.11081-2-itsatharva@gmail.com>
References: <20190716173518.11081-1-itsatharva@gmail.com>
 <20190716173518.11081-2-itsatharva@gmail.com>
Message-ID: <20190717085622.6c1c6e58@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Jul 2019 23:05:18 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> +# --repoducible option was not introduced until cpio v2.12. Some distros

The kind of double negation here "was not introduced until" looked a
bit complicated compared to just "--reproducible was introduced in cpio
v2.12". I've simplified the paragraph to:

+# --repoducible option was introduced in cpio v2.12, which may not be
+# available in some old distributions, so we build host-cpio

And of course now I notice that --repoducible has a typo, and should be
--reproducible. Oh well.

> +# like Ubuntu 16.04 or Debian oldstable which package v2.11. Hence build
> +# host-cpio.
> +ifeq ($(BR2_REPRODUCIBLE), y)

No space after comma. I fixed that up.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
