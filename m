From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 22:15:34 +0200
Subject: [Buildroot] [PATCH v2 1/2] easy-rsa: new package
In-Reply-To: <1496088535-25501-1-git-send-email-julien@vdg.name>
References: <1496088535-25501-1-git-send-email-julien@vdg.name>
Message-ID: <20170529221534.72b6dfd3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 May 2017 22:08:54 +0200, Julien Viard de Galbert wrote:
> Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
> ---
> Changes v1 -> v2
>   - Install missing file 'openssl-1.0.cnf'
>   - Add select BR2_PACKAGE_OPENSSL and update description (Thanks Romain Naour)
>   - Updated INSTALL call (Thanks Romain Naour)
> 
> Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
> ---
>  package/Config.in              |  1 +
>  package/easy-rsa/Config.in     | 14 ++++++++++++++
>  package/easy-rsa/easy-rsa.hash |  2 ++
>  package/easy-rsa/easy-rsa.mk   | 19 +++++++++++++++++++

Please merge the change to the DEVELOPERS file in the same patch.


> diff --git a/package/Config.in b/package/Config.in
> index d57813c..14e5b14 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -942,6 +942,7 @@ menu "Crypto"
>  	source "package/botan/Config.in"
>  	source "package/ca-certificates/Config.in"
>  	source "package/cryptodev/Config.in"
> +	source "package/easy-rsa/Config.in"

easy-rsa is not a library, so it shouldn't go in Libraries->Crypto.

> +define EASY_RSA_INSTALL_TARGET_CMDS
> +    $(INSTALL) -D -m 0755 $(@D)/easyrsa $(TARGET_DIR)/usr/bin/easyrsa
> +    $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/easy-rsa/x509-types
> +    $(INSTALL) -D -m 0644 $(@D)/x509-types/* $(TARGET_DIR)/etc/easy-rsa/x509-types
> +    $(INSTALL) -D -m 0644 $(@D)/openssl-1.0.cnf $(TARGET_DIR)/etc/easy-rsa/openssl-1.0.cnf
> +    $(INSTALL) -D -m 0644 $(@D)/vars.example $(TARGET_DIR)/etc/easy-rsa/vars

Use one tab for indentation here, not 4 spaces.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
