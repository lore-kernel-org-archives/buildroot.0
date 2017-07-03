From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Jul 2017 18:50:35 +0200
Subject: [Buildroot] [PATCH] libusb-compat: fix a build issue with
 undefined PATH_MAX
In-Reply-To: <2c1faeab-92de-d158-442e-8ee89965d4cc@mind.be>
References: <1499091412-26839-1-git-send-email-brgl@bgdev.pl>
 <8b198702-d118-0dc0-fe5b-7f56d5145c47@mind.be>
 <2c1faeab-92de-d158-442e-8ee89965d4cc@mind.be>
Message-ID: <CAMRc=Me7p+5rw2tUWK1vkgrm0YPL-=swtSE87c60t3dOSvUOyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-07-03 17:48 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>
>
> On 03-07-17 17:11, Arnout Vandecappelle wrote:
>>  Hi Bartosz,
>>
>> On 03-07-17 16:16, Bartosz Golaszewski wrote:
>>> libsigrok build failed because of PATH_MAX not being defined in usb.h.
>>> On linux it is defined in linux/limits.h, but usb.h only includes
>>> limit.h. Add a patch fixing the header in libusb-compat.
>>
>>  This doesn't sound right: according to POSIX [1], limits.h should define
>> PATH_MAX. And indeed, if you do
>>
>> echo '#include <usb.h>' | host/usr/bin/x86_64-amd-linux-gnu-gcc -x c -E -
>>
>> you'll see that PATH_MAX gets properly expanded to 4096. So something else is
>> going on.
>
>  OK so I investigated a little more, and it turns out that -std=c99 is the
> culprit. And apparently people on the 'net are advising to use linux/limits.h to
> get at PATH_MAX. So perhaps this is the right approach after all.
>
>  What's the upstream status of this patch?
>
>  Regards,
>  Arnout

Submitted, no answer yet.

Thanks,
Bartosz
