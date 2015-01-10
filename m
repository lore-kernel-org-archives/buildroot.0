From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 16:34:53 +0100
Subject: [Buildroot] [PATCH 2/2] package/sane-backends: remove unsafe
 headers path
In-Reply-To: <1420902661-20721-2-git-send-email-romain.naour@openwide.fr>
References: <1420902661-20721-1-git-send-email-romain.naour@openwide.fr>
 <1420902661-20721-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150110163453.0d3cc906@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 10 Jan 2015 16:11:01 +0100, Romain Naour wrote:

> +diff --git a/configure.in b/configure.in
> +index a8fc950..0b0bcd1 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -82,7 +82,7 @@ AM_CONDITIONAL(CROSS_COMPILING, test x$cross_compiling = xyes)
> + dnl ***********************************************************************
> + dnl set compiler/linker flags
> + dnl ***********************************************************************
> +-INCLUDES="${INCLUDES} -I/usr/local/include"
> ++INCLUDES="${INCLUDES}"

Hum, INCLUDES="${INCLUDES}" could also be replaced with just nothing,
no? So shouldn't your patch simply get rid of this line?

Also, please submit upstream, thanks :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
