From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Fri, 28 Aug 2020 11:12:27 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/mosquitto: bump to v1.6.11
In-Reply-To: <20200827233246.1964df63@windsurf.home>
References: <20200819120506.137013-1-titouan.christophe@railnova.eu>
 <20200827233246.1964df63@windsurf.home>
Message-ID: <b9787129-f647-623f-da4e-7729f2290f5b@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 27/08/20 23:32, Thomas Petazzoni wrote:
> On Wed, 19 Aug 2020 14:05:05 +0200
> Titouan Christophe <titouan.christophe@railnova.eu> wrote:
> 
>> diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
>> index b4effa36be..078d6ad151 100644
>> --- a/package/mosquitto/Config.in
>> +++ b/package/mosquitto/Config.in
>> @@ -1,3 +1,8 @@
>> +config BR2_PACKAGE_MOSQUITTO_WITH_THREADING
>> +	bool
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_setname_np
>> +	default y if BR2_TOOLCHAIN_HAS_THREADS
> 
> This looks awkward. Why are you not just doing:
> 
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
>   MOSQUITTO_MAKE_OPTS += WITH_THREADING=yes
>   else
>   MOSQUITTO_MAKE_OPTS += WITH_THREADING=no

The underlying idea was to "provide a config option for a package to 
depend on, if it uses the mosquitto threading API" which might indeed 
sound overkill. Plus I did not pay attention that HAS_THREADS_NPTL 
implies HAS_THREADS.

> 
> in the .mk file ?

Yes, I'll do jut that

> 
> Thomas
> 

Thank you,

Titouan
