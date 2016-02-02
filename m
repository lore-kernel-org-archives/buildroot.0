From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Tue, 2 Feb 2016 18:36:33 -0300
Subject: [Buildroot] [PATCH] package: aespipe: add host variant
In-Reply-To: <56AFA6D4.3060109@mind.be>
References: <1454341047-14412-1-git-send-email-ariel@vanguardiasur.com.ar>
 <56AFA6D4.3060109@mind.be>
Message-ID: <56B12161.3090501@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

El 01/02/16 a las 15:41, Arnout Vandecappelle escribi?:
> On 01-02-16 16:37, Ariel D'Alessandro wrote:
>> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> 
>  Your commit message should explain why this is needed. Something like:
> 
> Post-image scripts may want to encrypt the resulting image with aespipe
> (and decrypt it in the update tool on the target), so it is useful to have
> the host version and to be able to select it in the configuration.

Yeah, I think that explanation is pretty good. I'll add it.

> 
>> ---
>>  package/Config.in.host         |  1 +
>>  package/aespipe/Config.in.host | 10 ++++++++++
>>  package/aespipe/aespipe.mk     |  1 +
>>  3 files changed, 12 insertions(+)
>>  create mode 100644 package/aespipe/Config.in.host
>>
>> diff --git a/package/Config.in.host b/package/Config.in.host
>> index 8e6b870..1c691a3 100644
>> --- a/package/Config.in.host
>> +++ b/package/Config.in.host
>> @@ -1,5 +1,6 @@
>>  menu "Host utilities"
>>  
>> +	source "package/aespipe/Config.in.host"
>>  	source "package/checkpolicy/Config.in.host"
>>  	source "package/cramfs/Config.in.host"
>>  	source "package/dfu-util/Config.in.host"
>> diff --git a/package/aespipe/Config.in.host b/package/aespipe/Config.in.host
>> new file mode 100644
>> index 0000000..29f6232
>> --- /dev/null
>> +++ b/package/aespipe/Config.in.host
>> @@ -0,0 +1,10 @@
>> +config BR2_PACKAGE_HOST_AESPIPE
>> +	bool "host aespipe"
>> +	depends on BR2_USE_MMU # fork()
> 
>  This shouldn't be there. If the target doesn't have a MMU, you can still build
> it for the host.
> 
>  Otherwise looks good to me.

Oops, you're right, don't know why I missed that :(

Thanks!

-- 
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
