From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 14 May 2010 15:19:22 +0200
Subject: [Buildroot] libcurl patch for package/libcurl.mk
In-Reply-To: <4BED4C0B.7090803@unix-beratung.de>
References: <4BED4404.8070706@unix-beratung.de>
	<AANLkTilRnpX5yxaRZmVTRa4SCiPrsYiFIGftOahiSJGf@mail.gmail.com>
	<4BED4C0B.7090803@unix-beratung.de>
Message-ID: <AANLkTinKnAh2KZLDa8ONvKjpYJbMVUv_6Ivco5R0Fx-o@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What was your problem ? Does the compilation failed ? Any log of the failure ?

I think we should find why the configure script fails to define
HAVE_BOOL_T, and try to fix the autodetect problem.

On Fri, May 14, 2010 at 3:11 PM, Robert Urban <urban@unix-beratung.de> wrote:
> Hi Lionel,
>
>
> On 05/14/2010 03:06 PM, Lionel Landwerlin wrote:
>> Does this patch actually fix something?
>
> it definately fixed it for me.
>
>> If it's just a matter of using something available in gcc, I would
>> rather prefer to let the configure script use its autodetect
>> feature....
>
> configure was getting something wrong. ?It wasn't defining HAVE_BOOL_T, but I
> don't know why.
>
> cheers,
>
> Rob Urban
>
>>
>> On Fri, May 14, 2010 at 2:37 PM, Robert Urban <urban@unix-beratung.de> wrote:
>>> apparently the boolean workaround (typedef unsigned char _Bool) gets in the way
>>> of a native (gcc?) boolean datatype. ?Below is a patch for libcurl.mk.
>>>
>>> My buildroot version is
>>>
>>> ? ? ? ?BR2_VERSION="2010.05-rc2"
>>>
>>> my host platform is Fedora-11, x86_64.
>>>
>>> cheers,
>>>
>>> Rob Urban
>>>
>>> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
>>> index 863c301..f9e7b08 100644
>>> --- a/package/libcurl/libcurl.mk
>>> +++ b/package/libcurl/libcurl.mk
>>> @@ -12,6 +12,7 @@ LIBCURL_CONF_OPT = --disable-verbose --disable-manual
>>> --enable-hidden-symbols
>>> ?ifeq ($(BR2_PACKAGE_OPENSSL),y)
>>> ?LIBCURL_DEPENDENCIES += openssl
>>> ?LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
>>> +LIBCURL_CONF_ENV += ac_cv_type_bool=yes
>>> ?# configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
>>> ?# native stuff during the rest of configure when target == host.
>>> ?# Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>
>>
>
>
