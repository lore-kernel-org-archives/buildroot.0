From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 28 Jun 2011 15:09:27 +0200
Subject: [Buildroot] [PATCH] New packages: acl and attr
In-Reply-To: <20110628104841.731f2371@skate>
References: <4E09922C.6060803@visionsystems.de> <20110628104841.731f2371@skate>
Message-ID: <4E09D287.5060608@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> This:
>
>> +ACL_INSTALL_STAGING_OPT = prefix=$(STAGING_DIR)/usr exec_prefix=$(TARGET_DIR)/usr PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib install-dev install-lib
>> +ACL_INSTALL_TARGET_OPT = prefix=$(TARGET_DIR)/usr exec_prefix=$(TARGET_DIR)/usr install install-lib
> and this:
>
>> +ATTR_INSTALL_STAGING_OPT = prefix=$(STAGING_DIR)/usr exec_prefix=$(STAGING_DIR)/usr PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib install-dev install-lib
>> +ATTR_INSTALL_TARGET_OPT = prefix=$(TARGET_DIR)/usr exec_prefix=$(TARGET_DIR)/usr install install-lib
> requires justification. It apparently looks strange and unnecessary. So
> if it is actually needed, a comment explaining why would be useful.

These passages are needed because of non-conform installation routine (as far as I can see). Otherwise installation script would try to install the files to /usr/ directly.

Best regards,
Yegor
