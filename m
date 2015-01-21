From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 22 Jan 2015 00:17:22 +0100
Subject: [Buildroot] [RFC v2] python-lxml: add target package variant
In-Reply-To: <20150121230947.GL4375@free.fr>
References: <1421871981-3146-1-git-send-email-yegorslists@googlemail.com>
 <20150121230947.GL4375@free.fr>
Message-ID: <CAGm1_kv3kL8m9R_5FZedhpYEP4kKEqcz2o5nA1NwuRq5APdn5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 22, 2015 at 12:09 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Yegor, All,
>
> On 2015-01-21 21:26 +0100, Yegor Yefremov spake thusly:
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> [--SNIP--]
>> diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
>> index 758ce87..a7f072f 100644
>> --- a/package/python-lxml/python-lxml.mk
>> +++ b/package/python-lxml/python-lxml.mk
>> @@ -20,6 +20,13 @@ PYTHON_LXML_LICENSE_FILES = \
>>  # So, we use setuptools.
>>  PYTHON_LXML_SETUP_TYPE = setuptools
>>
>> -PYTHON_LXML_DEPENDENCIES = libxml2 libxslt
>> +PYTHON_LXML_DEPENDENCIES = libxml2 libxslt zlib
>
> OK, I did not need zlib for the host variant, so we'll have to
> differentiate the host dependencies and the target ones. I'll do
> that.
>
>> +# python-lxml needs these scripts in order to properly detect libxml2 and
>> +# libxslt compiler and linker flags
>> +PYTHON_LXML_BUILD_OPTS = \
>> +     --with-xslt-config=$(HOST_DIR)/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/xslt-config \
>> +     --with-xml2-config=$(HOST_DIR)/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/xml2-config
>
> Well, there's much simpler: $(HOST_DIR)/usr/arm-buildroot-linux-gnueabi/sysroot
> is exactly what we call $(STAGING_DIR).
>
> Beside, what you wrote would not work with anything else that an
> arm-buildroot-linux-gnueabi. ;-)

I was to high, I got it compiled at all :-)

> I'll fix that too.

Thanks.

Yegor
