From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 25 Jul 2017 09:26:51 -0700
Subject: [Buildroot] [PATCH v3] zstd: add new package
In-Reply-To: <20170725084853.55xc6n3bro72qt5y@tarshish>
References: <20170725000700.19035-1-andrew.smirnov@gmail.com>
 <20170725084853.55xc6n3bro72qt5y@tarshish>
Message-ID: <CAHQ1cqGg+sNTDs4URksfz4yNe1Mc5VwSEirPVkin-bOAkj6--Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 25, 2017 at 1:48 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Andrey,
>
> On Mon, Jul 24, 2017 at 05:07:00PM -0700, Andrey Smirnov wrote:
>
> [...]
>
>> diff --git a/package/zstd/Config.in b/package/zstd/Config.in
>> new file mode 100644
>> index 0000000000..0e97c64e0a
>> --- /dev/null
>> +++ b/package/zstd/Config.in
>> @@ -0,0 +1,13 @@
>> +menuconfig BR2_PACKAGE_ZSTD
>> +     bool "zstd"
>> +     help
>> +       Zstandard, or zstd as short version, is a fast lossless
>> +       compression algorithm, targeting real-time compression
>> +       scenarios at zlib-level and better compression ratios
>> +
>> +       For more info see https://facebook.github.io/zstd
>
> The homepage link should come below ...
>

OK, will fix in v4.

>> +
>> +       The selection of other packages will enable some features:
>> +
>> +       - xz, lz4 and/or zlib will enable support for corresponding
>> +         compression formats
>> \ No newline at end of file
>
> ... here. It should be in a separate like that contains only the URL.
>
>> diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
>> new file mode 100644
>> index 0000000000..d09e6b46f4
>> --- /dev/null
>> +++ b/package/zstd/zstd.hash
>> @@ -0,0 +1,3 @@
>> +# Locally computed
>> +sha256 0fdba643b438b7cbce700dcc0e7b3e3da6d829088c63757a5984930e2f70b348 zstd-v1.3.0.tar.gz
>
> Please add hashes for the license files.
>

OK. Will add in v4.

>> +
>> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
>> new file mode 100644
>> index 0000000000..ad26bae6fd
>> --- /dev/null
>> +++ b/package/zstd/zstd.mk
>> @@ -0,0 +1,49 @@
>> +################################################################################
>> +#
>> +# zstd
>> +#
>> +################################################################################
>> +
>> +ZSTD_VERSION = v1.3.0
>> +ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
>> +ZSTD_LICENSE = BSD-3-Clause
>
> Maybe also mention the Facebook patents grant? I'm not sure about that because
> it is not strictly a code license, AFAIK, but it is related to "legal info".
>

I am more than happy to add that, but I am not sure what it should
look like. If we decide we should do that, please give me an example
of what's expected.

Thanks,
Andrey Smirnov
