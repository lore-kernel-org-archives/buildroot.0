From: Mauro Condarelli <mc5686@mclink.it>
Date: Sat, 20 Feb 2016 13:56:24 +0100
Subject: [Buildroot] [PATCH v4 05/17] python-pynacl: new package
In-Reply-To: <20160219222144.3e9e3402@free-electrons.com>
References: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
 <1454799603-5474-6-git-send-email-mc5686@mclink.it>
 <20160219222144.3e9e3402@free-electrons.com>
Message-ID: <56C86278.1050304@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas.

Il 19/02/2016 22:21, Thomas Petazzoni ha scritto:
> Dear Mauro Condarelli,
>
> On Sat,  6 Feb 2016 23:59:51 +0100, Mauro Condarelli wrote:
>
>> diff --git a/package/python-pynacl/Config.in b/package/python-pynacl/Config.in
>> new file mode 100644
>> index 0000000..5a53648
>> --- /dev/null
>> +++ b/package/python-pynacl/Config.in
>> @@ -0,0 +1,9 @@
>> +config BR2_PACKAGE_PYTHON_PYNACL
>> +	bool "python-pynacl"
>> +	select BR2_PACKAGE_LIBSODIUM
>> +	select BR2_PACKAGE_PYTHON_SIX # runtime
> So python-six is a runtime dependency only...
This seems to be the right part.
https://github.com/pyca/pynacl/blob/master/setup.py says:
     requirements = ["six"]
     setup_requirements = []

(I still fail to fully understand semantic of these statements; I'm not a Python programmer, I merely needed a Python *application* so I had to provide its dependencies).


>
>> diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
>> new file mode 100644
>> index 0000000..e82611e
>> --- /dev/null
>> +++ b/package/python-pynacl/python-pynacl.mk
>> @@ -0,0 +1,16 @@
>> +################################################################################
>> +#
>> +# python-pynacl
>> +#
>> +################################################################################
>> +
>> +PYTHON_PYNACL_VERSION = 1.0.1
>> +PYTHON_PYNACL_SOURCE = PyNaCl-$(PYTHON_PYNACL_VERSION).tar.gz
>> +PYTHON_PYNACL_SITE = http://pypi.python.org/packages/source/P/PyNaCl
>> +PYTHON_PYNACL_LICENSE = Apache-2.0
>> +PYTHON_PYNACL_LICENSE_FILES = LICENSE
>> +PYTHON_PYNACL_SETUP_TYPE = setuptools
>> +PYTHON_PYNACL_DEPENDENCIES = libsodium python-six
> ... but it is listed in PYTHON_PYNACL_DEPENDENCIES.
This is probably wrong.
Yegor, can You comment, please?

> This is not consistent. Either the Config.in is wrong, or the .mk is
> wrong.
THIS is fully understood; sorry I didn't catch it earlier.

> Could you double check this ?
I will wait for Yegor comments as He is much more knowledgeable then me.

After that: what should I do?
resend the whole patch set (seems useless as most of them are already applied)?
link the patch to the previous set (how?)?
send it "standalone" (not reviewer-friendly)?

Any hint welcome!

> Thanks!
>
> Thomas
Regards
Mauro
