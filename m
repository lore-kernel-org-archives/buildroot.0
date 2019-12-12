From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Fri, 13 Dec 2019 00:37:49 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/python-avro: new package
In-Reply-To: <CAKcgs2xukFUxUWfn8_k6UDYod5ds9VP8X4mqro9scKev9rpy=w@mail.gmail.com>
References: <20191212124143.220947-1-titouan.christophe@railnova.eu>
 <20191212124143.220947-3-titouan.christophe@railnova.eu>
 <CAKcgs2xukFUxUWfn8_k6UDYod5ds9VP8X4mqro9scKev9rpy=w@mail.gmail.com>
Message-ID: <b3e3517a-3be6-caa1-d00d-32facf9e9adf@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 12/12/19 9:55 PM, Gilles Talis wrote:
> Hello Titouan, all
> 
> Le jeu. 12 d?c. 2019 ? 13:41, Titouan Christophe
> <titouan.christophe@railnova.eu> a ?crit :

[snip]

>> diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
>> new file mode 100644
>> index 0000000000..08a25f0c84
>> --- /dev/null
>> +++ b/package/python-avro/python-avro.mk
>> @@ -0,0 +1,14 @@
>> +################################################################################
>> +#
>> +# python-avro
>> +#
>> +################################################################################
>> +
>> +PYTHON_AVRO_VERSION = 1.9.1
> As mentioned, you could benefit from using the same package version as
> avro-c... or not.

I don't see examples of other pkgs doing this kind of cross-pkg version 
reference, do you have one in mind ? (apart from "plugins" packages, 
like all the QT5 modules; as it was the case in the v1 of this Avro series).

To me, this looks like a style decision. I have a preference for the 
"... or not" option, but maybe the core contributors have a guideline ?

> 
>> +PYTHON_AVRO_SITE = https://www-eu.apache.org/dist/avro/avro-1.9.1/py3
>> +PYTHON_AVRO_SOURCE = avro-python3-$(PYTHON_AVRO_VERSION).tar.gz
>> +PYTHON_AVRO_LICENSE = Apache-2.0
>> +PYTHON_AVRO_LICENSE_FILES = avro/LICENSE avro/NOTICE
> It is only avro/LICENSE
> 
>> +PYTHON_AVRO_SETUP_TYPE = setuptools
>> +
>> +$(eval $(python-package))
>> --
>> 2.23.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> Thanks
> Gilles.
> 

All your other comments addressed, I will submit a new version of this 
patch as well.

Regards,

Titouan
