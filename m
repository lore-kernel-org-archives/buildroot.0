From: Nimai Mahajan <nimaim@gmail.com>
Date: Fri, 18 Jul 2014 10:02:10 -0400
Subject: [Buildroot] Replace libev with libuv
In-Reply-To: <53C9220B.9060809@zacarias.com.ar>
References: <CALoSW641XSGs6H4i_q07ZfxUtRYoUMgdxBaUtus5J5C7+K=0Fw@mail.gmail.com>
 <53C91D3F.4060500@zacarias.com.ar>
 <CALoSW64Uisj3oLvPVKZ1nQXgCTEnt1yLMqV+Gy7aK4U=Q9FcUA@mail.gmail.com>
 <53C9220B.9060809@zacarias.com.ar>
Message-ID: <CALoSW6550gT0qvqgo2tbaz+_VKXy0mwAQxjmsjPV66-XaUC1VA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package works fine if on my Mint host I run ./autogen.sh, then
./configure and then make which will properly generate static (.a) and
shared libraries (.so).

If I use this kind of libuv.mk, I get errors in Buildroot:

LIBUV_VERSION = v0.11.25
LIBUV_SITE = http://libuv.org/dist/$(LIBUV_VERSION)/
LIBUV_INSTALL_STAGING = YES
LIBUV_AUTORECONF = YES

$(eval $(autotools-package))

When trying to "make libuv":

>>> libuv v0.11.25 Autoreconfiguring
aclocal: error: configure.ac:18: file
'm4/libuv-extra-automake-flags.m4' does not exist
autoreconf: /home/user/Desktop/buildroot-2014.02/output/host/usr/bin/aclocal
failed with exit status: 1
make: *** [/home/user/Desktop/buildroot-2014.02/output/build/libuv-v0.11.25/.stamp_configured]
Error 1

The problem is its not running the autogen.sh. How do I force this to
run? Is the only way still through <PKG_NAME>_POST_EXTRACT_HOOKS or
<PKG_NAME>_POST_PATCH_HOOKS?



On Fri, Jul 18, 2014 at 9:32 AM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 07/18/2014 10:30 AM, Nimai Mahajan wrote:
>
>> Already tried that and it fails to build. I will give you the exact
>> error when I am by my PC again. And you are right both libraries are for
>> different purposes, I guess it would have been more accurate to say many
>> projects can make better use of libuv than libev. I just like that libuv
>> is significantly better documented which in itself makes it more usable.
>> I am using other autogen.sh packages as a template but they all seem to
>> have their own custom hooks which is what is confusing me. Thanks for
>> the help BTW.
>
> Hi.
> Keep the list cc'ed, you've got a better chance of getting help with
> everyone rather than just me, and also other people might be interested.
> Yes please do, normally AUTORECONF is enough but there are a couple of
> difficult packages that need some extra help.
> Regards.
>
