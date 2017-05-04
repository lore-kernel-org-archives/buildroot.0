From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 4 May 2017 23:34:52 +0200
Subject: [Buildroot] [PATCH v3 1/2] cracklib: New package
In-Reply-To: <1493881807.2302.3.camel@spectralink.com>
References: <20170419075602.22245-1-stefan.sorensen@spectralink.com>
 <f24453b3-9fc6-1a1e-4e01-071da345bbdb@gmail.com>
 <1493881807.2302.3.camel@spectralink.com>
Message-ID: <32863807-7cf4-75fc-1dd3-0e6f6517986e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan, all,

Le 04/05/2017 ? 09:10, S?rensen, Stefan a ?crit :
> On Sun, 2017-04-30 at 15:36 +0200, Romain Naour wrote:
> 
>> +ifeq ($(BR2_PACKAGE_CRACKLIB_TOOLS),)
>>> +define CRACKLIB_REMOVE_TOOLS
>>> +	rm -f $(TARGET_DIR)/usr/sbin/*cracklib*
>>
>> Maybe this part can be done in a post install script instead ?
> 
> Post install script? I can't find any reference to what that is.

Sorry, I meant post build scripts, see BR2_ROOTFS_POST_BUILD_SCRIPT option.

> 
>>> +	rm $(TARGET_DIR)/usr/share/cracklib/cracklib-small
>>
>> Why do you remove cracklib-small binary ?
> 
> This is not a binary, but rather the source for the small dictionary.
> It is not needed on the target.

Ok, thanks for the explanation.

Best regards,
Romain

> 
> 
> Stefan
> 
