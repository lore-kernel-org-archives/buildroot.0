From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 May 2015 23:17:33 +0200
Subject: [Buildroot] [PATCH v5 02/24] sqlite: Add host build support
In-Reply-To: <1431553177-7280-3-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-3-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150518231733.727c332a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Wed, 13 May 2015 16:39:15 -0500, Clayton Shotwell wrote:
> From: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> 
> ---
> Changes v4 -> v5:
>   - No changes
> ---
>  package/sqlite/sqlite.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
> index fff219a..aaf84fc 100644
> --- a/package/sqlite/sqlite.mk
> +++ b/package/sqlite/sqlite.mk
> @@ -50,3 +50,4 @@ SQLITE_CONF_OPTS += --disable-readline
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

When adding a host package, it's always good to indicate which other
package will be using it so that it doesn't seem to be a useless change.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
