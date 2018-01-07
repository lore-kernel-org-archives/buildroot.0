From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 7 Jan 2018 23:39:16 +0100
Subject: [Buildroot] [PATCH] package/enlightenment: bump to 0.22.1
In-Reply-To: <20180106151425.7e15f86f@windsurf>
References: <20180105163223.10142-1-romain.naour@gmail.com>
 <20180106151425.7e15f86f@windsurf>
Message-ID: <316b059e-cb1c-86cb-49cc-e31941d1214e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 06/01/2018 ? 15:14, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Fri,  5 Jan 2018 17:32:23 +0100, Romain Naour wrote:
> 
>> -ENLIGHTENMENT_CONF_OPTS = \
>> -	--with-edje-cc=$(HOST_DIR)/bin/edje_cc \
>> -	--with-eet-eet=$(HOST_DIR)/bin/eet \
>> -	--with-eldbus_codegen=$(HOST_DIR)/bin/eldbus-codegen \
>> -	--disable-pam \
>> -	--disable-rpath
>> +ENLIGHTENMENT_MESON_OPTS += \
>> +	--prefix=/usr \
>> +	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
>> +	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf \
> 
> So sometimes the options are defined using =, sometimes not ? Is this
> expected ?

It's a copy past mistake.
Using --buildtype= and --cross-file= works perfectly fine.

Note that changing the build system can lead to new build failure.
I tested the meson build system as best as I could.

Best regards,
Romain
> 
> Thanks,
> 
> Thomas
> 
