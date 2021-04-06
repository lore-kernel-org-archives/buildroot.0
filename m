From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Tue, 6 Apr 2021 12:32:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/bash: remove development files
 and modules on the target.
In-Reply-To: <20210405114517.54157434@windsurf.home>
References: <20210331081559.29619-1-nicolas.cavallari@green-communications.fr>
 <20210405114517.54157434@windsurf.home>
Message-ID: <4bdb7b94-784b-3231-907f-e13652400870@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 05/04/2021 11:45, Thomas Petazzoni wrote:
> On Wed, 31 Mar 2021 10:15:59 +0200
> Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:
>> --- a/package/bash/bash.mk
>> +++ b/package/bash/bash.mk
>> @@ -41,7 +41,8 @@ endif
>>   define BASH_INSTALL_TARGET_CMDS
>>   	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>>   		DESTDIR=$(TARGET_DIR) exec_prefix=/ install
>> -	rm -f $(TARGET_DIR)/bin/bashbug
>> +	rm -f $(TARGET_DIR)/bin/bashbug $(TARGET_DIR)/lib/pkgconfig/bash.pc
> 
> I am wondering if target-finalize shouldn't take care of removing
> /lib/pkgconfig just like it removes /usr/lib/pkgconfig. This would have
> the benefit of also dropping the /lib/pkgconfig folder, which your
> change doesn't do.
> 
> What do you think?

This would work too, but do we want to add things to target-finalize 
just for (apparently) only one little package ?
