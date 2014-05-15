From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 15 May 2014 23:33:26 +0200
Subject: [Buildroot] [PATCH] Add Mono native/managed package.
In-Reply-To: <20140515204520.GC3463@free.fr>
References: <1400184577-3138-1-git-send-email-angelo.compagnucci@gmail.com>
 <20140515204520.GC3463@free.fr>
Message-ID: <CA+TH9VnnYUSpfizUWZCDAvEpBqOQ0pey4KezeYEnHv-0C7L=QQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All

2014-05-15 22:45 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:

> For so few options, put them on a single line:

>    HOST_MONO_MANAGED_CONF_OPT = $(MONO_CONF_OPT) --enable-static

> Why do you need --enable-static ? Generally, for the host tools, we do
> not care that they be shared, and we do usually build them shared.

During configure Mono complains:

"configure: WARNING: Turning off static Mono is a risk"

And compilation fails somewhere.


>> +define MONO_MANAGED_GETMONOLITE
>> +     $(MAKE) -C $(@D) get-monolite-latest
>> +endef
>
> Does it mean that some downloading is done _after_ the configure step?
> Can't we do that during the download step, eg:
>
>     define MONO_MANAGED_GET_MONOLITE
>         $(call DOWNLOAD,url-of-monolite-archive)
>     endef
>     MONO_MANAGED_POST_DOWNLOAD_HOOKS += MONO_MANAGED_GET_MONOLITE
>
> Or something like that?

Mono needs a previously installed Mono or the monolite binaries to
compile. I don't want to count on users having the right mono version
previously installed on their machines, so the best way is to use
monolite. The right way to obtain the latest correct monolite version
is to use "make get-monolite-latest" before the final make.
I can extract the url where the file is located from the makefile, but
I have also to handle various unpacking steps needed to place the
monolites binaries in the correct places.
I don't think this is right, because It can break easily on newer Mono
versions and it needs some maintenance. Please let me know if it must
be done!

Ok for the other points! I will send you a new patch as soon as possible!

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
