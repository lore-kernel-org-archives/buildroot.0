From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Tue, 8 Dec 2015 22:36:52 +0100
Subject: [Buildroot] [PATCH v2 2/2] ustr: use Debian patches to compile
 w/ GCC 5.x
In-Reply-To: <20151208204712.GU4188@free.fr>
References: <1448070305-10768-1-git-send-email-ryanbarnett3@gmail.com>
 <1448070305-10768-2-git-send-email-ryanbarnett3@gmail.com>
 <20151208204712.GU4188@free.fr>
Message-ID: <CALq67GCACfzDuaEL4wVrqTp2Futp3+eUZQ9s3Rwrq6DbxxC49g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Tue, Dec 8, 2015 at 9:47 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

[...]

>> diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
>> index 3144c0b..83e69e6 100644
>> --- a/package/ustr/ustr.mk
>> +++ b/package/ustr/ustr.mk
>> @@ -9,46 +9,11 @@ USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
>>  USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)
>>  USTR_LICENSE = BSD-2c MIT LGPLv2+
>>  USTR_LICENSE_FILES = LICENSE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
>> +USTR_AUTORECONF = YES
>> +USTR_PATCH = \
>> +     http://http.debian.net/debian/pool/main/u/ustr/ustr_$(USTR_VERSION)-5.debian.tar.xz
>>
>>  USTR_INSTALL_STAGING = YES
>
> I've tested adding:
>
>     USTR_MAKE_OPTS = all all-shared
>
> and now everything is built at build time, and nothing at install time.
>
> Care to include it and respin, please?

Thanks for taking a look! However, I don't think I will have time in
the next month or so in order to respin these patches. If you are able
to you, you are more than welcome to take these patches over and keep
all the credit for yourself.

Thanks,
-Ryan
