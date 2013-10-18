From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 18 Oct 2013 08:43:42 +0200
Subject: [Buildroot] [PATCH] tslib: needs shared library for dlopen
In-Reply-To: <20131017171518.28ec97bf@skate>
References: <ed7d27afb27011d62944.1382021888@argentina>
 <20131017171518.28ec97bf@skate>
Message-ID: <CAAXf6LV18Y26WEa+_Z4oMCk0c1xqByvzYr0FPqqNhmYaSsuyRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Oct 17, 2013 at 5:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 17 Oct 2013 16:58:08 +0200, Thomas De Schampheleire wrote:
>
>> diff --git a/package/tslib/Config.in b/package/tslib/Config.in
>> --- a/package/tslib/Config.in
>> +++ b/package/tslib/Config.in
>> @@ -1,6 +1,10 @@
>>  config BR2_PACKAGE_TSLIB
>>       bool "tslib"
>> +     depends on !BR2_PREFER_STATIC_LIB # dlopen
>
> I believe this needs to be propagated to the BR2_PACKAGE_DIRECTFB_TSLIB
> option, which selects BR2_PACKAGE_TSLIB, but does not depends
> on !BR2_PREFER_STATIC_LIB.

Clearly I'm not used to this type of changes :)
Thanks for noticing, I'm sending an update...

Best regards,
Thomas
