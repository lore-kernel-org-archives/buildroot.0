From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 5 Jul 2017 14:34:46 -0700
Subject: [Buildroot] [PATCH] python-systemd: add new package
In-Reply-To: <CAGm1_kt1LUEfa-pQOMFJLvoiq6yL256rjyPT0N++qv5LH9XkAg@mail.gmail.com>
References: <20170704194716.15130-1-andrew.smirnov@gmail.com>
 <CAGm1_kt1LUEfa-pQOMFJLvoiq6yL256rjyPT0N++qv5LH9XkAg@mail.gmail.com>
Message-ID: <CAHQ1cqGUGfABXZPesD+nbnTENx4t5_Jvcb6Kf6oWpLiWtp28Ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 5, 2017 at 2:46 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> Hi Andrey,
>
> On Tue, Jul 4, 2017 at 9:47 PM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> Add package for official python bindings availibe as a part of systemd
>> project at: https://github.com/systemd/python-systemd
>>
>> Minimal config snippet for utils/test-pkg is as follows (sans
>> backslashes):
>>
>> \# BR2_INIT_BUSYBOX is not set
>> \# BR2_INIT_SYSV is not set
>> BR2_INIT_SYSTEMD=y
>> \# BR2_INIT_NONE is not set
>> BR2_PACKAGE_PYTHON3=y
>> BR2_PACKAGE_PYTHON_SYSTEMD=y
>>
>> Cc: Yegor Yefremov <yegorslists@googlemail.com>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  DEVELOPERS                               |  1 +
>>  package/Config.in                        |  1 +
>>  package/python-systemd/Config.in         |  7 +++++++
>>  package/python-systemd/python-systemd.mk | 14 ++++++++++++++
>
> python-systemd.hash file is missing.

Dang! Forgot to "git add" it. Will fix in v2.

>
>>  4 files changed, 23 insertions(+)
>>  create mode 100644 package/python-systemd/Config.in
>>  create mode 100644 package/python-systemd/python-systemd.mk
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index 7c8d7f1..08a138a 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -94,6 +94,7 @@ F:    package/python-pathlib2/
>>  F:     package/python-pickleshare/
>>  F:     package/python-scandir/
>>  F:     package/python-simplegeneric/
>> +F:     package/python-systemd/
>>  F:     package/python-traitlets/
>>
>>  N:     Andrey Yurovsky <yurovsky@gmail.com>
>> diff --git a/package/Config.in b/package/Config.in
>> index a811ff6..af1aa0c 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -860,6 +860,7 @@ menu "External python modules"
>>         source "package/python-socketio/Config.in"
>>         source "package/python-sortedcontainers//Config.in"
>>         source "package/python-spidev/Config.in"
>> +       source "package/python-systemd/Config.in"
>>         source "package/python-tempora/Config.in"
>>         source "package/python-thrift/Config.in"
>>         source "package/python-tomako/Config.in"
>> diff --git a/package/python-systemd/Config.in b/package/python-systemd/Config.in
>> new file mode 100644
>> index 0000000..83fdcb4
>> --- /dev/null
>> +++ b/package/python-systemd/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_PYTHON_SYSTEMD
>> +       bool "python-systemd"
>> +       depends on BR2_PACKAGE_SYSTEMD
>> +       help
>> +         Python module for native access to the systemd facilities.
>> +
>> +         https://github.com/systemd/python-systemd
>
> Missing comment saying, that this package needs systemd
>

OK, will fix in v2.

>> diff --git a/package/python-systemd/python-systemd.mk b/package/python-systemd/python-systemd.mk
>> new file mode 100644
>> index 0000000..a3684c4
>> --- /dev/null
>> +++ b/package/python-systemd/python-systemd.mk
>> @@ -0,0 +1,14 @@
>> +################################################################################
>> +#
>> +# python-systemd
>> +#
>> +################################################################################
>> +
>> +PYTHON_SYSTEMD_DEPENDENCIES = systemd # To be able to link against libsystemd
>
> put dependencies statement after license stuff

OK, will fix in v2.

Thanks,
Andrey Smirnov
