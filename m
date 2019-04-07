From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sun, 7 Apr 2019 22:58:39 +0200
Subject: [Buildroot] [PATCH v2] python-numpy: add sublibraries licenses
In-Reply-To: <e2fb25a2-c910-70b7-48fd-6ed096a3d91e@micronovasrl.com>
References: <20180911124632.72416-1-giulio.benetti@micronovasrl.com>
 <4419822d-fcff-54bf-5a2e-92876e301f7d@micronovasrl.com>
 <e2fb25a2-c910-70b7-48fd-6ed096a3d91e@micronovasrl.com>
Message-ID: <b58c2ea4-0575-8360-10e1-2a6bbc753fa7@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 18/03/2019 15:51, Giulio Benetti ha scritto:
> Il 16/09/2018 18:09, Giulio Benetti ha scritto:
>> Il 11/09/2018 14:46, Giulio Benetti ha scritto:
>>> Release 1.15.1 tarball doesn't contain all sublibraries license files
>>> listed in the base LICENSE.txt file.
>>> This makes python-numpy-legal-info incomplete.
>>>
>>> Add patch to add missing sublibraries license files:
>>> - numpy/linalg/lapack_lite/LICENSE.txt
>>> - tools/npy_tempita/license.txt
>>> and therefore their sha256 into hash file.
>>> Update also PYTHON_NUMPY_LICENSE adding:
>>> BSD-2-Clause PSF Apache-2.0 MIT Zlib
>>>
>>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>>> ---
>>> Changes V1->V2:
>>> * fixed subject, it's not a fix, I'm adding licenses
>>> * add commas to separate licenses
>>>
>>>  ? ...02-Add-sublibraries-missing-licenses.patch | 89 +++++++++++++++++++
>>>  ? package/python-numpy/python-numpy.hash??????? |? 5 ++
>>>  ? package/python-numpy/python-numpy.mk????????? |? 8 +-
>>>  ? 3 files changed, 100 insertions(+), 2 deletions(-)
>>>  ? create mode 100644
>>> package/python-numpy/0002-Add-sublibraries-missing-licenses.patch
>>>
>>> diff --git
>>> a/package/python-numpy/0002-Add-sublibraries-missing-licenses.patch
>>> b/package/python-numpy/0002-Add-sublibraries-missing-licenses.patch
>>> new file mode 100644
>>> index 0000000000..457aaa945f
>>> --- /dev/null
>>> +++ b/package/python-numpy/0002-Add-sublibraries-missing-licenses.patch
>>> @@ -0,0 +1,89 @@
>>> +Add sublibraries license files
>>> +
>>> +On Release 1.15.1 tarball two license files are missing:
>>> +- numpy/linalg/lapack_lite/LICENSE.txt
>>> +- tools/npy_tempita/license.txt
>>> +
>>> +Add them to sources to keep licensing information complete.
>>> +
>>> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>>> +
>>> +diff -urpN numpy-1.15.1.orig/numpy/linalg/lapack_lite/LICENSE.txt
>>> numpy-1.15.1/numpy/linalg/lapack_lite/LICENSE.txt
>>> +--- numpy-1.15.1.orig/numpy/linalg/lapack_lite/LICENSE.txt
>>> 1970-01-01 01:00:00.000000000 +0100
>>> ++++ numpy-1.15.1/numpy/linalg/lapack_lite/LICENSE.txt??? 2018-09-11
>>> 00:00:41.239919567 +0200
>>> +@@ -0,0 +1,48 @@
>>> ++Copyright (c) 1992-2013 The University of Tennessee and The University
>>> ++??????????????????????? of Tennessee Research Foundation.? All rights
>>> ++??????????????????????? reserved.
>>> ++Copyright (c) 2000-2013 The University of California Berkeley. All
>>> ++??????????????????????? rights reserved.
>>> ++Copyright (c) 2006-2013 The University of Colorado Denver.? All rights
>>> ++??????????????????????? reserved.
>>> ++
>>> ++$COPYRIGHT$
>>> ++
>>> ++Additional copyrights may follow
>>> ++
>>> ++$HEADER$
>>> ++
>>> ++Redistribution and use in source and binary forms, with or without
>>> ++modification, are permitted provided that the following conditions are
>>> ++met:
>>> ++
>>> ++- Redistributions of source code must retain the above copyright
>>> ++? notice, this list of conditions and the following disclaimer.
>>> ++
>>> ++- Redistributions in binary form must reproduce the above copyright
>>> ++? notice, this list of conditions and the following disclaimer listed
>>> ++? in this license in the documentation and/or other materials
>>> ++? provided with the distribution.
>>> ++
>>> ++- Neither the name of the copyright holders nor the names of its
>>> ++? contributors may be used to endorse or promote products derived from
>>> ++? this software without specific prior written permission.
>>> ++
>>> ++The copyright holders provide no reassurances that the source code
>>> ++provided does not infringe any patent, copyright, or any other
>>> ++intellectual property rights of third parties.? The copyright holders
>>> ++disclaim any liability to any recipient for claims brought against
>>> ++recipient by any third party for infringement of that parties
>>> ++intellectual property rights.
>>> ++
>>> ++THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
>>> ++"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
>>> ++LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
>>> ++A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
>>> ++OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
>>> ++SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
>>> ++LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
>>> ++DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
>>> ++THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>>> ++(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
>>> ++OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>>> +diff -urpN numpy-1.15.1.orig/tools/npy_tempita/license.txt
>>> numpy-1.15.1/tools/npy_tempita/license.txt
>>> +--- numpy-1.15.1.orig/tools/npy_tempita/license.txt??? 1970-01-01
>>> 01:00:00.000000000 +0100
>>> ++++ numpy-1.15.1/tools/npy_tempita/license.txt??? 2018-09-11
>>> 00:00:41.271919819 +0200
>>> +@@ -0,0 +1,23 @@
>>> ++License
>>> ++-------
>>> ++
>>> ++Copyright (c) 2008 Ian Bicking and Contributors
>>> ++
>>> ++Permission is hereby granted, free of charge, to any person obtaining
>>> ++a copy of this software and associated documentation files (the
>>> ++"Software"), to deal in the Software without restriction, including
>>> ++without limitation the rights to use, copy, modify, merge, publish,
>>> ++distribute, sublicense, and/or sell copies of the Software, and to
>>> ++permit persons to whom the Software is furnished to do so, subject to
>>> ++the following conditions:
>>> ++
>>> ++The above copyright notice and this permission notice shall be
>>> ++included in all copies or substantial portions of the Software.
>>> ++
>>> ++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>>> ++EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>> ++MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>>> ++NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
>>> ++LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
>>> ++OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
>>> ++WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>>> diff --git a/package/python-numpy/python-numpy.hash
>>> b/package/python-numpy/python-numpy.hash
>>> index 7c7f446118..468d7de532 100644
>>> --- a/package/python-numpy/python-numpy.hash
>>> +++ b/package/python-numpy/python-numpy.hash
>>> @@ -2,3 +2,8 @@
>>>  ? sha256
>>> 3c1ccce5d935ef8df16ae0595b459ef08a5cdb05aee195ebc04b9d89a72be7fa
>>> numpy-1.15.1.tar.gz
>>>  ? # License files, locally calculated
>>>  ? sha256
>>> 9e85ee1c3f11444243c9b7667721592a01f1cd90cb28ad937ac99f6241d6b685
>>> LICENSE.txt
>>> +sha256
>>> 426a5a484480f57a295db48c2c04f47bb3274752dd82a7fd6541dfa2cb90f641
>>> doc/sphinxext/LICENSE.txt
>>> +sha256
>>> 154a8706fa0fdeff1073bf6239c4ecf51f562ab107066eef839dade1a45c824c
>>> doc/scipy-sphinx-theme/LICENSE.txt
>>> +sha256
>>> a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55
>>> numpy/linalg/lapack_lite/LICENSE.txt
>>> +sha256
>>> badf51c7e3e7de9c7630bd069780f5c197b846ef7660b342a1e58d5553592d8e
>>> tools/npy_tempita/license.txt
>>> +sha256
>>> d37526b4a34c0aa859afe6f9b7e64ca7c306b7430df8113dd5ac6fcb246bd2d4
>>> numpy/core/src/multiarray/dragon4.c
>>> diff --git a/package/python-numpy/python-numpy.mk
>>> b/package/python-numpy/python-numpy.mk
>>> index bd5fe7e6a9..72a10cfaec 100644
>>> --- a/package/python-numpy/python-numpy.mk
>>> +++ b/package/python-numpy/python-numpy.mk
>>> @@ -7,8 +7,12 @@
>>>  ? PYTHON_NUMPY_VERSION = 1.15.1
>>>  ? PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
>>>  ? PYTHON_NUMPY_SITE =
>>> https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
>>> -PYTHON_NUMPY_LICENSE = BSD-3-Clause
>>> -PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt
>>> +PYTHON_NUMPY_LICENSE = BSD-3-Clause, BSD-2-Clause, PSF, Apache-2.0,
>>> MIT, Zlib
>>> +PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt doc/sphinxext/LICENSE.txt \
>>> +??????????? doc/scipy-sphinx-theme/LICENSE.txt \
>>> +??????????? numpy/linalg/lapack_lite/LICENSE.txt \
>>> +??????????? tools/npy_tempita/license.txt \
>>> +??????????? numpy/core/src/multiarray/dragon4.c
>>>  ? PYTHON_NUMPY_SETUP_TYPE = setuptools
>>>  ? ifeq ($(BR2_PACKAGE_CLAPACK),y)
>>>
>>
>> In the meanwhile, signalled lack of:
>> - numpy/linalg/lapack_lite/LICENSE.txt
>> - tools/npy_tempita/license.txt
>>
>> to upstream:
>> https://github.com/numpy/numpy/issues/11927
>>
>> Kind regards
> 
> Kindly ping this patch for older BR versions stil using numpy 1.15.1
> 

Python-numpy has been bumped to 1.16.2 so this patch doesn't make sense 
anymore.
I set it as rejected on patchwork.

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
