From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 25 Apr 2015 15:53:37 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/swupdate: new package
In-Reply-To: <20150425102232.GB4275@free.fr>
References: <1429916563-20332-1-git-send-email-joerg.krause@embedded.rocks>
 <20150425102232.GB4275@free.fr>
Message-ID: <553B9C61.9040705@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg, Yann, all

Le 25/04/2015 12:22, Yann E. MORIN a ?crit :
> J?rg, All,
> 
> On 2015-04-25 01:02 +0200, J?rg Krause spake thusly:
>> This patch is based on an WIP version submitted by Romain Naour, commented by
>> Arnout Vandecappelle:
>> https://patchwork.ozlabs.org/patch/401270/
>>
>> We use the latest commit of swupdate instead of the last release 2014.07 to
>> obtain several bug fixes and get support for the image downloading feature.
>>
>> The package build file does not detect which dependencies are available. So we
>> provide a default configuration which selects the external dependencies by
>> default except for lua. Lua support can be added by the user by customizing
>> the configuration file (swupdate.config) add select the Lua 5.2 interpreter
>> manually.
>>
>> Furthermore the U-Boot handler is not enabled by default, as it may cause
>> runtime issues if the U-Boot environment configuration file (fw_env.config) is
>> not present on the target system.
>>
>> The package provides a default website which can be installed to the target to
>> enable firmware update with a browser.
>>
>> Note, swupdate does not implement a savedefconfig and nconfig target.
>> Note, swupdate provides its own customized versions of mongoose and lsqlite3.
>>
>> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
>> Cc: Romain Naour <romain.naour@openwide.fr>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: Arnout Vandecappelle <arnout@mind.be>
>> Tested-by: Mike Williams <mike@mikebwilliams.com>
>> ---

[snip]

> 
>> +SWUPDATE_LICENSE_FILES = COPYING
>> +
>> +# swupdate bundles its own mongoose and lsqlite3 versions
> 
> Is it possible to make it use external versions, or does it only support
> using its bundled ones?

I tried to add mongoose dependency at first but it seems it use an embedded copy
of mongoose and lsqlite3 when CONFIG_MONGOOSE and CONFIG_MONGOOSESQL are set in
the config file.

See the last Arnout's comment (https://patchwork.ozlabs.org/patch/401270):
"Doesn't swupdate use an embedded mongoose? I.e., doesn't it link with it?"

Best regards,
Romain
> 
> If that's possible, we prefer that.
> 
> Regards,
> Yann E. MORIN.
> 
