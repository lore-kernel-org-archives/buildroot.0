From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 17:03:16 +0200
Subject: [Buildroot] [PATCH v4 1/1] capnproto: new package
In-Reply-To: <1531261885-2834-1-git-send-email-JoelsonCarl@gmail.com>
References: <1531261885-2834-1-git-send-email-JoelsonCarl@gmail.com>
Message-ID: <20180716170316.25a89bb7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Jul 2018 16:31:25 -0600, Joel Carlson wrote:
> Adds the capnproto package. This also builds a host variant to generate
> the capnp compiler that can be used to compile message definitions into
> C++ code. Includes a patch from upstream to fix an issue with uclibc.
> 
> Signed-off-by: Koen Martens <gmc@sonologic.nl>
> Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>

Thanks, I've applied, after doing one more change.

> +CAPNPROTO_CONF_ENV += LIBS=-latomic

You can't do that unconditionally, because libatomic doesn't always
exists. This needs to be enclosed in a BR2_TOOLCHAIN_HAS_LIBATOMIC
condition.

For example, some architectures provide __atomic built-ins with gcc
4.7 (so BR2_TOOLCHAIN_HAS_ATOMIC is true), and there was no libatomic at
the time (so BR2_TOOLCHAIN_HAS_LIBATOMIC is false).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
