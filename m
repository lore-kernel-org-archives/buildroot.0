From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 29 Apr 2019 15:41:36 +0200
Subject: [Buildroot] Add python module Connexion
In-Reply-To: <CAOqJNTd1FdOS3tqzUrLdwGETBsjFRjK_bhZfR6bW+OniPmX6jA@mail.gmail.com>
References: <CAOqJNTe=E=jd_4MEoWAMAAgQJh9vSLMB0gBzHbcdM9vTbRoQVg@mail.gmail.com>
 <CAOqJNTd1FdOS3tqzUrLdwGETBsjFRjK_bhZfR6bW+OniPmX6jA@mail.gmail.com>
Message-ID: <CAGm1_kt_nPkomTjfSSt7ms1N69sKcLcv4MveeWcnG=8sJkhATQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Serhii,



On Mon, Apr 29, 2019 at 3:26 PM Serhii Sakhno <sergei.sakhno@gmail.com> wrote:
>
> If i right understand, i need to patch setup.py of Connexion for skip check flake8 module (i added flake8 to image)
>
> Regards,
> Sakhno Serhii
>
>
> ??, 29 ???. 2019 ?. ? 14:18, Serhii Sakhno <sergei.sakhno@gmail.com>:
>>
>> I would to add python module Connexion to buildroot. I haven`t problems with other python modules, but with Connexion (and with logging_tree, if i right remember) i have same problem.
>>
>>  >>> python-connexion 2.2.0 Building
>> buildroot_1  | (cd /ntc_image/standard/output/build/python-connexion-2.2.0//; _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata_m_linux_arm-linux-gnueabihf" PATH="/ntc_image/standard/output/host/bin:/ntc_image/standard/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" PYTHONPATH="/ntc_image/standard/output/target/usr/lib/python3.7/" PYTHONNOUSERSITE=1 _python_sysroot=/ntc_image/standard/output/host/arm-buildroot-linux-gnueabihf/sysroot _python_prefix=/usr _python_exec_prefix=/usr  /ntc_image/standard/output/host/bin/python setup.py build  )
>> buildroot_1  | Download error on https://pypi.org/simple/flake8/: unknown url type: https -- Some packages may not be found!
>> buildroot_1  | Couldn't find index page for 'flake8' (maybe misspelled?)
>> buildroot_1  | Download error on https://pypi.org/simple/: unknown url type: https -- Some packages may not be found!
>>
>> And now i didn't found problem with ssl.

you need following Config.in file created with "./utils/scanpypi Connexion":

config BR2_PACKAGE_PYTHON_CONNEXION
        bool "python-connexion"
        select BR2_PACKAGE_PYTHON_CLICKCLICK # runtime
        select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
        select BR2_PACKAGE_PYTHON_PYYAML # runtime
        select BR2_PACKAGE_PYTHON_REQUESTS # runtime
        select BR2_PACKAGE_PYTHON_SIX # runtime
        select BR2_PACKAGE_PYTHON_INFLECTION # runtime
        select BR2_PACKAGE_PYTHON_PATHLIB # runtime
        select BR2_PACKAGE_PYTHON_TYPING # runtime
        select BR2_PACKAGE_PYTHON_OPENAPI_SPEC_VALIDATOR # runtime
        select BR2_PACKAGE_PYTHON_FLASK # runtime
        help
          Connexion - API first applications with OpenAPI/Swagger and
          Flask.

          https://github.com/zalando/connexion

The only problem is BR2_PACKAGE_PYTHON_OPENAPI_SPEC_VALIDATOR. At
least scanpypi has problems with its description, so you'll have to
add it manually.

Regards,
Yegor
