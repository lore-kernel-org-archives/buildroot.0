From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 10 Jul 2015 18:01:19 -0500
Subject: [Buildroot] [PATCH v7 13/22] openssh: selinux and pam support
In-Reply-To: <CAHXCMML3=hbmcTV7p9ycJdohW4PCm_PoVaFmnGr3=ABZAKC3fQ@mail.gmail.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-14-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAHXCMML3=hbmcTV7p9ycJdohW4PCm_PoVaFmnGr3=ABZAKC3fQ@mail.gmail.com>
Message-ID: <CANn-YGR0YOea+262aXCsdqHzCmO+LfE+iZ4rc2nvmjysLkEhzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,


>> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
>> index 24af079..00cdf6c 100644
>> --- a/package/openssh/openssh.mk
>> +++ b/package/openssh/openssh.mk
>> @@ -30,8 +30,24 @@ endif
>>  OPENSSH_DEPENDENCIES = zlib openssl
>>
>>  ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>> +define OPENSSH_INSTALL_PAM_CONF
>> +       $(INSTALL) -D -m 644 $(@D)/contrib/sshd.pam.generic $(TARGET_DIR)/etc/pam.d/sshd
>> +       sed -i '/password   required     \/lib\/security\/pam_cracklib.so/d' $(TARGET_DIR)/etc/pam.d/sshd
>> +       sed -i -e 's/\#UsePAM no/UsePAM yes/' $(TARGET_DIR)/etc/ssh/sshd_config
> nit: you could $(SED) here ;-)

Fixed.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
