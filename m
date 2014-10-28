From: =?UTF-8?B?0JDQu9C10LrRgdC10Lkg0JHRgNC+0LTQutC40L0=?= <alexey.brodkin@gmail.com>
Date: Tue, 28 Oct 2014 19:30:52 +0400
Subject: [Buildroot] [PATCH 1/1] linux-headers: allow use of headers
 from kernel "package" selected
In-Reply-To: <1414503211-38141-1-git-send-email-kaszak@gmail.com>
References: <1414503211-38141-1-git-send-email-kaszak@gmail.com>
Message-ID: <CAML3pwUizupHKUZf9wC4G+H6tm=q1VjXa6KVccdz6NO1TU1tUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Karoly,

2014-10-28 16:33 GMT+03:00 Karoly Kasza <kaszak@gmail.com>:
> This change makes it possible to use exactly the same sources for both
> headers during toolchain building and for kernel building itself, even
> if custom kernel is selected.
>
> That way user might be sure that ABI mismatch won't happen between toolchain
> and kernel.
>
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>
> Changes v2 -> v3:
>   - Forbid KERNEL_SAME_AS_HEADERS w/ HEADERS_SAME_AS_KERNEL
>   - Made the calculation of LINUX_ variables to be a subroutine,
>     which can be called compulsorily when needed
>
>  linux/Config.in                        |    1 +
>  linux/linux.mk                         |    7 +++++++
>  package/linux-headers/Config.in.host   |   14 ++++++++++++--
>  package/linux-headers/linux-headers.mk |    9 +++++++++
>  4 files changed, 29 insertions(+), 2 deletions(-)

For me this one looks good. Solution with dedicated function for
calculation of variables works and looks much better than duplicated
code.

I tried it and indeed it worked flawlessly.

So let's wait for comments from others.

-Alexey
