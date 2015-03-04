From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 04 Mar 2015 12:18:11 -0300
Subject: [Buildroot] [PATCH v2 7/8] arch: add support for AMD steamroller
In-Reply-To: <20150304155953.7c43ee6c@free-electrons.com>
References: <1425397951-30603-1-git-send-email-gustavo@zacarias.com.ar>	<1425397951-30603-7-git-send-email-gustavo@zacarias.com.ar>
 <20150304155953.7c43ee6c@free-electrons.com>
Message-ID: <54F72233.5040904@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/04/2015 11:59 AM, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
> 
> On Tue,  3 Mar 2015 12:52:30 -0300, Gustavo Zacarias wrote:
> 
>> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
>> index 4321e43..e70c3ce 100644
>> --- a/toolchain/toolchain-external/Config.in
>> +++ b/toolchain/toolchain-external/Config.in
>> @@ -676,6 +676,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
>>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>>  	depends on !BR2_STATIC_LIBS
>>  	depends on !BR2_x86_jaguar
>> +	depends on !BR2_x86_steamroller
> 
> Why do we need this new dependency? Same question for x86_jaguar in
> fact. Are those toolchains not working at all, or are they just not
> "optimal" ?

Because older GCCs won't understand bdver3/btver2 and break.
Regards.
