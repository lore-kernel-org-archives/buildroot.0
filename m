From: Pascal Huerst <pascal.huerst@gmail.com>
Date: Wed, 09 Jul 2014 11:39:17 +0200
Subject: [Buildroot] [PATCH V5 2/2] google-breakpad: integration into
 Makefile and Config.in
In-Reply-To: <20140629123618.407b95f5@free-electrons.com>
References: <1403702174-23850-1-git-send-email-pascal.huerst@gmail.com>	<1403702174-23850-3-git-send-email-pascal.huerst@gmail.com>	<53AB3198.9010908@mind.be>
 <20140629123618.407b95f5@free-electrons.com>
Message-ID: <53BD0DC5.50501@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas, Arnout, all

-- snip --

> However, I don't really like the prompt. Maybe it should be:
> 
> 	[ ] Enable Google Breakpad support
> 	   () List of binaries to extract symbols from
> 
>>> +ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD),y)
>>> +	$(EXTRA_ENV) package/google-breakpad/gen-syms.sh $(STAGING_DIR) \
>>> +		$(TARGET_DIR) $(call qstrip,$(BR2_GOOGLE_BREAKPAD_INCLUDE_FILES))
>>
>>  To be more compatible with Fabio's series that reworks this part of the
>> infrastructure, it's better to define this as a new variable which is called
>> here. That will make it easier to resolve the conflict between these two series.
>> Fabio's series will also make it possible to define this completely inside the
>> google-breakpad.mk.

Can you give me a hint, on how this should be done then?

> Yes, having it all in the google-breakpad.mk seems like a good idea.
> 
> Thomas
> 

Pascal
