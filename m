From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 17 Mar 2015 21:21:42 +0100
Subject: [Buildroot] [PATCH v2 3/4] package/avrdude: depends on libftdi1
 instead of libftdi
In-Reply-To: <20150317210651.11bf1534@free-electrons.com>
References: <1425813964-5295-1-git-send-email-s.martin49@gmail.com>
 <1425813964-5295-4-git-send-email-s.martin49@gmail.com>
 <20150308114842.GB2518@tarshish>
 <CAHXCMMJ30MEE33mytg4xy9pZePD0Z+ezH8pJE6wzhaqJWdkyGg@mail.gmail.com>
 <20150316141523.2561f737@free-electrons.com>
 <CAHXCMM+52vee+K8p=KOonr=d+F4M7bk-5zWMG2Q2ghmGyWTKLA@mail.gmail.com>
 <20150317174836.6384db5a@free-electrons.com>
 <CAHXCMMJWtxrVB2nai6V7y_-5ijr5zpXpNBS=G9LbtbBfDrLd4g@mail.gmail.com>
 <20150317210651.11bf1534@free-electrons.com>
Message-ID: <CAHXCMM+WFkwdr_T7TuFMn+JNKytNmP3i5Lh6U6Z8VRwjzZfS5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Mar 17, 2015 at 9:06 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Tue, 17 Mar 2015 18:25:52 +0100, Samuel Martin wrote:
>
>> Nope, the behavior is not undefined: if libftdi gets built before
>> arvdude, libftdi1 will also be built before avrdude (because it's one
>> of its deps,)
>
> Hum, I don't follow you here. I don't see where libftdi depends on
> libftdi1.

doh! i think we are misunderstanding each others... :-|

>
> What prevents from doing a configuration that has libftdi and avrdude
> enabled, and not libftdi1 ?

nothing at all, this still is a legit config.

>
> Apparently nothing:
>
> $ grep -E "(LIBFTDI|LIBFTDI1|AVRDUDE)" .config
> BR2_PACKAGE_AVRDUDE=y
> BR2_PACKAGE_LIBFTDI=y
> # BR2_PACKAGE_LIBFTDI1 is not set
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Regards,

-- 
Samuel
