From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 10:14:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdbm: fix build error
In-Reply-To: <20170604220950.22746-1-bernd.kuhls@t-online.de>
References: <20170604220950.22746-1-bernd.kuhls@t-online.de>
Message-ID: <20170605101420.2c585336@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Jun 2017 00:09:50 +0200, Bernd Kuhls wrote:

> +-compute_directory_size (GDBM_FILE dbf, blksize_t block_size,
> ++compute_directory_size (GDBM_FILE dbf, __blksize_t block_size,

This doesn't feel like the right fix, because uClibc does define
blksize_t:

#if defined __USE_UNIX98 && !defined __blksize_t_defined
typedef __blksize_t blksize_t;
# define __blksize_t_defined
#endif

Missing header include? __USE_UNIX98 not defined?

Perhaps a good question for Waldemar (added in Cc).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
