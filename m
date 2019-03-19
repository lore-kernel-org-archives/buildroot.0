From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Mar 2019 00:18:21 +0100
Subject: [Buildroot] [RFC PATCH] package/libcamera: Add libcamera package
In-Reply-To: <940dcdca-91e1-9460-35f7-782959a7ad02@ideasonboard.com>
References: <20190319110326.15153-1-kieran.bingham@ideasonboard.com>
 <20190319125040.GA2702@scaer>
 <940dcdca-91e1-9460-35f7-782959a7ad02@ideasonboard.com>
Message-ID: <100d21c9-da59-239c-29b2-e6d5bb38106d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/03/2019 15:12, Kieran Bingham wrote:
> Hi Yann,
> 
> Thank you for the review,
> 
> On 19/03/2019 12:50, Yann E. MORIN wrote:
>> Kieran, All,
>>
>> On 2019-03-19 11:03 +0000, Kieran Bingham spake thusly:

[snip]
>>> +LIBCAMERA_SITE_METHOD = git
>>> +LIBCAMERA_DEPENDENCIES = udev

 Since this is a library, I'd expect _INSTALL_STAGING = YES.

>>> +LIBCAMERA_LICENSE = LGPL-2.0+
>>
>> This is not LGPL-2.0+, but LGPL-2.1+
> 
> Ugh, I should have remembered that, especially as I added the licenses...
> 
>>
>> There are actually 2 other licenses applicable to this package: GPLv2.0+
>> and CC-BY-SA-4.0 (or later?).
>>
>> We usually specify what part of the package they apply to (correct me
>> if/where I am wrong):
>>
>>     LIBCAMERA_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (utils, test), CC-By_SA-4.0 (doc)

 AFAIU, we only specify licenses of stuff installed on target. Since
/usr/share/doc gets removed in target-finalize, the doc license should not be
relevant.

 BTW it would be nice if there was a meson option to disable building docs. I
don't know how it is for the libcamera doc, but doxygen and sphinx are sometimes
a bit slow.

> 
> 
> That looks accurate to me.
> 
> I've updated the patch.
> 
>>
>> Please also specify the files that contain the license texts:
>>
>>     LIBCAMERA_LICENSE_FILES = \
>>         licenses/cc-by-sa-v4.0.txt \
>>         licenses/developer-certificate-of-origin.txt \
>>         licenses/gnu-gpl-2.0.txt \
>>         licenses/gnu-lgpl-2.1.txt

 Please also add hashes for these files.

 Thanks!

 Regards,
 Arnout
