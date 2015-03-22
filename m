From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Sun, 22 Mar 2015 16:19:36 +0100
Subject: [Buildroot] [PATCH 4/4] wine: more hostarch
In-Reply-To: <550DAB91.6080603@mind.be>
References: <550D907F.5000106@dawncrow.de> <550DAB91.6080603@mind.be>
Message-ID: <550EDD88.7010607@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 21.03.2015 um 18:34 schrieb Arnout Vandecappelle:
> On 21/03/15 16:38, Andr? Hentschel wrote:
>> The tools from host-wine build on those architectures.
>>
>> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> 
>  Do you also volunteer to provide an autobuilder on arm and aarch64? :-)

if someone guides me to set one up I?ll do it for ARM on an cubox-i4pro, but i'm not sure about how many packages would support that.
would that be useful?

>> ---
>>  package/wine/Config.in | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/wine/Config.in b/package/wine/Config.in
>> index 26de143..d1510e1 100644
>> --- a/package/wine/Config.in
>> +++ b/package/wine/Config.in
>> @@ -2,7 +2,9 @@ config BR2_PACKAGE_WINE
>>  	bool "wine"
>>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>>  	# Wine only builds on certain architectures
>> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" || \
>> +	           BR2_HOSTARCH = "powerpc" || BR2_HOSTARCH = "arm" || \
> 
>  powerpc but not powerpc64?

yes, powerpc64 is not supported yet

>  Regards,
>  Arnout
> 
>> +	           BR2_HOSTARCH = "aarch64"
>>  	# Wine has much CPU specific code and mostly makes sense on x86
>>  	depends on BR2_i386
>>  	help
>>
> 
> 
