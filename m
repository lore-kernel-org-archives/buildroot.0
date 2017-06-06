From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 6 Jun 2017 23:10:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdbm: fix build error
In-Reply-To: <20170605101420.2c585336@free-electrons.com>
References: <20170604220950.22746-1-bernd.kuhls@t-online.de>
 <20170605101420.2c585336@free-electrons.com>
Message-ID: <20170606211030.GQ26922@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Mon,  5 Jun 2017 00:09:50 +0200, Bernd Kuhls wrote:
> 
> > +-compute_directory_size (GDBM_FILE dbf, blksize_t block_size,
> > ++compute_directory_size (GDBM_FILE dbf, __blksize_t block_size,
> 
> This doesn't feel like the right fix, because uClibc does define
> blksize_t:
> 
> #if defined __USE_UNIX98 && !defined __blksize_t_defined
> typedef __blksize_t blksize_t;
> # define __blksize_t_defined
> #endif
> 
> Missing header include? __USE_UNIX98 not defined?
> 
> Perhaps a good question for Waldemar (added in Cc).

Fix sent to the list.
Some problem with uClibc-ng not in sync with glibc.

best regards
 Waldemar
