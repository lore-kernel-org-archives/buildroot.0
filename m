From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 29 Dec 2016 17:04:51 +0100
Subject: [Buildroot] [PATCH] eudev: build with older kernels.
In-Reply-To: <CAPdpN3Bvppz53OvvXygtLC=4amXL7V54WqO0QjCZgbtCj-pa=A@mail.gmail.com>
References: <20161229144649.29850-1-barbieri@profusion.mobi>
 <53d19a79-a06e-df52-ae4f-1bc0decb7e0c@gmail.com>
 <CAPdpN3Bvppz53OvvXygtLC=4amXL7V54WqO0QjCZgbtCj-pa=A@mail.gmail.com>
Message-ID: <d63de13a-18e1-1f5a-4dba-33e55d879ef3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 29/12/2016 ? 17:01, Gustavo Sverzut Barbieri a ?crit :
> On Thu, Dec 29, 2016 at 1:51 PM, Romain Naour <romain.naour@gmail.com> wrote:
>> Hi Gustavo,
>>
>> Le 29/12/2016 ? 15:46, Gustavo Sverzut Barbieri a ?crit :
>>> Add missing defines so eudev builds for older kernels such as 2.6
>>
>> Can you summit this patch to eudev upstream ?
> 
> I will try, but not sure they bother with ancient 2.6 kernels like the
> one I need :-D

Well, if it's just two defines...

> 
> 
>>> Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
>>> ---
>>>  package/eudev/0002-missing-defines-for-old-kernels.patch | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>  create mode 100644 package/eudev/0002-missing-defines-for-old-kernels.patch
>>>
>>> diff --git a/package/eudev/0002-missing-defines-for-old-kernels.patch b/package/eudev/0002-missing-defines-for-old-kernels.patch
>>> new file mode 100644
>>> index 000000000..d34020f04
>>> --- /dev/null
>>> +++ b/package/eudev/0002-missing-defines-for-old-kernels.patch
>>> @@ -0,0 +1,16 @@
>>> +--- a/src/udev/udev-builtin-input_id.c       2016-12-23 16:43:55.398985478 +0000
>>> ++++ b/src/udev/udev-builtin-input_id.c       2016-12-23 16:48:40.907182701 +0000
>>
>> missing patch description and SoB line.
>> I guess it should be the same as above.
> 
> will submit a new one with these

ok

> 
> 
>>> +@@ -33,6 +33,13 @@
>>> + #include "udev.h"
>>> + #include "util.h"
>>> +
>>> ++#ifndef BTN_TRIGGER_HAPPY
>>> ++#define BTN_TRIGGER_HAPPY 0x2c0
>>> ++#endif
>>> ++#ifndef INPUT_PROP_MAX
>>> ++#define INPUT_PROP_MAX 0x1f
>>> ++#endif
>>
>> Otherwise these values seems correct.
>> Reviewed-by: Romain Naour <romain.naour@gmail.com>

Don't forget my tag in v2 ;)

Romain

>>
>> Best regards,
>> Romain
>>
>>> ++
>>> + /* we must use this kernel-compatible implementation */
>>> + #define BITS_PER_LONG (sizeof(unsigned long) * 8)
>>> + #define NBITS(x) ((((x)-1)/BITS_PER_LONG)+1)
>>>
>>
> 
> 
> 
