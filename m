From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 5 Jan 2017 23:29:44 +0100
Subject: [Buildroot] [PATCH] SDL2 depends on MMU (fork)
In-Reply-To: <20170105114235.xdt33mh3lx3icynt@sapphire.tkos.co.il>
References: <1483609518-7756-1-git-send-email-guillaume.gardet@oliseo.fr>
 <20170105114235.xdt33mh3lx3icynt@sapphire.tkos.co.il>
Message-ID: <9f85b175-5e2e-7b7d-e1df-4ea7ce1ea334@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillaume,

Le 05/01/2017 ? 12:42, Baruch Siach a ?crit :
> Hi Guillaume,
> 
> On Thu, Jan 05, 2017 at 10:45:18AM +0100, Guillaume GARDET wrote:
>> Fixes autobuilder failure http://autobuild.buildroot.net/results/2f7/2f738830bf98eb7284f99c11856a8694467b3daa
>>
>> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
>> ---
>>  package/sdl2/Config.in | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
>> index b73611d..30d5c1a 100644
>> --- a/package/sdl2/Config.in
>> +++ b/package/sdl2/Config.in
>> @@ -1,6 +1,7 @@
>>  config BR2_PACKAGE_SDL2
>>  	bool "sdl2"
>>  	depends on !BR2_STATIC_LIBS
>> +	depends on BR2_USE_MMU # fork()

It's actually BR2_PACKAGE_SDL2_X11 option that use fork().
If you disable it, SDL2 package build fine with this configuration.

Best regards,
Romain

> 
> You need to propagate this dependency to config symbols that select 
> BR2_PACKAGE_SDL2, BR2_PACKAGE_FFMPEG_FFPLAY and BR2_PACKAGE_STELLA. See 
> section 17.2.3 in the manual[1] for an explanation.
> 
> [1] http://nightly.buildroot.org/manual.html#_config_files
> 
>>  	help
>>  	  Simple DirectMedia Layer 2 - SDL2 is a library that allows
>>  	  programs portable low level access to a video framebuffer,
> 
> baruch
> 
