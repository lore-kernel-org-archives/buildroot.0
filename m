From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 27 Mar 2016 22:51:59 +0200
Subject: [Buildroot] [PATCH v4 2/3] python-pexpect: new package
In-Reply-To: <20160327035045.3c8e6396@jvn>
References: <1459042284-6684-1-git-send-email-viktorin@rehivetech.com>
 <1459042284-6684-3-git-send-email-viktorin@rehivetech.com>
 <20160327035045.3c8e6396@jvn>
Message-ID: <CAGm1_kv8McTGNN4dp-J+HD1b=42xzOcTgSg7ESdByN0hBGbyJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 27, 2016 at 3:50 AM, Jan Viktorin <viktorin@rehivetech.com> wrote:
> On Sun, 27 Mar 2016 03:31:23 +0200
> Jan Viktorin <viktorin@rehivetech.com> wrote:
>
>> v4
>> * source https://pypi.python.org/pypi/pexpect
>> * added hash file
>>
>> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
>> ---
>
> [...]
>
>> diff --git a/package/python-pexpect/python-pexpect.hash b/package/python-pexpect/python-pexpect.hash
>> new file mode 100644
>> index 0000000..0d1e1fe
>> --- /dev/null
>> +++ b/package/python-pexpect/python-pexpect.hash
>> @@ -0,0 +1,4 @@
>> +# got from https://pypi.python.org
>> +md5sum       056df81e6ca7081f1015b4b147b977b7
>> +# computed manually:
>> +sha256sum 232795ebcaaf2e120396dbbaa3a129eda51757eeaae1911558f4ef8ee414fc6c  pexpect-4.0.1.tar.gz
>
> Should be md5 and sha256 (without sum)...
>
>> diff --git a/package/python-pexpect/python-pexpect.mk b/package/python-pexpect/python-pexpect.mk
>> new file mode 100644
>> index 0000000..8b2809b
>> --- /dev/null
>> +++ b/package/python-pexpect/python-pexpect.mk
>> @@ -0,0 +1,15 @@
>> +################################################################################
>> +#
>> +# python-pexpect
>> +#
>> +################################################################################
>> +
>> +PYTHON_PEXPECT_VERSION = 4.0.1
>> +PYTHON_PEXPECT_SITE = https://pypi.python.org/pypi/pexpect
>
> The URL should be https://pypi.python.org/packages/source/p/pexpect.
>
>> +PYTHON_PEXPECT_SOURCE = pexpect-$(PYTHON_PEXPECT_VERSION).tar.gz
>> +PYTHON_PEXPECT_LICENSE = ISC
>> +PYTHON_PEXPECT_LICENSE_FILES = LICENSE
>> +PYTHON_PEXPECT_SETUP_TYPE = distutils
>> +PYTHON_PEXPECT_DEPENDENCIES = python-ptyprocess

drop this build-time dependency

Resend v5 with all fixes and add my

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

to both python patches.

Thanks.

Yegor

>> +
>> +$(eval $(python-package))
