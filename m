From: Stefan Agner <stefan@agner.ch>
Date: Thu, 25 Mar 2021 15:40:36 +0100
Subject: [Buildroot] [PATCH] package/libbytesize: remove pcre2 runtime
 dependency
In-Reply-To: <8735wjl3d5.fsf@tarshish>
References: <226176cabe249af62546689fbb39de8a7010c329.1616681740.git.stefan@agner.ch>
 <8735wjl3d5.fsf@tarshish>
Message-ID: <c1c09133e8e3d70f0458fd0da622062f@agner.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-03-25 15:22, Baruch Siach wrote:
> Hi Stefan,
> 
> On Thu, Mar 25 2021, Stefan Agner wrote:
>> The library is only required at build time, which is handled by the
>> select in Config.in.
> 
> The _DEPENDENCIES list is meant to make sure that pcre2 builds before
> libbytesize. Config.in select does not guarantee the build order.
> Config.in select only makes pcre2 build.
> 
> So if pcre2 is required at build time we need it in the _DEPENDENCIES
> list.
> 
> Am I missing something?

Hmm, I think I don't understand how runtime/compile time dependencies
work in buildroot.

I read this section:
https://buildroot.org/downloads/manual/manual.html#_gettext_integration_and_interaction_with_packages

But I think i got this wrong, gettext in that case is only a runtime
dependency.

Is there a way to have something as compile time dependency but not a
runtime dependency?

--
Stefan

> 
> baruch
> 
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>>  package/libbytesize/libbytesize.mk | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/package/libbytesize/libbytesize.mk b/package/libbytesize/libbytesize.mk
>> index 0ba380dc74..df54ae84b7 100644
>> --- a/package/libbytesize/libbytesize.mk
>> +++ b/package/libbytesize/libbytesize.mk
>> @@ -14,8 +14,7 @@ LIBBYTESIZE_DEPENDENCIES = \
>>  	host-pkgconf \
>>  	host-gettext \
>>  	gmp \
>> -	mpfr \
>> -	pcre2
>> +	mpfr
>>
>>  LIBBYTESIZE_CONF_OPTS += \
>>  	--without-python3 \
