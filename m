From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Mon, 21 Nov 2016 17:04:57 -0800
Subject: [Buildroot] auto-detecting toolchain metadata?
In-Reply-To: <20161101184626.GB30593@free.fr>
References: <c1d1dc6d-c815-1ea2-3de9-13a1da0adaec@mentor.com>
 <20161101184626.GB30593@free.fr>
Message-ID: <6e24245a-9c73-ea34-e899-f19f16346d0e@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/01/2016 11:46 AM, Yann E. MORIN wrote:
> But if there was a script that would look at a toolchain and spit out
> the settings, like:
>
>      ./support/scripts/scan-ext-toolchain /path/to/toolchain
>      BR2_USES_MUSL=y
>      BR2_GCC_ATLEAST_4_9=y
>      [and so on]
>
> with that output to be used as a base defconfig, then that would be
> tremendously useful, indeed.
My use case is slightly different; I already have a defconfig; I just 
want this script to replace the toolchain-related bits of it. Would 
editing defconfig "in place" (e.g. create .defconfig.new, copy it over 
the original) be acceptable?
> And probably not very dificult to do either...
Here's one complexity: once we know the version, which GCC_AT_LEAST_X_Y 
should be emitted? (Probably the same question for the other "AT_LEAST" 
variables too.)

We could make a new list that matches toolchain/toolchain-common.in, but 
that will undoubtedly lead to mismatches in the future...

We could just auto generate every major/minor version from 4.0 up to 
<toolchain version>, but then how many minors for each major? 10? That 
would yield 4.0 -> 4.10, 5.0 -> 5.10, 6.0 -> 6.10, ...

-- 
Hollis Blanchard <hollis_blanchard@mentor.com>
Mentor Graphics Emulation Division
