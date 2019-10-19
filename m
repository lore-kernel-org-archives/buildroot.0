From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Oct 2019 22:20:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-dialog: bump to version
 3.4.0
In-Reply-To: <CALFsTFW3VTsf+SMRk9RqZGk46O81dH5g0AOOV_G_dR5XAZW=ew@mail.gmail.com>
References: <20191019182127.16345-1-asafka7@gmail.com>
 <a6b8e6ee-2cc1-07df-ef93-863c08a4f915@mind.be>
 <CALFsTFW3VTsf+SMRk9RqZGk46O81dH5g0AOOV_G_dR5XAZW=ew@mail.gmail.com>
Message-ID: <6d88c380-04e8-e632-fdd2-c5c8ea5b323d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/10/2019 21:53, Asaf Kahlon wrote:
> Hello,
> 
> On Sat, Oct 19, 2019 at 9:25 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 19/10/2019 20:21, Asaf Kahlon wrote:
>>> * Take tarball from PyPI.
>>> * Add hash for license file.
>>>
>>> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
>>> ---
>>>  package/python-dialog/python-dialog.hash | 7 +++++--
>>>  package/python-dialog/python-dialog.mk   | 6 +++---
>>>  2 files changed, 8 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/package/python-dialog/python-dialog.hash b/package/python-dialog/python-dialog.hash
>>> index 3cf0eaa3d6..6a88ad32d0 100644
>>> --- a/package/python-dialog/python-dialog.hash
>>> +++ b/package/python-dialog/python-dialog.hash
>>> @@ -1,2 +1,5 @@
>>> -# Locally computed:
>>> -sha256  58466c2f897ef761716b811ff74e035979b5ecefb529ba004b12db117a0f4581  python2-pythondialog-3.0.1.tar.bz2
>>> +# md5, sha256 from https://pypi.org/pypi/python2-pythondialog/json
>>> +md5  554d611d435dcc072132586c1cb37ca5  python2-pythondialog-3.4.0.tar.gz
>>> +sha256       a96d9cea9a371b5002b5575d1ec351233112519268d382ba6f3582323b3d1335  python2-pythondialog-3.4.0.tar.gz
>>> +# Locally computed sha256 checksums
>>> +sha256       a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
>>> diff --git a/package/python-dialog/python-dialog.mk b/package/python-dialog/python-dialog.mk
>>> index 01bcb760da..3408738356 100644
>>> --- a/package/python-dialog/python-dialog.mk
>>> +++ b/package/python-dialog/python-dialog.mk
>>> @@ -4,9 +4,9 @@
>>>  #
>>>  ################################################################################
>>>
>>> -PYTHON_DIALOG_VERSION = 3.0.1
>>> -PYTHON_DIALOG_SOURCE = python2-pythondialog-$(PYTHON_DIALOG_VERSION).tar.bz2
>>> -PYTHON_DIALOG_SITE = http://downloads.sourceforge.net/project/pythondialog/pythondialog/$(PYTHON_DIALOG_VERSION)
>>
>>  I think we prefer to keep the .bz2 download from sourceforge. It even has a
>> .asc file against which you can check the hash.
> 
> I can do that but pay attention that the .asc file doesn't contain any
> hashes, but PGP signature.

 Yes, the idea is to check the tarball with PGP (and the signature with a public
key you fetch from a keyserver), and mention that in the .hash file. Like e.g.
bind.hash:

# Verified from https://ftp.isc.org/isc/bind9/9.11.10/bind-9.11.10.tar.gz.asc
# with key 156890685EA0DF6A1371EF2017CC5DB1F0088407
sha256 b2bb840cda20e6771ae8c054007b4ec12e1bb6aa6bfe79102890eb94956a70c3
bind-9.11.10.tar.gz

> Anyway, you can see the hashes on the site too, but it contains only
> md5 and sha1, so sha256 has to be computed locally. And the URL
> contains the version itself :(
> This way or another, the requested change can be done, but I'm curious
> to know why bz2 is preferred? Or why sourceforge is preferred over
> PyPI for this package?

 bz2 is preferred because it's smaller. Not by much, I'll admit.

 sourceforge is not preferred, but sourceforge has the .asc.

> By the way, the .bz2 file can be also downloaded from PyPI.

 That would be good to. Note that it's also OK to get the .bz2 from PyPI but the
.asc from sourceforge.

 I just wondered whether there was any particular reason to go away from
sourceforge, and it didn't look like there was.


 Regards,
 Arnout

> 
>>
>>  Regards,
>>  Arnout
>>
>>> +PYTHON_DIALOG_VERSION = 3.4.0
>>> +PYTHON_DIALOG_SOURCE = python2-pythondialog-$(PYTHON_DIALOG_VERSION).tar.gz
>>> +PYTHON_DIALOG_SITE = https://files.pythonhosted.org/packages/26/34/b4cf8018dbc51e8a0fae2c51a0dd2c1f34419caa9e3eb83646c73d1beb9d
>>>  PYTHON_DIALOG_LICENSE = LGPL-2.1+
>>>  PYTHON_DIALOG_LICENSE_FILES = COPYING
>>>  PYTHON_DIALOG_SETUP_TYPE = distutils
>>>
> 
> Thanks.
> Asaf.
> 
