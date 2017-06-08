From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:32:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdbm: fix uclibc build error
In-Reply-To: <20170605152724.12167-1-bernd.kuhls@t-online.de>
References: <20170605152724.12167-1-bernd.kuhls@t-online.de>
Message-ID: <20170608213209.0557b609@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Jun 2017 17:27:24 +0200, Bernd Kuhls wrote:
> This patches fixes
> 
> gdbmopen.c:35:40: error: unknown type name 'blksize_t'
>  compute_directory_size (GDBM_FILE dbf, blksize_t block_size,
> 
> To get the missing define we need to pass -D_GNU_SOURCE.
> 
> Fixes
> http://autobuild.buildroot.net/results/592/59278fb8681d474883e6551df5173edd806b16fa/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

The real bug is in uClibc, the proper fix is
https://patchwork.ozlabs.org/patch/772049/.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
