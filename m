From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 10 Feb 2013 16:10:45 +0100
Subject: [Buildroot] [PATCH] package/rpi-userland: update to fix
 no-longer applying patch
In-Reply-To: <5117B3FB.1010401@je-eigen-domein.nl>
References: <1360497506-31282-1-git-send-email-yann.morin.1998@free.fr>
 <51179F8D.6050800@je-eigen-domein.nl>
 <CAGduivzJBf_OzuFce2Ym_yFpSx9RWLzOXvhLRPjfXrQU8NgZmQ@mail.gmail.com>
 <5117B3FB.1010401@je-eigen-domein.nl>
Message-ID: <CAHXCMML7-7p5+iTCAn_9OPZfYp141re-Hx21JLCizNzsdER1dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

2013/2/10 Floris Bos <bos@je-eigen-domein.nl>:
> On 02/10/2013 03:14 PM, Maxime Hadjinlian wrote:
>>
>> On Sun, Feb 10, 2013 at 2:24 PM, Floris Bos <bos@je-eigen-domein.nl>
>> wrote:
>>>
>>> On 02/10/2013 12:58 PM, Yann E. MORIN wrote:
>>>>
>>>> Our patches do not apply as-is against the version of rpi-userland we
>>>> package (weird...).
>>>
>>>
>>> RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/master
>>>
>>> Shouldn't that be something like this?
>>>
>>> RPI_USERLAND_SITE =
>>> http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)
>>>
>> You are using the version variable only if the projects has tag, which
>> this one hasn't.
>> Then, you are forced to use sha1 version, then you give the branch
>> where this sha1 can be found.
>> As specified in the doc :
>>
>> http://buildroot.uclibc.org/downloads/manual/manual.html#github-download-url
>
>
> Documentation is incorrect/outdated.
>
> Github only looks at the folder name, ignores the filename, and will
> redirect you to
> https://nodeload.github.com/raspberrypi/userland/legacy.tar.gz/master
>
[...]
>
> With
> "RPI_USERLAND_SITE=http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)"
> it does work:
[...]

Fair enough.
Care to fix/update the doc?

Also, rpi-userland is not the only package fetched from github...
So patches for all other potentially broken packages will be welcome as well.

Regards,

-- 
Samuel
