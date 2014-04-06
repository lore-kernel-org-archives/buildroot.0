From: Philippe Reynes <tremyfr@yahoo.fr>
Date: Sun, 6 Apr 2014 10:25:24 +0100 (BST)
Subject: [Buildroot] [PATCH 0/2] use host compressor for rootfs
In-Reply-To: <20140406075912.GC4096@tarshish>
References: <1396770501-9443-1-git-send-email-tremyfr@yahoo.fr>
 <20140406075912.GC4096@tarshish>
Message-ID: <1396776324.27939.YahooMailNeo@web28803.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

I've missed this "mandatory dependancy".
I suppose that this dependancy is usefull to uncompress tarball.
But I think that the compilation of firmware should be done with
tools compiled by buildroot.

If lzma is used to compress the rootfs, then lzma is compile
by builtoot. If gzip is used to compress the rootfs, then we use
local gzip. It's not very "coherent".
And using compiled binary with buildroot increase chance to
regenerate firmware on (very) different machine.

And I agree with you, it's not a "real" issue, it's more a "nice to have".

Regards,
Philippe



Le Dimanche 6 avril 2014 9h59, Baruch Siach <baruch@tkos.co.il> a ?crit :
 
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
>?  rootfs-gzip: use host-gzip instead of local gzip
>?  rootfs-bzip: use host-bzip2 instead of local bzip2
> 
>? fs/common.mk? ? ? ? ?  |? ? 6 ++++--
>? package/bzip2/bzip2.mk |? ? 2 ++
>? package/gzip/gzip.mk?  |? ? 3 +++
>? 3 files changed, 9 insertions(+), 2 deletions(-)
> 
> -- 
> 1.7.4.4

-- 
? ? http://baruch.siach.name/blog/ ? ? ? ? ? ? ? ?  ~. .~?  Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
?  - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il 
-
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140406/9ef8f90e/attachment.html>
