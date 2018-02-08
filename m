From: Julien Boibessot <julien.boibessot@free.fr>
Date: Thu, 8 Feb 2018 11:28:28 +0100
Subject: [Buildroot] [PATCH] package/openssh: also install ssh-copy-id
 script
In-Reply-To: <20180207185456.GB2250@scaer>
References: <1518028559-22988-1-git-send-email-julien.boibessot@free.fr>
 <20180207185456.GB2250@scaer>
Message-ID: <a0599020-62f5-6176-b7ae-7beac2125c23@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

thanks for reviewing,

On 07/02/2018 19:54, Yann E. MORIN wrote:
> Julien, All,
>
> On 2018-02-07 19:35 +0100, julien.boibessot at free.fr spake thusly:
>> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
>>
>> This script is useful to copy SSH keys between client and server [1] and
>> installed on most distributions (for example on debian: [2]).
>>
>> [1] https://www.ssh.com/ssh/copy-id
>> [2] https://packages.debian.org/fr/jessie/armhf/openssh-client/filelist
>>
>> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
>>
>> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
>> index 6b7ac22..b0075e9 100644
>> --- a/package/openssh/openssh.mk
>> +++ b/package/openssh/openssh.mk
>> @@ -73,4 +73,10 @@ define OPENSSH_INSTALL_INIT_SYSV
>>  		$(TARGET_DIR)/etc/init.d/S50sshd
>>  endef
>>  
>> +define OPENSSH_INSTALL_SSH_COPY_ID
>> +	$(INSTALL) -D -m 755 $(@D)/contrib/ssh-copy-id $(TARGET_DIR)/usr/bin
> Usually, we write the full mode, i.e. 0755 (but the tree is mixed: 371
> iterations of '0755', but only 116 for '0755').

Well, in fact, I just copy-pasted what was done line 44 of the same
makefile.
O:-)

Regards,
Julien
