From: =?UTF-8?B?0JDQu9C10LrRgdC10Lkg0JHRgNC+0LTQutC40L0=?= <alexey.brodkin@gmail.com>
Date: Tue, 19 Jan 2016 10:25:58 +0300
Subject: [Buildroot] [PATCH v4] linux-headers: allow use of headers from
 kernel "package" selected
In-Reply-To: <569D23E8.7070207@mind.be>
References: <1425230275-127768-1-git-send-email-kaszak@gmail.com>
 <20160109172908.GA3444@free.fr> <569D23E8.7070207@mind.be>
Message-ID: <CAML3pwUsT6xL2+dFNqBFou=wi92DFEo4tQP6roSe-4XJjOeOXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all

2016-01-18 20:42 GMT+03:00 Arnout Vandecappelle <arnout@mind.be>:
> On 09-01-16 18:29, Yann E. MORIN wrote:
>> Karoly, All,
>>
>> Reviving this old one that is still pending in Patchwork...
>>
>> On 2015-03-01 18:17 +0100, Karoly Kasza spake thusly:
>>> This change makes it possible to use exactly the same sources for both
>>> headers during toolchain building and for kernel building itself, even
>>> if custom kernel is selected.
>>>
>>> That way users can be sure that ABI mismatch won't happen between toolchain
>>> and kernel.
>>
>> So, I'll try to summarise what we have for now:
>>
>>   - select kernel headers version and select kernel version (separately)
>>
>>   - select kernel headers version, also used as kernel version.
>>
>> What you want to add with this patch is:
>>
>>   - select kernel version, also used as kernel headers version.
>
>  Actually, I think the main purpose of this patch is to take the same source for
> kernel-headers as you use when building the kernel. This is particularly
> important if your kernel is some wild branch that adds extra userspace stuff
> (typically, ioctl definitions, but it could also be struct definitions). Failing
> this, you have to pass a reference to LINUX_DIR to the build of the package that
> uses these symbols.
>
>  That said, it's been years since I ran into such a braindead package that
> required specific custom kernel headers. Except for some wicked Broadcom stuff,
> of course, but that probably doesn't even build with our linux.mk rules.

From my experience discussed functionality is very convenient in case kernel ABI
gets changed. Indeed and fortunately that happens quite seldom but nevertheless
it happens sometimes. And I may easily foresee such situation in the
future - just imagine
another architecture becomes 64-bit (like ARC, Microblaze, xtensa you name it).

So IMHO it's good to be prepared.

-Alexey
