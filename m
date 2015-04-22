From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:51:43 +0200
Subject: [Buildroot] [PATCH 2/5] psplash: move systemd service files to
 /usr/lib
In-Reply-To: <1429638638-28695-3-git-send-email-mike@mikebwilliams.com>
References: <1429638638-28695-1-git-send-email-mike@mikebwilliams.com>
 <1429638638-28695-3-git-send-email-mike@mikebwilliams.com>
Message-ID: <20150422225143.724a7bfb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Tue, 21 Apr 2015 13:50:35 -0400, Mike Williams wrote:
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>
> ---
>  package/psplash/psplash.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
> index 5901547..85c0fb8 100644
> --- a/package/psplash/psplash.mk
> +++ b/package/psplash/psplash.mk
> @@ -11,15 +11,15 @@ PSPLASH_AUTORECONF = YES
>  
>  define PSPLASH_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 644 package/psplash/psplash-start.service \
> -		$(TARGET_DIR)/etc/systemd/system/psplash-start.service
> +		$(TARGET_DIR)/usr/lib/systemd/system/psplash-start.service
>  	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
> -	ln -sf  ../psplash-start.service \
> +	ln -sf  ../../../../usr/lib/systemd/system/psplash-start.service \
>  		 $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/

We usually use a full destination path here.

>  
>  	$(INSTALL) -D -m 644 package/psplash/psplash-quit.service \
> -		$(TARGET_DIR)/etc/systemd/system/psplash-quit.service
> +		$(TARGET_DIR)/usr/lib/systemd/system/psplash-quit.service
>  	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -	ln -sf  ../psplash-quit.service \
> +	ln -sf  ../../../../usr/lib/systemd/system/psplash-quit.service \
>  		 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/

And here.

Nonetheless, I've applied the patch as is, I'll let you decide in which
direction the systemd service installation commands should be
made consistent across packages.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
