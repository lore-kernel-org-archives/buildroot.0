From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Sep 2017 15:49:02 +0200
Subject: [Buildroot] [PATCH] package/flex: really disable flex program
In-Reply-To: <20170929134709.24221-1-yann.morin.1998@free.fr>
References: <20170929134709.24221-1-yann.morin.1998@free.fr>
Message-ID: <20170929154902.058b9a48@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Sep 2017 15:47:09 +0200, Yann E. MORIN wrote:

> diff --git a/package/flex/0003-build-never-build-the-flex-program.patch b/package/flex/0003-build-never-build-the-flex-program.patch
> new file mode 100644
> index 0000000000..550df179c9
> --- /dev/null
> +++ b/package/flex/0003-build-never-build-the-flex-program.patch
> @@ -0,0 +1,42 @@
> +From 097a4408b83a0bf8c584bbe4fe0239581b183732 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Fri, 29 Sep 2017 15:41:14 +0200
> +Subject: [PATCH] build: never build the flex program

This will also disable the build of flex the program in host-flex,
which is not good: we want host-flex to install the flex program.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
