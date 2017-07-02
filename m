From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 2 Jul 2017 23:57:54 +0200
Subject: [Buildroot] [PATCH v3 1/1] easy-rsa: new package
In-Reply-To: <22970151-885b-9718-6d72-cc49e78f7b4e@gmail.com>
References: <1496091819-27396-1-git-send-email-julien@vdg.name>
 <22970151-885b-9718-6d72-cc49e78f7b4e@gmail.com>
Message-ID: <cd350c48-5aaf-1d1d-7177-21f3820b10f7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>> +++ b/package/easy-rsa/easy-rsa.mk
>> @@ -0,0 +1,19 @@
>> +################################################################################
>> +#
>> +# easy-rsa
>> +#
>> +################################################################################
>> +
>> +EASY_RSA_VERSION = 3.0.1
>> +EASY_RSA_SOURCE = EasyRSA-$(EASY_RSA_VERSION).tgz
>> +EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/$(EASY_RSA_VERSION)
> 
> Missing package license infos:
> EASY_RSA_LICENSE = GPL-2.0
> EASY_RSA_LICENSE_FILES = COPYING.md

Sorry, the license file bundled with 3.0.1 is COPYING:

EASY_RSA_LICENSE_FILES = COPYING

Best regards,
Romain
> 
> With that fixed:
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> 
> Best regards,
> Romain
> 
>> +
>> +define EASY_RSA_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -D -m 0755 $(@D)/easyrsa $(TARGET_DIR)/usr/bin/easyrsa
>> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/easy-rsa/x509-types
>> +	$(INSTALL) -D -m 0644 $(@D)/x509-types/* $(TARGET_DIR)/etc/easy-rsa/x509-types
>> +	$(INSTALL) -D -m 0644 $(@D)/openssl-1.0.cnf $(TARGET_DIR)/etc/easy-rsa/openssl-1.0.cnf
>> +	$(INSTALL) -D -m 0644 $(@D)/vars.example $(TARGET_DIR)/etc/easy-rsa/vars
>> +endef
>> +
>> +$(eval $(generic-package))
>>
> 
