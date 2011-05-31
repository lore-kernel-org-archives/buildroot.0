From: Heiko Zuerker <heiko@zuerker.org>
Date: Tue, 31 May 2011 07:47:15 -0500
Subject: [Buildroot] [PATCH 1/2] Add package acl
In-Reply-To: <BANLkTikqvZ9iJTvg7QC7WDOUKX+F9KyK0g@mail.gmail.com>
References: <1306779390-19947-1-git-send-email-zonque@gmail.com>
	<1306779390-19947-2-git-send-email-zonque@gmail.com>
	<20110530210244.5bd309aa@surf>
	<BANLkTikqvZ9iJTvg7QC7WDOUKX+F9KyK0g@mail.gmail.com>
Message-ID: <20110531074715.Horde.sKpzOGms4ABN5ONTHDNzy_A@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Quoting Daniel Mack <zonque@gmail.com>:

> On Mon, May 30, 2011 at 9:02 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> On Mon, 30 May 2011 20:16:29 +0200
>> Daniel Mack <zonque@gmail.com> wrote:
>>
>>> +define ACL_INSTALL_TARGET_CMDS
>>> + ? ? $(INSTALL) -m 0755 -D $(@D)/getfacl/.libs/getfacl  
>>> $(TARGET_DIR)/usr/bin/
>>> + ? ? $(INSTALL) -m 0755 -D $(@D)/setfacl/.libs/setfacl  
>>> $(TARGET_DIR)/usr/bin/
>>> + ? ? $(INSTALL) -m 0644 -D $(@D)/libacl/.libs/libacl.so*  
>>> $(STAGING_DIR)/usr/lib/
>>> +endef
>>> +
>>> +define ACL_INSTALL_STAGING_CMDS
>>> + ? ? test -d $(STAGING_DIR)/usr/include/acl/ || mkdir  
>>> $(STAGING_DIR)/usr/include/acl/
>>> + ? ? $(INSTALL) -m 0644 -D $(@D)/include/*.h  
>>> $(STAGING_DIR)/usr/include/acl/
>>> + ? ? $(SED) s,sys/acl.h,acl/acl.h, -i  
>>> $(STAGING_DIR)/usr/include/acl/libacl.h
>>> +endef
>>
>> Any reason to not use the default "make install" behaviour of the
>> package ? (And ditto for the attr package).
>
> The libtool crap failed for cross compilation in these cases, so these
> workarounds are unfortunately necessary.

Actually this isn't necessary, please see my version of the patches.

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org
