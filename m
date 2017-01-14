From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sat, 14 Jan 2017 20:29:20 +0100
Subject: [Buildroot] host-nodejs build error
In-Reply-To: <c9c921dd-10be-6116-eabc-0c5aecb27ded@zonque.org>
References: <d3aef230-deff-d2e5-ac94-4d09e2d1f7d5@gmail.com>
 <94b39784-d710-99ac-f65c-41e4d26ed4fc@zonque.org>
 <4af28c7c-8c20-f3f6-adb0-c9520f249af2@gmail.com>
 <c9c921dd-10be-6116-eabc-0c5aecb27ded@zonque.org>
Message-ID: <bdfe9973-1294-94a1-afc5-3b365267a4d9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Daniel,

On 01/14/2017 08:13 PM, Daniel Mack wrote:
> Hi,
>
> On 01/14/2017 07:47 PM, Zoltan Gyarmati wrote:
>> On 01/14/2017 05:42 PM, Daniel Mack wrote:
>>> On 01/14/2017 05:15 PM, Zoltan Gyarmati wrote:
>>>> i'm trying to build nodejs (with the current Buildroot master), and when
>>>> icu is enabled, the build of host-nodejs fails with:
>>>>
>>>> Did anybody see this issue before? My guess now is that adding
>>>> '--with-intl=none' to the host-node config flags would solve this (as
>>>> according to my current understanding, the i18n support not actually
>>>> used in the host nodejs), but i still have run a test build...
>>> I have the same issue, and fixed it in my local tree by dropping
>>> --shared-zlib from package/nodejs/nodejs.mk. I didn't post a patch yet
>>> because I don't really understand the root cause and I had no time yet
>>> to investigate.
>>>
>>> [My rough guess was that this has to do with cyclic dependencies and the
>>> linker picking up the objects in the wrong order. After all, the object
>>> it complains about is present in the archive, and the removal of
>>> --shared-zlib fixes the issue by accident. But I might be wrong.]
>>>
>>> Could you try if that helps your build as well?
>> indeed, removing  --shared-zlib fixes (or at least works around) the
>> issue, but on the other hand with '--with-intl=none' the host-nodejs
>> also builds properly.
>>
>> Actually I think adding the '--with-intl=none' is a better solution (as
>> it's explicitly targeting the issue and also saves some build time)
>> unless we find a proof that the host-nodejs needs the i18n support.
>> Could you please also test this on your build config?
> Yes, confirmed. This is another way of making the build succeed.
>
> Do you want to provide a patch for that?
>
>
>
> Thanks,
> Daniel
>

thx for the feedback! Yes, i'm going to send a patch soon.

Regards

Zoltan Gyarmati
https://zgyarmati.de


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170114/3f79f2d9/attachment.asc>
