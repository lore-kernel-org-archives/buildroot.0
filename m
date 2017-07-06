From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 7 Jul 2017 00:52:00 +0200
Subject: [Buildroot] [PATCH 1/3] mtd: fix build issues on older hosts
In-Reply-To: <20170706205849.22298-1-thomas.petazzoni@free-electrons.com>
References: <20170706205849.22298-1-thomas.petazzoni@free-electrons.com>
Message-ID: <dc4173ad-ffcb-2467-c565-49a2535fa6ec@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-07-17 22:58, Thomas Petazzoni wrote:
> Building the MTD test programs requires the MS_DIRSYNC, which is not
> necessarily available on old build machines. But obviously, MTD test
> programs are not needed, so we can simply disable them, as they were
> prior to the migration to mtd 2.0.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/21e1ad2a4560b6d3ba6490d20ae064246e66d5c1/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout


> ---
>  package/mtd/mtd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 7c3a2b6..043f1c7 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -45,6 +45,7 @@ MTD_CONF_OPTS += --without-xattr
>  endif
>  
>  HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-e2fsprogs
> +HOST_MTD_CONF_OPTS = --disable-tests
>  
>  MKFS_JFFS2 = $(HOST_DIR)/sbin/mkfs.jffs2
>  SUMTOOL = $(HOST_DIR)/sbin/sumtool
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
