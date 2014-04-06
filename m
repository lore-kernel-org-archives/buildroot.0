From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 6 Apr 2014 10:59:12 +0300
Subject: [Buildroot] [PATCH 0/2] use host compressor for rootfs
In-Reply-To: <1396770501-9443-1-git-send-email-tremyfr@yahoo.fr>
References: <1396770501-9443-1-git-send-email-tremyfr@yahoo.fr>
Message-ID: <20140406075912.GC4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Philippe,

On Sun, Apr 06, 2014 at 09:48:19AM +0200, Philippe Reynes wrote:
> When the rootfs is compressed with lzma, lzo or xz, we
> use the binary compiled by buildroot. But with gzip
> or bzip, we use the tools of the machine. This serie
> change this behaviour for gzip and bzip2, it add
> a dependancy on host-<compressor> and use it to
> compress the rootfs.

gzip and bzip2 are mandatory dependencies of buildroot 
(http://nightly.buildroot.org/manual.html#requirement-mandatory). These 
packages are shipped by default with virtually all general purpose distros. 
What problem are you trying to fix besides consistency?

baruch

> Philippe Reynes (2):
>   rootfs-gzip: use host-gzip instead of local gzip
>   rootfs-bzip: use host-bzip2 instead of local bzip2
> 
>  fs/common.mk           |    6 ++++--
>  package/bzip2/bzip2.mk |    2 ++
>  package/gzip/gzip.mk   |    3 +++
>  3 files changed, 9 insertions(+), 2 deletions(-)
> 
> -- 
> 1.7.4.4

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
