From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 13:35:25 +0200
Subject: [Buildroot] [PATCH] u-boot: Add sha256 hash value for earlier
 2013.10 version.
In-Reply-To: <alpine.LFD.2.11.1504191245070.8977@localhost>
References: <alpine.LFD.2.11.1504191245070.8977@localhost>
Message-ID: <20150421133525.0589481e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Robert P. J. Day,

On Sun, 19 Apr 2015 12:49:26 -0400 (EDT), Robert P. J. Day wrote:
> 
> Add a hash value for u-boot-2013.10.tar.bz2.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
>   if i understand this correctly, if a package has no hash file, then
> downloading generates a warning. but with the newly-added uboot.hash
> file, the missing sha256sum for the earlier 2013.10 version generates
> an "ERROR" when running "make source", even though the tarball is in
> fact downloaded correctly. so just add a hash value to quiet the
> download.

Nope, that's not the right way of doing things. First and foremost, a
missing hash in the hash file is currently not a hard failure, only a
warning. It will be turned into a hard failure soon, but with
appropriate handling of custom versions (see the patch series being
sent by Yann E. Morin and Arnout Vandecappelle about this).

The problem with your patch is that it adds just the hash file 2013.10.
What about the dozens of other U-Boot releases? And the zillions of
U-Boot forks all over the place?

Since it doesn't scale, we're going t keep it is simple: a hash for the
default U-Boot version currently used by Buildroot, and that's it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
