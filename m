From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Nov 2014 23:17:22 +0100
Subject: [Buildroot] [PATCH 07/10] dhcp: install dhclient to /sbin
In-Reply-To: <1415969096-3032-8-git-send-email-gustavo@zacarias.com.ar>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
 <1415969096-3032-8-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <54667F72.4050009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/11/14 13:44, Gustavo Zacarias wrote:
> Debian ifupdown uses an explicit call to /sbin/dhclient.
> Busybox ifupdown uses the search path.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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

 Then you should also update network-manager.mk:

NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/usr/sbin/dhclient


 Regards,
 Arnout

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
