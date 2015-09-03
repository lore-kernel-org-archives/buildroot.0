From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 Sep 2015 22:39:45 +0200
Subject: [Buildroot] [PATCH v3 3/4] package/beecrypt: add host variant
In-Reply-To: <20150903163203.GE3607@free.fr>
References: <1441293831-3524-1-git-send-email-james.knight@rockwellcollins.com>
 <1441293831-3524-3-git-send-email-james.knight@rockwellcollins.com>
 <20150903163203.GE3607@free.fr>
Message-ID: <55E8B011.2060008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-09-15 18:32, Yann E. MORIN wrote:
> James, All,
> 
> On 2015-09-03 11:23 -0400, James Knight spake thusly:
[snip]
>> -BEECRYPT_CONF_OPTS = \
>> +BEECRYPT_CONFIGURE_ARGS = \
>>  	--disable-expert-mode \
>> +	--disable-openmp \
>>  	--without-java \
>> -	--without-python \
>> -	--disable-openmp
>> +	--without-python
>> +
>> +BEECRYPT_CONF_OPTS += \
>> +	$(BEECRYPT_CONFIGURE_ARGS)
>> +
>> +HOST_BEECRYPT_CONF_OPTS += \
>> +	$(BEECRYPT_CONFIGURE_ARGS) \
>> +	--without-cplusplus
> 
> Well, I forgot to say: you do not need an intermediate variable:
> 
>     BEECRYPT_CONF_OPTS = \
>         --disable-expert-mode \
>         --without-java \
>         --without-python \
>         --disable-openmp
> 
>     HOST_BEECRYPT_CONF_OPTS = \
>         $(BEECRYPT_CONF_OPTS) \
>         --without-cplusplus

 Actually, I'd prefer to copy the config options, since in the future they may
change independently for the host and the target.

 Same for rpm, obviously.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
