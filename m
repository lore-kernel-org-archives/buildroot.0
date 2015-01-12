From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 12 Jan 2015 10:04:03 +0100
Subject: [Buildroot] [PATCH v5 06/16] erlang-p1-zlib: new package.
In-Reply-To: <20150110164540.4bd7cbaa@free-electrons.com>
References: <1420552994-657-1-git-send-email-johan.oudinet@gmail.com>
 <1420552994-657-7-git-send-email-johan.oudinet@gmail.com>
 <20150110164540.4bd7cbaa@free-electrons.com>
Message-ID: <CAJtjsKaeaJkqRDmtBD4YVSB8oSw4bawcrV-wCVaSLOsg7xyO5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sat, Jan 10, 2015 at 4:45 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Tue,  6 Jan 2015 15:03:04 +0100, Johan Oudinet wrote:
>> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
>> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
>> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
>
> That many SoB lines? :-)

I'll remove them by hand and keep only one of each.

>
>> diff --git a/package/erlang-p1-zlib/Config.in b/package/erlang-p1-zlib/Config.in
>> new file mode 100644
>> index 0000000..583d856
>> --- /dev/null
>> +++ b/package/erlang-p1-zlib/Config.in
>> @@ -0,0 +1,6 @@
>> +config BR2_PACKAGE_ERLANG_P1_ZLIB
>> +     bool "erlang-p1-zlib"
>
> Are you sure you shouldn't select BR2_PACKAGE_ZLIB here.
>
>> +ERLANG_P1_ZLIB_VERSION = 52e82bb
>> +ERLANG_P1_ZLIB_SITE = $(call github,processone,zlib,$(ERLANG_P1_ZLIB_VERSION))
>> +ERLANG_P1_ZLIB_LICENSE = GPLv2+
>> +ERLANG_P1_ZLIB_LICENSE_FILES = COPYING
>
> and depend on zlib here?

Indeed, there is an AC_CHECK_HEADER(zlib.h) in the configure.ac.
I'll add the dependency to zlib.
Thanks.

-- 
Johan
