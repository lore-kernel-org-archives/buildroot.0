From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 10 Mar 2008 12:40:23 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <20080307235548.GB6144@cloud.net.au>
References: <20080307165445.F0789120159@busybox.net>
	<20080307235548.GB6144@cloud.net.au>
Message-ID: <47D51017.5020905@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hamish Moffatt wrote:
> On Fri, Mar 07, 2008 at 08:54:45AM -0800, ninevoltz at uclibc.org wrote:
>> Author: ninevoltz
>> Date: 2008-03-07 08:54:45 -0800 (Fri, 07 Mar 2008)
>> New Revision: 21275
>>
>> Log:
>> remove .a files from lib directories after install
>>
>> Modified:
>>    trunk/buildroot/package/Makefile.autotools.in
>>
>>
>> Changeset:
>> Modified: trunk/buildroot/package/Makefile.autotools.in
>> ===================================================================
>> --- trunk/buildroot/package/Makefile.autotools.in	2008-03-07 14:12:14 UTC (rev 21274)
>> +++ trunk/buildroot/package/Makefile.autotools.in	2008-03-07 16:54:45 UTC (rev 21275)
>> @@ -231,6 +231,9 @@
>>  		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
>>  	done)
>>  	find $(TARGET_DIR) -name '*.la' -delete
>> +	find $(TARGET_DIR)/lib -name '*.a' -delete
>> +	find $(TARGET_DIR)/usr/lib -name '*.a' -delete
>> +
>>  	touch $@
> 
> Whoa, I wouldn't assume that all static libraries are unwanted.
> Individual packages should be adjusted not to install them instead.
> 
> Hamish

More over there is an Nios2 arch in buildroot where only static linking exists AFAIK.

BR,
Ivan
