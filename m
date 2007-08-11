From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 11 Aug 2007 21:07:39 +0300
Subject: [Buildroot] PATCH: correct expat DESTDIR ,
 was ( expat is not correctly installed)
In-Reply-To: <1186854238.4742.1.camel@elrond.sweden.atmel.com>
References: <46BB94BC.5070904@promwad.com> <46BDC2BA.4020001@promwad.com>
	<1186854238.4742.1.camel@elrond.sweden.atmel.com>
Message-ID: <46BDFAEB.3070401@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson ?????:
> l?r 2007-08-11 klockan 17:07 +0300 skrev Ivan Kuten:
>> Correct expat DESTDIR, otherwise it installed in staging_dir/usr/usr/include:
>>
>>
>> Index: package/expat/expat.mk
>> ===================================================================
>> --- package/expat/expat.mk      (revision 19426)
>> +++ package/expat/expat.mk      (working copy)
>> @@ -53,7 +53,7 @@
>>          touch -c $@
>>
>>   $(STAGING_DIR)/$(EXPAT_TARGET_BINARY): $(EXPAT_DIR)/$(EXPAT_BINARY)
>> -       $(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(EXPAT_DIR) install
>> +       $(MAKE) DESTDIR=$(STAGING_DIR) -C $(EXPAT_DIR) install
>>          $(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
>>                  $(STAGING_DIR)/usr/lib/libexpat.la
>>          touch -c $@
>>
>>
>> Best regards,
>> Ivan
> 
> Your patches fail miserably, since your email client replaces tabs with
> spaces. This means that patches have to be applied manually :-(
> 
> Best Regards
> Ulf Samuelsson
> 
> 

Hm, strange, i'm using thunderbird-2.0 with plain text messaging.
Anyway here is the same patch in the attachment.

BR,
Ivan




-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: expat_DESTDIR.patch
Url: http://busybox.net/lists/buildroot/attachments/20070811/dda2350d/attachment.diff 
