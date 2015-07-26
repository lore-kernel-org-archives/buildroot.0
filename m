From: Nimai Mahajan <nimaim@gmail.com>
Date: Sun, 26 Jul 2015 18:26:08 -0400
Subject: [Buildroot] [PATCH 1/1] cmocka: new package
In-Reply-To: <20150726215651.GJ17029@tarshish>
References: <1437884269-6134-1-git-send-email-nimaim@gmail.com>
 <20150726215651.GJ17029@tarshish>
Message-ID: <CALoSW64=kMZ65TgM7tscVQWVH+o8BYQ4NTdx2pvDryk_EFBFXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry about that, v2 on the way ...

On Sun, Jul 26, 2015 at 5:56 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Nimai,
>
> On Sun, Jul 26, 2015 at 12:17:49AM -0400, Nimai Mahajan wrote:
>> From: Nimai Mahajan <nimaim@gmail.com>
>>
>> Signed-off-by: Nimai Mahajan <nimaim@gmail.com>
>> ---
>
> [snip]
>
>> diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
>> new file mode 100644
>> index 0000000..740ff64
>> --- /dev/null
>> +++ b/package/cmocka/cmocka.mk
>> @@ -0,0 +1,18 @@
>> +################################################################################
>> +#
>> +# cmocka
>> +#
>> +################################################################################
>> +
>> +CMOCKA_VERSION = 1.0.1
>> +CMOCKA_SOURCE = cmocka-$(CMOCKA_VERSION).tar.xz
>> +CMOCKA_SITE = https://cmocka.org/files/1.0/
>> +CMOCKA_LICENSE = Apache-2.0
>> +CMOCKA_LICENSE_FILES = COPYING
>> +CMOCKA_DEPENDENCIES = host-cmake
>
> The cmake infrastructure automatically adds the host-cmake dependency.
>
>> +CMOCKA_INSTALL_STAGING = YES
>> +
>> +# cmocka only supports out of source builds
>> +CMOCKA_SUPPORTS_IN_SOURCE_BUILD = NO
>> +
>> +$(eval $(cmake-package))
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
