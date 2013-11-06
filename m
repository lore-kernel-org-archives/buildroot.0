From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 6 Nov 2013 14:28:21 +0000
Subject: [Buildroot] [PATCH v2] connman: disable on avr32
In-Reply-To: <CAAXf6LUdSVF8SMyZ5J=udYB_XSrWgZqOu97zWZ1X2z42Cc3H2A@mail.gmail.com>
References: <1383743283-13069-1-git-send-email-spdawson@gmail.com>
 <CAAXf6LUdSVF8SMyZ5J=udYB_XSrWgZqOu97zWZ1X2z42Cc3H2A@mail.gmail.com>
Message-ID: <CAHt8ZCMtYARyYxiUMwbPag5RMx7xBM=LQA9VkqHm9V5639tmUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 6 November 2013 14:26, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> In my patches
> http://patchwork.ozlabs.org/patch/288125/
> http://patchwork.ozlabs.org/patch/288250/
>
> I have used two separate depends on statements, to separate the base
> dependencies (that are common for the comment and its corresponding
> config) from the toolchain options (that are the inverse on the
> comment compared to the config option).
>
> So in case of connman this would be:
> comment "connman needs a toolchain w/ IPv6, wchar, threads, resolver"
>        depends on !BR2_avr32
>        depends on BR2_UCLIBC_VERSION_0_9_32 || \
>                !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS

Okay. Thanks for the feedback; will fix my patch and resubmit.

Simon.
