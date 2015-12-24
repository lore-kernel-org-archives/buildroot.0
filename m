From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 24 Dec 2015 23:12:49 +0100
Subject: [Buildroot] [PATCH 3/5] python-cffi: add host variant
In-Reply-To: <20151224214645.GA3738@free.fr>
References: <1450992641-8618-1-git-send-email-yegorslists@googlemail.com>
 <1450992641-8618-3-git-send-email-yegorslists@googlemail.com>
 <20151224214645.GA3738@free.fr>
Message-ID: <CAGm1_kvud8TAWddmadKqMi+=Mpcfzx=XJ3KMgt2yB-otDq-DpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 24, 2015 at 10:46 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Yegor, All,
>
> On 2015-12-24 22:30 +0100, Yegor Yefremov spake thusly:
>> Host variant is needed to build python-cryptography package.
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  package/python-cffi/python-cffi.mk | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
>> index 70fbe02..a6e4107 100644
>> --- a/package/python-cffi/python-cffi.mk
>> +++ b/package/python-cffi/python-cffi.mk
>> @@ -11,5 +11,7 @@ PYTHON_CFFI_SETUP_TYPE = setuptools
>>  PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
>>  PYTHON_CFFI_LICENSE = MIT
>>  PYTHON_CFFI_LICENSE_FILES = LICENSE
>> +HOST_PYTHON_CFFI_DEPENDENCIES = host-python-pycparser
>
> So, the host variant needs python-pycparser, but the target variantdoes
> not?
>
> I would have expect either:
>     PYTHON_CFFI_DEPENDENCIES += host-python-pycparser
>
> or:
>     PYTHON_CFFI_DEPENDENCIES += python-pycparser
>
> Care to shed some light on this, please?

Target variant doesn't need pycparser. cffi's setup.py seems to
distinguish, if we install real package or cross-compiled one:

        install_requires=[
            'pycparser',
        ] if cpython else [],

https://bitbucket.org/cffi/cffi/src/f52d1e25624c8fcdd70088b53db91a3e27bc8f23/setup.py?at=default&fileviewer=file-view-default#setup.py-171

Yegor
