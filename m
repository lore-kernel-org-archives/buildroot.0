From: Gergely Imreh <imrehg@gmail.com>
Date: Mon, 18 May 2015 13:59:15 +0800
Subject: [Buildroot] [PATCH 1/1] wvstreams: not available for static
	only builds
In-Reply-To: <20150518055256.GI2845@tarshish>
References: <1431928065-20878-1-git-send-email-imrehg@gmail.com>
 <20150518055256.GI2845@tarshish>
Message-ID: <CAJ3iQcrJAgBU9SHKNKSi2SWp+=_Gan6QjkPo2k3R-BK_wviRoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18 May 2015 at 13:52, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Gergely,
>
> On Mon, May 18, 2015 at 05:47:55AM +0000, Gergely Imreh wrote:
>> diff --git a/package/wvstreams/Config.in b/package/wvstreams/Config.in
>> index 3080dc7..0cbe60a 100644
>> --- a/package/wvstreams/Config.in
>> +++ b/package/wvstreams/Config.in
>> @@ -1,6 +1,7 @@
>>  config BR2_PACKAGE_WVSTREAMS
>>       bool "wvstreams"
>>       depends on BR2_INSTALL_LIBSTDCPP
>> +     depends on !BR2_STATIC_LIBS
>
> You need to propagate this to packages selecting BR2_PACKAGE_WVSTREAMS. In
> this case only wvdial seems to be affected.

Ah, got it. Will send a new version.
Cheers,
   Gergely


>
> baruch
>
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
