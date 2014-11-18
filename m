From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Nov 2014 21:24:14 +0100
Subject: [Buildroot] [PATCH 5/9] dhcp: install dhclient to /sbin
In-Reply-To: <1416330117-4458-6-git-send-email-gustavo@zacarias.com.ar>
References: <1416330117-4458-1-git-send-email-gustavo@zacarias.com.ar>
 <1416330117-4458-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <546BAAEE.1020506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/11/14 18:01, Gustavo Zacarias wrote:
> Debian ifupdown uses an explicit call to /sbin/dhclient.
> Busybox ifupdown uses the search path.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/dhcp/dhcp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index 27fb60b..1eb6b32 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -59,7 +59,7 @@ define DHCP_INSTALL_CLIENT
>  	mkdir -p $(TARGET_DIR)/var/lib
>  	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
>  	$(INSTALL) -m 0755 -D $(DHCP_DIR)/client/dhclient \
> -		$(TARGET_DIR)/usr/sbin/dhclient
> +		$(TARGET_DIR)/sbin/dhclient
>  	$(INSTALL) -m 0644 -D package/dhcp/dhclient.conf \
>  		$(TARGET_DIR)/etc/dhcp/dhclient.conf
>  	$(INSTALL) -m 0755 -D package/dhcp/dhclient-script \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
