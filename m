From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 1 Sep 2017 09:13:11 +0200
Subject: [Buildroot] [PATCH] package/python-web2py: bump to version
	R-2.15.3
In-Reply-To: <20170901070115.m3mtceen5wkd2cyk@tarshish>
References: <1504248347-24424-1-git-send-email-angelo.compagnucci@gmail.com>
 <20170901070115.m3mtceen5wkd2cyk@tarshish>
Message-ID: <CAGm1_kssNXruzF9k=9Z4u_6NyEYzABzmm_d+5nh-twDM=TOKGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Fri, Sep 1, 2017 at 9:01 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Angelo,
>
> On Fri, Sep 01, 2017 at 08:45:47AM +0200, Angelo Compagnucci wrote:
>> This patch bumps web2py to the latest version R-2.15.3 and bumps
>> also the python-pydal dependency to the required latest version 17.8.
>> Starting with version R-2.15.3 web2py supports also python 3, so
>> updating the package to support both versions.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> ---
>>  package/python-pydal/python-pydal.hash   |  4 ++--
>>  package/python-pydal/python-pydal.mk     |  4 ++--
>>  package/python-web2py/Config.in          | 10 ++++++----
>>  package/python-web2py/python-web2py.hash |  2 +-
>>  package/python-web2py/python-web2py.mk   |  6 +++---
>>  5 files changed, 14 insertions(+), 12 deletions(-)
>>
>> diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
>> index 8e20215..9a3fad3 100644
>> --- a/package/python-pydal/python-pydal.hash
>> +++ b/package/python-pydal/python-pydal.hash
>> @@ -1,3 +1,3 @@
>>  # md5 from https://pypi.python.org/pypi/pydal/json, sha256 locally computed
>> -md5 f544da78cd4980d3a13024bc79065cf0 pyDAL-17.1.tar.gz
>> -sha256 ae33e903725133c051df3cd0712cc1967997f56fc480a90ab6a7c50df265f9d1 pyDAL-17.1.tar.gz
>> +md5 5a6ad0db15dc39987b4518247a9d0b4b pyDAL-17.8.tar.gz
>> +sha256 46abe2c978ec24013e29cf485a74c90309ebcd2f0d577687ff2d224547cebfc8  pyDAL-17.8.tar.gz
>> diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
>> index 173fe6e..c8d4b44 100644
>> --- a/package/python-pydal/python-pydal.mk
>> +++ b/package/python-pydal/python-pydal.mk
>> @@ -4,9 +4,9 @@
>>  #
>>  ################################################################################
>>
>> -PYTHON_PYDAL_VERSION = 17.1
>> +PYTHON_PYDAL_VERSION = 17.8
>>  PYTHON_PYDAL_SOURCE = pyDAL-$(PYTHON_PYDAL_VERSION).tar.gz
>> -PYTHON_PYDAL_SITE = https://pypi.python.org/packages/64/9a/4fc08f6078b3a3019a9e33c8383bb023e064405dc5e16c273b8ec6d430cd
>> +PYTHON_PYDAL_SITE = https://pypi.python.org/packages/e3/bd/1d5ca8be486d845074161456637f7d73acc09dc6c8d69bf0e7ad55ce9027
>>  PYTHON_PYDAL_LICENSE = BSD-3-Clause
>>  PYTHON_PYDAL_LICENSE_FILES = LICENSE
>>  PYTHON_PYDAL_SETUP_TYPE = setuptools
>> diff --git a/package/python-web2py/Config.in b/package/python-web2py/Config.in
>> index 3b55153..bc2e605 100644
>> --- a/package/python-web2py/Config.in
>> +++ b/package/python-web2py/Config.in
>> @@ -1,10 +1,12 @@
>>  config BR2_PACKAGE_PYTHON_WEB2PY
>>       bool "python-web2py"
>> -     depends on BR2_PACKAGE_PYTHON
>
> You still need a version of python on target, isn't it? How do you ensure
> that?

If the package is compatible with both Python 2 and 3 you don't need
to specify a Python version. The package is only available if either
Python version is selected.

>>       select BR2_PACKAGE_PYTHON_PYDAL
>> -     select BR2_PACKAGE_PYTHON_ZLIB
>> -     select BR2_PACKAGE_PYTHON_PYEXPAT
>> -     select BR2_PACKAGE_PYTHON_SQLITE
>> +     select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
>> +     select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
>> +     select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
>> +     select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
>> +     select BR2_PACKAGE_PYTHON_SQLITE if BR2_PACKAGE_PYTHON # runtime
>> +     select BR2_PACKAGE_PYTHON3_SQLITE if BR2_PACKAGE_PYTHON3 # runtime
>
> This duplication does not look nice. I don't have a better suggestion, though.

This is a common practice for packages, that are compatible with both
Python versions.

Yegor

>>       help
>>         web2py is a free open source full-stack framework for rapid
>>         development of fast, scalable, secure and portable
>> diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
>> index 9c1de90..5404843 100644
>> --- a/package/python-web2py/python-web2py.hash
>> +++ b/package/python-web2py/python-web2py.hash
>> @@ -1,2 +1,2 @@
>>  # sha256 locally computed
>> -sha256 6079aeaa352ec51e0da5e6abc71fa74cdb3a781e06a311b5826618624362a7b2   python-web2py-R-2.14.6.tar.gz
>> +sha256 a8b0b963825c3ddb6505b3fc30f199a8a3bf01e9644fcd8ad45edde0c0bf8858  python-web2py-R-2.15.3.tar.gz
>> diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
>> index 887925b..f8aa5a6 100644
>> --- a/package/python-web2py/python-web2py.mk
>> +++ b/package/python-web2py/python-web2py.mk
>> @@ -4,11 +4,11 @@
>>  #
>>  ################################################################################
>>
>> -PYTHON_WEB2PY_VERSION = R-2.14.6
>> +PYTHON_WEB2PY_VERSION = R-2.15.3
>>  PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,$(PYTHON_WEB2PY_VERSION))
>>  PYTHON_WEB2PY_LICENSE = LGPL-3.0
>>  PYTHON_WEB2PY_LICENSE_FILES = LICENSE
>> -PYTHON_WEB2PY_DEPENDENCIES = python python-pydal host-python-pydal
>> +PYTHON_WEB2PY_DEPENDENCIES = python-pydal host-python-pydal
>>
>>  PYTHON_WEB2PY_EXCLUSIONS = \
>>       welcome.w2p \
>> @@ -30,7 +30,7 @@ PYTHON_WEB2PY_EXCLUSIONS = \
>>       tox.ini
>>
>>  define PYTHON_WEB2PY_GENERATE_PASSWORD
>> -     $(HOST_DIR)/bin/python2 -c 'import os; \
>> +     $(HOST_DIR)/bin/python -c 'import os; \
>>               os.chdir("$(@D)"); \
>>               from gluon.main import save_password; \
>>               save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),8000)'
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
