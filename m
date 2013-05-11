From: Anders Darander <anders.darander@gmail.com>
Date: Sat, 11 May 2013 14:41:37 +0200
Subject: [Buildroot] [PATCH 1/5] beaglebone: update to linux 3.8
In-Reply-To: <518DE0EF.8060500@mind.be>
References: <CAE4k2391Ku1Oi+2ACCetmvr5dO8JBygv_hNTM18BchAbdBA3DA@mail.gmail.com>
 <518DE0EF.8060500@mind.be>
Message-ID: <CAE4k238zVSi9eW5Ctfb9LWCt8r9xYv5cSZ=FfJVg1NT0tjGpoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11 May 2013 08:10, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 11/05/13 06:37, Anders Darander wrote:
>
>> Hi Arnout,
>>
>> (Resending as I first sent from an unsubcribed email).
>>
>
>  Yeah, the subscribed-only sending can get annoying.
>
>  BTW your re-sending lost the in-reply-to headers, which is unfortunate.


Yes, that wan unfortunate side effect... (I was handling that mail from a
tablet, thus I was lacking a proper e-mail client for my work e-mail).
However, that e-mail is now subscribed, though without e-mail deliveries...
Hopefully the best of both worlds!


> Arnout Vandecappelle <arnout at mind.be <mailto:arnout@mind.be>> wrote:
>>  >On 09/05/13 22:31, Anders Darander wrote:
>>  >> From: Anders Darander <anders@chargestorm.se
>> <mailto:anders@chargestorm.se>**>
>>
>>  >> diff --git a/configs/beaglebone_defconfig
>>  >b/configs/beaglebone_**defconfig
>>  >> index 2177068..f80dd79 100644
>>  >> --- a/configs/beaglebone_defconfig
>>  >> +++ b/configs/beaglebone_defconfig
>>  >> @@ -1,24 +1,14 @@
>>  >> -# architecture
>>  >>   BR2_arm=y
>>  >>   BR2_cortex_a8=y
>>  >> +BR2_KERNEL_HEADERS_3_8=y
>>  >>   BR2_EXTRA_GCC_CONFIG_OPTIONS="**--with-fpu=vfpv3 --with-float=hard"
>>  >>   # BR2_SOFT_FLOAT is not set
>>  >> -
>>  >> -# system
>>  >
>>  >Please don't remove these comments, they're useful. You can selectively
>>
>> Ok, then I guess that I should keep the old ordering, even though
>> savedefconfig have reordered some of them.?
>>
>
>  No, the new ordering is good - I do prefer to see things in the 'make
> savedefconfig' order.
>

Ok, good to know. Though I decided to keep the old version of those line,
and  lock the kernel headers. Though, I'd also prefer to keep the
savedefconfig ordering.

Adding those comments automatically might be a good exercise for a rainy
day...


 >undo changes with 'git checkout -p configs/beaglebone_defconfig'.
>>  >
>>
>>  >>   BR2_LINUX_KERNEL=y
>>  >>   BR2_LINUX_KERNEL_CUSTOM_GIT=y
>>  >>
>>  >-BR2_LINUX_KERNEL_CUSTOM_GIT_**REPO_URL="git://github.com/**
>> koenkooi/linux.git <http://github.com/koenkooi/linux.git> <
>> http://github.com/koenkooi/**linux.git<http://github.com/koenkooi/linux.git>
>> >"
>>  >>
>>  >-BR2_LINUX_KERNEL_CUSTOM_GIT_**VERSION="linux-ti33x-psp-3.2-**r5a+**
>> gitr09e9651bcf2ee8d86685f2a807**5bc6557b1d3b91"
>>  >>
>>  >+BR2_LINUX_KERNEL_CUSTOM_GIT_**REPO_URL="git://git.ti.com/ti-**
>> linux-kernel/ti-linux-kernel.**git<http://git.ti.com/ti-linux-kernel/ti-linux-kernel.git><
>> http://git.ti.com/ti-linux-**kernel/ti-linux-kernel.git<http://git.ti.com/ti-linux-kernel/ti-linux-kernel.git>
>> >"
>>
>>  >>
>>  >+BR2_LINUX_KERNEL_CUSTOM_GIT_**VERSION="**
>> 935f6c2f82056d538b528272e2bdbb**5c08d69a58"
>>  >
>>  >Isn't there a tag you can clone from? That's much faster, because then
>>  >we can (usually) do a shallow clone.
>>
>> I'm not sure if there's a tag available in this case.
>>
>
Unfortunsately no tags exists...


> Ok, so tags preferred if they exists... Good to know, I'll check it and
>> change it if there's a tag.
>>
>> The list few years I've mainly been working with another build system,
>> where SHA1's are preferred over tags for network-less building.
>>
>
>  Do you know if there's a specific reason for that? The 'network-less'
> doesn't make a difference because the tags are always equally available,
> unless you clone/fetch with --no-tags.
>

Well, I just looked into it, and it seems that they (openmbedded and thus
Yocto Project) uses `git ls-remote` to resolve the tag name. I'm not quite
sure of the rationaly for that, though...

Cheers,
Anders
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130511/1183f20c/attachment-0001.html>
