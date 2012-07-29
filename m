From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jul 2012 18:43:08 +0200
Subject: [Buildroot] [PATCH] toolchain: add Sourcery CodeBench ARM
 2012.03
In-Reply-To: <1343565250-21699-1-git-send-email-tremyfr@yahoo.fr>
References: <1343565250-21699-1-git-send-email-tremyfr@yahoo.fr>
Message-ID: <20120729184308.37a046a1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Philippe,

Le Sun, 29 Jul 2012 14:34:10 +0200,
Philippe Reynes <tremyfr@yahoo.fr> a ?crit :

> Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
> ---
>  toolchain/toolchain-external/Config.in   |   22 ++++++++++++++++++++++
>  toolchain/toolchain-external/ext-tool.mk |    3 +++
>  2 files changed, 25 insertions(+), 0 deletions(-)

Thanks!

This patch has already been posted by Fabio Porcedda on July, 18th. And
even before that, on June, 3rd, I had posted the addition of other
glibc 2.15-based toolchains. Unfortunately, we cannot add them to
Buildroot as simply as your patch does: Buildroot currently makes the
assumption that the glibc toolchains always have RPC support. This was
effectively true until glibc 2.14, which got rid of the RPC support:
people are now supposed to use the separate libtirpc.

On June, 27th, I have posted an e-mail entitled "RPC support for modern
(e)glibc toolchains" which starts the discussion on how to integrate
libtirpc properly, and even though not impossible, things are not
completely simple.

So my plan is :

 * For 2012.08, don't add external toolchains using glibc 2.15, because
   it requires too much changes on how the RPC support is handled so
   late in the release cycle.
 
 * For 2012.11, continue the work to integrate libtirpc, so that we can
   add support for external toolchains that rely on glibc 2.15 and
   above.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
