From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 4 Apr 2016 14:41:38 -0700
Subject: [Buildroot] [PATCH 1/1] PyMySQL: new package
In-Reply-To: <5702D9FD.1000908@mind.be>
References: <1459197439-25518-1-git-send-email-stevecalfee@gmail.com>
 <5702D9FD.1000908@mind.be>
Message-ID: <CAJJ6jxtm+3x_r3D=QeF9t_9EF0NRHDPPvzJrh9sdGcDRaWnovw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Arnout, thanks for your time, see below.

On Mon, Apr 4, 2016 at 2:17 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 03/28/16 22:37, Steve Calfee wrote:
>>
>> add python to mysql connection software, pure python
>>
>> Signed-off-by: Steve Calfee <stevecalfee@gmail.com>
>> ---
>>   package/Config.in                          |  1 +
>>   package/python-pymysql/Config.in           |  7 +++++++
>>   package/python-pymysql/python-pymysql.hash |  5 +++++
>>   package/python-pymysql/python-pymysql.mk   | 14 ++++++++++++++
>>   4 files changed, 27 insertions(+)
>>   create mode 100644 package/python-pymysql/Config.in
>>   create mode 100644 package/python-pymysql/python-pymysql.hash
>>   create mode 100644 package/python-pymysql/python-pymysql.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 529ad33..2543195 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -683,6 +683,7 @@ menu "External python modules"
>>         source "package/python-pyftpdlib/Config.in"
>>         source "package/python-pygame/Config.in"
>>         source "package/python-pyinotify/Config.in"
>> +       source "package/python-pymysql/Config.in"
>>         source "package/python-pyparsing/Config.in"
>>         source "package/python-pyparted/Config.in"
>>         source "package/python-pypcap/Config.in"
>> diff --git a/package/python-pymysql/Config.in
>> b/package/python-pymysql/Config.in
>> new file mode 100644
>> index 0000000..a6de53d
>> --- /dev/null
>> +++ b/package/python-pymysql/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_PYTHON_PYMYSQL
>> +       bool "python-pymysql"
>> +       depends on BR2_PACKAGE_PYTHON
>
>
>  Why? According to the website it supports python3 >= 3.3.

What should I use, or in other words, what is the depends on for
either python 2 or python 3? I use and have tested it in python 2.7...

>
>> +       help
>> +         python-pymysql is a pure Python binding for mySQL.
>> +
>> +         https://pypi.python.org/
>
>
>  I guess you meant https://pypi.python.org/pypi/PyMySQL/

OK, good -- the pypi site I find confusing.


>
>> diff --git a/package/python-pymysql/python-pymysql.hash
>> b/package/python-pymysql/python-pymysql.hash
>> new file mode 100644
>> index 0000000..37b6299
>> --- /dev/null
>> +++ b/package/python-pymysql/python-pymysql.hash
>> @@ -0,0 +1,5 @@
>> +#https://pypi.python.org/packages/source/P/PyMySQL/PyMySQL-0.7.2.tar.gz
>
>
>  This line is redundant.

OK, will remove


>
>> +#md5
>> https://pypi.python.org/pypi?:action=show_md5&digest=6d757cda8bfbd312714207f7c0bef5c7
>
>
>  This should either be:
>
> # md5 from ..., sha256 locally calculated
>
> (and no comment below), or:
>
> # From ...
>
> (and keep the comment below).
>

OK, will do.

Thanks again, Steve
