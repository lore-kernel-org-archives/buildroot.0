From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 1 Nov 2007 18:56:26 -0200
Subject: [Buildroot] undefined reference to `_dl_app_init_array'
In-Reply-To: <000801c81c6c$97cf73a0$cd10da91@w1613amsl>
References: <000801c81c6c$97cf73a0$cd10da91@w1613amsl>
Message-ID: <d6cda7730711011356x5904afct3b8eab74bb5916fe@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had the same thing both on my application and on libjpeg on AVR32.
No idea what's wrong :(

Unfortunally I couldn't investigate it further (i'm working on a
project that is already late), I'm sticking with a previously working
revision.

On 11/1/07, Taylan Develioglu - DSV <taylan.develioglu@nl.dsv.com> wrote:
>
>
>
>
> Hi all,
>
>
>
> Something is wrong with a toolchain I recently built with buildroot:
>
>
>
> To illustrate trying to compile:
>
>
>
> main ()
>
> {
>
>   return 0;
>
> }
>
>
>
> Fails with:
>
>
>
> /lib/libc.so.0: undefined reference to `_dl_app_init_array'
>
> /lib/libc.so.0: undefined reference to `_dl_app_fini_array'
>
> collect2: ld returned 1 exit status
>
>
>
> ldd tells me ld-uClibc-0.9.29.so is not a dynamic executable.
>
>
>
> Buildroot used was snapshot 20071024
>
>
>
> Anyone have any idea why this is happening? All binaries linked to it are
> functioning fine, so apparently the library does have the function, making
> me think this is a linker issue.
>
>
>
> Regards,
>
>
>
> Taylan
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
