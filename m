From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 1 Feb 2016 19:44:33 +0100
Subject: [Buildroot] [PATCH 08/22] package/python-pycparser: new package.
In-Reply-To: <CAGm1_ktHgBjvZz_d1PGnmOyGwz=L+1AKVkAuQO9APb7o9rmMEg@mail.gmail.com>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
 <1454335541-14224-9-git-send-email-mc5686@mclink.it>
 <CAGm1_ktHgBjvZz_d1PGnmOyGwz=L+1AKVkAuQO9APb7o9rmMEg@mail.gmail.com>
Message-ID: <56AFA791.5090305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-02-16 15:54, Yegor Yefremov wrote:
> On Mon, Feb 1, 2016 at 3:05 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
>> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
>> ---
>>  package/Config.in                              |  1 +
>>  package/python-pycparser/Config.in             |  6 ++++++
>>  package/python-pycparser/python-pycparser.hash |  4 ++++
>>  package/python-pycparser/python-pycparser.mk   | 15 +++++++++++++++
>>  4 files changed, 26 insertions(+)
>>  create mode 100644 package/python-pycparser/Config.in
>>  create mode 100644 package/python-pycparser/python-pycparser.hash
>>  create mode 100644 package/python-pycparser/python-pycparser.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 80b4868..4c97954 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -679,6 +679,7 @@ menu "External python modules"
>>         source "package/python-psutil/Config.in"
>>         source "package/python-pyasn/Config.in"
>>         source "package/python-pycli/Config.in"
>> +       source "package/python-pycparser/Config.in"
>>         source "package/python-pycrypto/Config.in"
>>         source "package/python-pydal/Config.in"
>>         source "package/python-pyftpdlib/Config.in"
>> diff --git a/package/python-pycparser/Config.in b/package/python-pycparser/Config.in
>> new file mode 100644
>> index 0000000..49190c3
>> --- /dev/null
>> +++ b/package/python-pycparser/Config.in
>> @@ -0,0 +1,6 @@
>> +config BR2_PACKAGE_PYTHON_PYCPARSER
>> +       bool "python-pycparser"
>> +       help
>> +         C parser in Python
>> +
>> +         https://github.com/eliben/pycparser
>> diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
>> new file mode 100644
>> index 0000000..483d3d1
>> --- /dev/null
>> +++ b/package/python-pycparser/python-pycparser.hash
>> @@ -0,0 +1,4 @@
>> +# md5 from https://pypi.python.org/pypi/pycparser/json
>> +md5    a2bc8d28c923b4fe2b2c3b4b51a4f935  pycparser-2.14.tar.gz
>> +# sha256 calculated by scanpypi
>> +sha256 7959b4a74abdc27b312fed1c21e6caf9309ce0b29ea86b591fd2e99ecdf27f73  pycparser-2.14.tar.gz
>> diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
>> new file mode 100644
>> index 0000000..a32f1aa
>> --- /dev/null
>> +++ b/package/python-pycparser/python-pycparser.mk
>> @@ -0,0 +1,15 @@
>> +################################################################################
>> +#
>> +# python-pycparser
>> +#
>> +################################################################################
>> +
>> +PYTHON_PYCPARSER_VERSION = 2.14
>> +PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
>> +PYTHON_PYCPARSER_SITE = https://pypi.python.org/packages/source/p/pycparser
>> +PYTHON_PYCPARSER_SETUP_TYPE = setuptools
>> +PYTHON_PYCPARSER_LICENSE = BSD-3c
>> +PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
>> +
>> +$(eval $(python-package))
>> +$(eval $(host-python-package))
>> --
>> 2.1.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> drop this patch from your series, as it is already in patchwork

 No, it should still be in this series, and marked as superseded in patchwork.
Of course, the author of this patch should then be kept as the original author
(Yegor).

 If this patch is not in the series, the series will not be stand-alone.

 Regards,
 Arnout

> 
> Yegor
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
