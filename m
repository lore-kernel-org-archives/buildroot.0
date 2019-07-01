From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 1 Jul 2019 11:39:08 +0100
Subject: [Buildroot] [PATCH 2/3] package/python-jailhouse: new package
In-Reply-To: <CAGm1_ksmPzx5er=tNPF2oXWJk0W_r2fPoiwZ2NypTj8B_==ajg@mail.gmail.com>
References: <20190621102339.22286-1-ccaione@baylibre.com>
 <20190621102339.22286-3-ccaione@baylibre.com>
 <CAGm1_ksmPzx5er=tNPF2oXWJk0W_r2fPoiwZ2NypTj8B_==ajg@mail.gmail.com>
Message-ID: <faf51720-610d-6ef7-bb46-370b66c44a09@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/07/2019 08:04, Yegor Yefremov wrote:
> Hi Carlo,

Hi Yegor,

>> --- /dev/null
>> +++ b/package/python-jailhouse/python-jailhouse.mk
>> @@ -0,0 +1,14 @@
>> +################################################################################
>> +#
>> +# python-jailhouse
>> +#
>> +################################################################################
>> +
>> +PYTHON_JAILHOUSE_VERSION = 0.10
>> +PYTHON_JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
>> +PYTHON_JAILHOUSE_LICENSE = GPL-2.0
>> +PYTHON_JAILHOUSE_LICENSE_FILES = COPYING
>> +
>> +PYTHON_JAILHOUSE_SETUP_TYPE = setuptools
>> +
>> +$(eval $(python-package))
> 
> Does python-jailhouse depend on jailhouse at run-time? I would just
> make one package jailhouse and compile python-jailhouse if either
> Python2 or Python3 is selected. So instead of 3 patches you can make
> just one.

You mean having one single package for both jailhouse and 
python-jailhouse in one single mk file? Can we practically achieve that 
since jailhouse is a generic package while I'm using $(eval 
$(python-package)) for python-jailhouse?

--
Carlo Caione
