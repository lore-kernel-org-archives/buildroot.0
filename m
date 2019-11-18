From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 18 Nov 2019 10:48:16 +0100
Subject: [Buildroot] [PATCH 1/5] boot/optee-os: bump version to 3.7.0
In-Reply-To: <CAN5uoS_HYeUBtDZAySY8USYRtVwVtKpEPkH=m6DPmLx3sT6gDQ@mail.gmail.com>
References: <f25cf981ca8a67c30ac2b994980a9f26aceb1dd2.1572355772.git.etienne.carriere@linaro.org>
 <0ab9971d-5da4-f3c9-d0d7-08ceb4b20c33@smile.fr>
 <CAN5uoS_HYeUBtDZAySY8USYRtVwVtKpEPkH=m6DPmLx3sT6gDQ@mail.gmail.com>
Message-ID: <6eeec682-51a6-0ddd-310d-8bcda3d54557@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Etienne,

Le 18/11/2019 ? 10:36, Etienne Carriere a ?crit?:
> Hello Romain,
> 
> On Sun, 17 Nov 2019 at 23:23, Romain Naour <romain.naour@smile.fr> wrote:
>>
>> Hi Etienne,
>>
>> Le 29/10/2019 ? 15:41, Etienne Carriere a ?crit :
>>> Bump OP-TEE OS package version to OP-TEE release 3.7.0.
>>>
>>> This adds host-python-pyelftools to optee-os dependencies
>>>
>>> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
>>> ---
>>
>> There is a build issue with optee-os:
>>
>> make[1]: Entering directory 'output/build/optee-os-3.7.0'
>>   GEN     out/core/include/generated/arm32_sysreg.h
>>   GEN     out/core/include/generated/arm32_sysreg.S
>>   CHK     out/conf.mk
>>   GEN     out/core/ta_pub_key.c
>>   UPD     out/conf.mk
>>   TOUCH   out/core/tee-pageable.bin
>>   GEN     out/include/generated/arm32_user_sysreg.h
>> Traceback (most recent call last):
>>   File "scripts/pem_to_pub_c.py", line 61, in <module>
>>     main()
>>   File "scripts/pem_to_pub_c.py", line 24, in main
>>     from Crypto.PublicKey import RSA
>> ImportError: No module named 'Crypto'
>> mk/subdir.mk:159: recipe for target 'out/core/ta_pub_key.c' failed
>>
>> I would add host-python-pycrypto in the dependencies.
> 
> I'm surprised as the patch adds host-python-pyelftools to
> OPTEE_OS_DEPENDENCIES which already specifies host-python-pycrypto:

Ok

> 
>>> -OPTEE_OS_DEPENDENCIES = host-openssl host-python-pycrypto
>>> +OPTEE_OS_DEPENDENCIES = host-openssl host-python-pycrypto host-python-pyelftools
> 
> Did I miss something?

The issue has been detected by the gitlab CI
https://gitlab.com/buildroot.org/buildroot/-/jobs/352841047

Are we sure to use the correct python interpreter ?
Maybe we have to provide the path to output/host/bin/python otherwise it will
use /usr/bin/python ?

Best regards,
Romain


> 
> Regards,
> Etienne
> 
>>
>> Best regards,
>> Romain
