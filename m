From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Apr 2013 17:53:00 +0200
Subject: [Buildroot] [PATCH 1/2] netsnmp: enable agentx support by
	default
In-Reply-To: <1366072783-28319-1-git-send-email-gustavo@zacarias.com.ar>
References: <1366072783-28319-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <516EC55C.2090802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/04/13 02:39, Gustavo Zacarias wrote:
> Enable agentx support by default, it's required for newer versions of
> quagga.

  Then quagga help text should get a remark that it requires agentx to be 
configured in netsnmp.

  Regards,
  Arnout

>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   package/netsnmp/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
> index d5056f9..d94abb7 100644
> --- a/package/netsnmp/Config.in
> +++ b/package/netsnmp/Config.in
> @@ -17,7 +17,7 @@ config BR2_PACKAGE_NETSNMP_ENABLE_MIBS
>
>   config BR2_PACKAGE_NETSNMP_WITH_MIB_MODULES
>   	string "Build with these MIB modules"
> -	default "host ucd-snmp/dlmod"
> +	default "host ucd-snmp/dlmod agentx"
>   	depends on BR2_PACKAGE_NETSNMP
>   	help
>   	  Specify which MIB modules to include.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
