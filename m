From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Feb 2016 16:50:37 +0100
Subject: [Buildroot] [PATCH 1/1] protobuf: fix detection of __atomic_*()
	built-ins
In-Reply-To: <1455118392-3965-1-git-send-email-casantos@datacom.ind.br>
References: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
 <1455118392-3965-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20160210165037.1b02b8ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks, this looks good, with one nit, see below.

On Wed, 10 Feb 2016 13:33:12 -0200, Carlos Santos wrote:

> diff --git a/package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch b/package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch
> new file mode 100644
> index 0000000..237bc71
> --- /dev/null
> +++ b/package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch
> @@ -0,0 +1,34 @@
> +From 0883fa19d59ece19eec30937c65fd10162ef57b0 Mon Sep 17 00:00:00 2001
> +From: Carlos Santos <casantos@datacom.ind.br>
> +Date: Wed, 10 Feb 2016 12:54:43 -0200
> +Subject: [PATCH] configure.ac: check if libatomic is needed
> +
> +In Buildroot, to simplify things, we've decided to simply require gcc 4.8
> +as soon as the architectures has at least one __atomic_*() built-in
> +variant that requires libatomic.
> +
> +Since protobuf most likely only uses the 1, 2 and 4-byte variants, it
> +*could* technically build with gcc 4.7. This is probably not a big deal,
> +and we can live with requiring gcc 4.8 on PowerPC to build protobuf.
> +
> +Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

The patch description should not mention Buildroot and not mention
Buildroot specific choices. It should be written as if you were going
to submit it upstream, i.e with a proper justification as to why
linking with libatomic may be needed.

And in fact, I'm even going to ask you to submit this patch upstream :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
