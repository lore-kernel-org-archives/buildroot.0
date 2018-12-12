From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Dec 2018 09:55:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/acpid: fix acpid.service
 permissions
In-Reply-To: <1544581204-28402-1-git-send-email-james.hilliard1@gmail.com>
References: <1544581204-28402-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <2afea5b8-3cbe-b67a-00a7-4e234caa37a1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi James,

On 12/12/2018 03:20, james.hilliard1 at gmail.com wrote:
> From: James Hilliard <james.hilliard1@gmail.com>

 Could you give a little more detail here? In particular: is it just because
it's not supposed to be executed, or does it in fact give some runtime problems
if it is executable? That information is important to decide if the patch should
be backported to the stable branches or not.

 Regards,
 Arnout

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/acpid/acpid.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
> index 514fd31..adcc175 100644
> --- a/package/acpid/acpid.mk
> +++ b/package/acpid/acpid.mk
> @@ -11,7 +11,7 @@ ACPID_LICENSE = GPL-2.0+
>  ACPID_LICENSE_FILES = COPYING
>  
>  define ACPID_INSTALL_INIT_SYSTEMD
> -	$(INSTALL) -D -m 0755 package/acpid/acpid.service \
> +	$(INSTALL) -D -m 0644 package/acpid/acpid.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/acpid.service
>  	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>  	ln -sf ../../../../usr/lib/systemd/system/acpid.service \
> 
