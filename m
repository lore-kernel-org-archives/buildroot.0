From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jun 2010 09:22:01 +0200
Subject: [Buildroot] [PATCH] cdrkit: fix build by adding zlib as
 dependency
In-Reply-To: <1275860600-19335-1-git-send-email-bjorn.forsman@gmail.com>
References: <1275860600-19335-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20100607092201.2847fba7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Jun 2010 23:43:20 +0200
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> -CDRKIT_DEPENDENCIES=libcap bzip2 host-cmake
> +CDRKIT_DEPENDENCIES=libcap bzip2 zlib host-cmake
>  HOST_CDRKIT_DEPENDENCIES=host-libcap host-cmake host-bzip2

If zlib is indeed needed on the target, we also need to add it on the
host as well, ie:

HOST_CDRKIT_DEPENDENCIES=host-libcap host-cmake host-bzip2 host-zlib

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
