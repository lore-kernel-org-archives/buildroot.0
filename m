From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 11 Jan 2018 13:45:09 +0100
Subject: [Buildroot] [PATCH] package/bash-completion: new package
In-Reply-To: <20180111113405.75bmtmbatomzwxne@tarshish>
References: <1515669446-25694-1-git-send-email-romain.naour@smile.fr>
 <20180111113405.75bmtmbatomzwxne@tarshish>
Message-ID: <ad003c28-ec10-a68f-e763-25d69616ecac@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 11/01/2018 ? 12:34, Baruch Siach a ?crit?:
> Hi Romain,
> 
> On Thu, Jan 11, 2018 at 12:17:26PM +0100, Romain Naour wrote:
>> From: Jeremy Rosen <jeremy.rosen@smile.fr>
>>
>> Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
>> ---
> 
> [...]
> 
>> +################################################################################
>> +#
>> +# bash-completion
>> +#
>> +################################################################################
>> +
>> +BASH_COMPLETION_VERSION = 2.7
>> +BASH_COMPLETION_SITE = https://github.com/scop/bash-completion/releases/download/$(BASH_COMPLETION_VERSION)
>> +BASH_COMPLETION_SOURCE = bash-completion-$(BASH_COMPLETION_VERSION).tar.xz
>> +BASH_COMPLETION_LICENSE = GPL-2.0+
>> +BASH_COMPLETION_LICENSE_FILES = COPYING
>> +
>> +define BASH_COMPLETION_INSTALL_TARGET_CMDS
>> +	echo ". /usr/share/bash-completion/bash_completion" > $(TARGET_DIR)/etc/bash_completion
>> +endef
> 
> How do you install the completion scripts?

You're right, I wanted to use BASH_COMPLETION_INSTALL_TARGET_HOOKS here and let
the autotools infra install the completion scripts...

I'll resend a v2.

Also, I added BASH_COMPLETION_INSTALL_STAGING = YES since bash-completion
provide a .pc file.

Thanks for your review.

Best regards,
Romain

> 
> baruch
> 
