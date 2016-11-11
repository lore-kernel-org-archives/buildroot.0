From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 11 Nov 2016 14:11:00 +0100
Subject: [Buildroot] [PATCH] olimex_a20_olinuxino_lime_mali: bump kernel
In-Reply-To: <20161109223918.554ee69e@free-electrons.com>
References: <1478474048-19255-1-git-send-email-francois.perrad@gadz.org>
 <20161109223918.554ee69e@free-electrons.com>
Message-ID: <CAB0FRssE2zMVUyEd3w9yW1k2WrUPbJfsVfvOAFPE8VuCQeHXxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-11-09 22:39 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Mon,  7 Nov 2016 00:14:08 +0100, Francois Perrad wrote:
>
>>  BR2_LINUX_KERNEL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux-sunxi,linux-sunxi,sunxi-v3.4.103-r1)/sunxi-v3.4.103-r1.tar.gz"
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/dan-and/linux-sunxi.git"
>> +# based on Linux version 3.4.113
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="dbabbacbbf8984dea0a8c893b38b376a6ecbb3c1"
>
> I really dislike using random git trees instead of more officially
> recognized ones. There are really no branches/tags in the linux-sunxi
> repository that work with gcc 5.x for this board?
>

On https://github.com/linux-sunxi/linux-sunxi:
- branch sunxi-3.4 : no tag since 2014
- branch sunxi-next : active, currently synchronized with 4.9-rc4, no
tag, and no Mali support

https://github.com/dan-and/linux-sunxi is referenced in
https://linux-sunxi.org/Linux#External_links . The maintenance of
sunxi-3.4 is here now.

AFAIK, there is no alternative.

Fran?ois

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
