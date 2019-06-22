From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 10:08:05 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/iputils: create ping6
 symlink in post install target hook
In-Reply-To: <20190619213008.7883-3-petr.vorel@gmail.com>
References: <20190619213008.7883-1-petr.vorel@gmail.com>
 <20190619213008.7883-3-petr.vorel@gmail.com>
Message-ID: <20190622100805.30242505@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Jun 2019 23:30:08 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> +# upstream requires distros to create symlink
> +define IPUTILS_CREATE_PING6_SYMLINK
> +ln -sv $(TARGET_DIR)/bin/ping $(TARGET_DIR)/bin/ping6

Such commands are normally indented. Also instead of -sv, you should
have used -sf. The verbosity is not needed, but the -f is needed so
that reinstallation of the package works properly.

I've applied after fixing this. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
