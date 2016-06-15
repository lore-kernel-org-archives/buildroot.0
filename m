From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 15 Jun 2016 22:27:30 +0200
Subject: [Buildroot] [PATCH 5/5] python-crossbar: bump to version 0.14.0
In-Reply-To: <20160615222101.720fa3a7@free-electrons.com>
References: <1465985358-12555-1-git-send-email-yegorslists@googlemail.com>
 <1465985358-12555-5-git-send-email-yegorslists@googlemail.com>
 <20160615222101.720fa3a7@free-electrons.com>
Message-ID: <CAGm1_kvzhQF7eM8Rz3DQX--4PB7v7a1TpDdu2f5Tc3FFh--QHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 15, 2016 at 10:21 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 15 Jun 2016 12:09:18 +0200, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  package/python-crossbar/Config.in            | 6 ++++--
>>  package/python-crossbar/python-crossbar.hash | 6 +++---
>>  package/python-crossbar/python-crossbar.mk   | 4 ++--
>>  3 files changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
>> index 4e613db..f3a6901 100644
>> --- a/package/python-crossbar/Config.in
>> +++ b/package/python-crossbar/Config.in
>> @@ -9,7 +9,6 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
>>       select BR2_PACKAGE_PYTHON_JINJA2
>>       select BR2_PACKAGE_PYTHON_LMDB
>>       select BR2_PACKAGE_PYTHON_MISTUNE
>> -     select BR2_PACKAGE_PYTHON_MSGPACK
>
> So you no longer select python-msgpack...
>
>>       select BR2_PACKAGE_PYTHON_NETADDR
>>       select BR2_PACKAGE_PYTHON_PSUTIL
>>       select BR2_PACKAGE_PYTHON_PYASN
>> @@ -20,6 +19,7 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
>>       select BR2_PACKAGE_PYTHON_PYOPENSSL
>>       select BR2_PACKAGE_PYTHON_PYTRIE
>>       select BR2_PACKAGE_PYTHON_PYYAML
>> +     select BR2_PACKAGE_PYTHON_SDNOTIFY
>>       select BR2_PACKAGE_PYTHON_SETUPTOOLS
>>       select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
>>       select BR2_PACKAGE_PYTHON_SETPROCTITLE
>> @@ -27,7 +27,9 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
>>       select BR2_PACKAGE_PYTHON_SHUTILWHICH if BR2_PACKAGE_PYTHON
>>       select BR2_PACKAGE_PYTHON_TREQ
>>       select BR2_PACKAGE_PYTHON_TWISTED
>> -     select BR2_PACKAGE_PYTHON_UJSON
>> +     select BR2_PACKAGE_PYTHON_U_MSGPACK
>> +     select BR2_PACKAGE_PYTHON_UBJSON
>> +     select BR2_PACKAGE_PYTHON_WATCHDOG
>>       select BR2_PACKAGE_PYTHON_WSACCEL
>>       depends on BR2_INSTALL_LIBSTDCPP # python-msgpack -> msgpack
>>       depends on BR2_TOOLCHAIN_HAS_SYNC_4 # python-msgpack -> msgpack
>
> ...but you keep the depends on that were needed because python-msgpack
> was selected. This doesn't seem right.
>
> Could you review this and send an updated version?

Good catch! Will send v2.

Yegor
