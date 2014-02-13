From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 13 Feb 2014 10:15:14 +0100
Subject: [Buildroot] [PATCH] host python/python3: conditionally disable
	unicodedata
In-Reply-To: <20140207112819.2fab19a3@skate>
References: <e06b104c5f166c541741.1391768165@argentina>
 <20140207112819.2fab19a3@skate>
Message-ID: <CAAXf6LXfA8rir0O_49wy6Y5ur55k_U7P=88OsJB3JsVTwUzYPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Feb 7, 2014 at 11:28 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Fri, 07 Feb 2014 11:16:05 +0100, Thomas De Schampheleire wrote:
>> The host python always had --disable-unicodedata, regardless of the
>> corresponding configuration option BR2_PACKAGE_PYTHON_UNICODEDATA.
>> Since the host python is used to byte-compile python modules, this meant
>> that such modules could not contain unicode strings. For example, following
>> statement in a python module:
>>     print u"\N{SOLIDUS}"
>>
>> would cause the byte-compilation to fail with message:
>>     SyntaxError: ("(unicode error) \\N escapes not supported (can't load
>>     unicodedata module)",
>>
>> Instead, conditionally disable unicodedata based on
>> BR2_PACKAGE_PYTHON_UNICODEDATA, also for the host python.
>>
>> This fixes bug #6542 (https://bugs.busybox.net/show_bug.cgi?id=6542)
>>
>> Reported-by: Gernot Vormayr <gvormayr@gmail.com>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> For information, my upcoming patch series that bumps Python uses
> --enable-unicodedata unconditionally for the host python, because
> recent versions of python-setuptools need unicodedata.
>

I think this patch should still be part of 2014.02.

Best regards,
Thomas
