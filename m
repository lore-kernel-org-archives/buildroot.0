From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 04 Mar 2013 23:08:06 +0100
Subject: [Buildroot] [PATCH 2/2 V5] nodejs: new package
In-Reply-To: <201303042257.42979.yann.morin.1998@free.fr>
References: <1362102967-10236-1-git-send-email-daniel.price@gmail.com>
 <20130304221946.6c6d62cd@skate> <201303042257.42979.yann.morin.1998@free.fr>
Message-ID: <51351B46.2070704@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN wrote:
> Daniel, Thomas, Luca, All,
>
> On Monday 04 March 2013 Thomas Petazzoni wrote:
>> On Thu, 28 Feb 2013 17:56:07 -0800, Daniel Price wrote:
> [--SNIP--]
>>> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
>>> new file mode 100644
>>> index 0000000..b30fcd4
>>> --- /dev/null
>>> +++ b/package/nodejs/nodejs.mk
>>> @@ -0,0 +1,109 @@
>>> +#############################################################
>>> +#
>>> +# nodejs
>>> +#
>>> +#############################################################
>>> +
>>> +NODEJS_VERSION = 0.8.21
>>> +NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
>>> +NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>>> +NODEJS_DEPENDENCIES = host-python host-nodejs \
>>> +    $(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
>>> +HOST_NODEJS_DEPENDENCIES = host-python
>>> +NODEJS_LICENSE = MIT
>> Please add:
>>
>> NODEJS_LICENSE_FILES = LICENSE
>>
>> That said, as the LICENSE file explains, nodejs source code includes
>> some code from various other projects, under other licenses. Maybe the
>> licensing experts should tell us what value NODEJS_LICENSE should have
>> here. Yann? Luca? See
>> https://github.com/joyent/node/blob/master/LICENSE if you don't want to
>> download the whole nodejs source code.
> First: I am not an authoritative licensing expert.

Neither me...

> What I would state would be something like:
>
> NODEJS_LICENSE = MIT (core code); non-copyleft BSD-like (bundled libraries)
>
> In any case, I'd leave it to the user (or his/her legal department) to sort
> out the exact licensing terms by looking at the LICENSE file, which as Thomas
> mentionned, shall be referenced by the NODEJS_LICENSE_FILES variable.
>
> IIRC, the licensing infrastrucutre in Buildroot is not meant to be
> authoritative, and should be regarded by the user only as a guide.

I fully agree with Yann.

It is very important that Buildroot does not present the license in a
simplified way. The user should not think the license is MIT when it is 
instead
MIT and something else.

The ideal license description should be correct, concise and complete. 
When it is
not possible (such as in this case), it should be correct and concise, 
although
unavoidably incomplete.

So, I would to the least write:

NODEJS_LICENSE = MIT and others
but Yann's proposal is much more informative.


Luca
