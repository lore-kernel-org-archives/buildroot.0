From: Martin Bark <martin@barkynet.com>
Date: Tue, 3 May 2016 09:54:26 +0100
Subject: [Buildroot] [PATCH 3/5] package/nginx: add thread pool support
In-Reply-To: <20160501234237.2618d1a3@free-electrons.com>
References: <1462132345-28253-1-git-send-email-martin@barkynet.com>
 <1462132345-28253-3-git-send-email-martin@barkynet.com>
 <20160501234237.2618d1a3@free-electrons.com>
Message-ID: <CAFGQKxdv2YVsge73txW5L06Ym=vJMFnXMy9uWXG28MoNazw1bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 1 May 2016 at 22:42, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun,  1 May 2016 20:52:23 +0100, Martin Bark wrote:
>
>>  NGINX_CONF_OPTS += \
>> -     $(if $(BR2_PACKAGE_NGINX_FILE_AIO),--with-file-aio)
>> +     $(if $(BR2_PACKAGE_NGINX_FILE_AIO),--with-file-aio) \
>> +     $(if $(BR2_PACKAGE_NGINX_THREADS),--with-threads)
>
> Just curious, any reason to not enable this as soon as
> BR2_TOOLCHAIN_HAS_THREADS=y ?

Well it does add code so if you just want nginx as a static webserver
on an embedded device you probably don't need this.  Just for interest
there is some info on nginx thread pools here
https://www.nginx.com/blog/thread-pools-boost-performance-9x/.  I
really just added the option for completeness.

What is missing is a dependency on BR2_TOOLCHAIN_HAS_THREADS for
BR2_PACKAGE_NGINX_THREADS in the Config.in so I'll resubmit with that
fixed.

Thanks

Martin

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
