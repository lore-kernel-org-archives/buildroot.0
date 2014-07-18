From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 18 Jul 2014 17:26:00 -0300
Subject: [Buildroot] Replace libev with libuv
In-Reply-To: <CALoSW6550gT0qvqgo2tbaz+_VKXy0mwAQxjmsjPV66-XaUC1VA@mail.gmail.com>
References: <CALoSW641XSGs6H4i_q07ZfxUtRYoUMgdxBaUtus5J5C7+K=0Fw@mail.gmail.com>
 <53C91D3F.4060500@zacarias.com.ar>
 <CALoSW64Uisj3oLvPVKZ1nQXgCTEnt1yLMqV+Gy7aK4U=Q9FcUA@mail.gmail.com>
 <53C9220B.9060809@zacarias.com.ar>
 <CALoSW6550gT0qvqgo2tbaz+_VKXy0mwAQxjmsjPV66-XaUC1VA@mail.gmail.com>
Message-ID: <53C982D8.7070006@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/18/2014 11:02 AM, Nimai Mahajan wrote:

>>>> libuv v0.11.25 Autoreconfiguring
> aclocal: error: configure.ac:18: file
> 'm4/libuv-extra-automake-flags.m4' does not exist
> autoreconf: /home/user/Desktop/buildroot-2014.02/output/host/usr/bin/aclocal
> failed with exit status: 1
> make: *** [/home/user/Desktop/buildroot-2014.02/output/build/libuv-v0.11.25/.stamp_configured]
> Error 1
> 
> The problem is its not running the autogen.sh. How do I force this to
> run? Is the only way still through <PKG_NAME>_POST_EXTRACT_HOOKS or
> <PKG_NAME>_POST_PATCH_HOOKS?

I've just sent a patch to the list to add libuv.
Basically autogen.sh is doing a dirty deed, so i've added that in a
POST_PATCH_HOOK instead of running autogen.sh - we really want to avoid
doing so as much as possible.
Regards.
