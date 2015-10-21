From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 21 Oct 2015 23:09:58 +0200
Subject: [Buildroot] [PATCH V4] sdl2: new package
In-Reply-To: <5627FBE0.5010004@openwide.fr>
References: <20151019134532.GA12643@laptop-vstehle>
 <5627FBE0.5010004@openwide.fr>
Message-ID: <5627FF26.40805@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent, All,

Le 21/10/2015 22:56, Romain Naour a ?crit :
> Hi Vincent, All,
>>
>> While trying v5 of the path recently, as found in buildroot patchwork, I
>> needed to add the following line to sdl2.mk:
>>
>> 	SDL2_CONFIG_SCRIPTS = sdl2-config
>>
>> Without this line, the include path returned by `sdl2-config --cflags`
>> will be something like /usr/include/SDL2, instead of pointing to the
>> buildroot staging dir.
>>

I confirm there is a poisoned path returned by this script:

sdl2-config --cflags
-I/usr/include/SDL2
-I/home/naourr/buildroot/test/efl-1.15.2-v2/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include
-D_REENTRANT

sdl2-config --libs
-L/usr/lib -lSDL2 -lpthread

And thanks to your fix:

sdl2-config --cflags
-I/home/naourr/buildroot/test/efl-1.15.2-v2/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include/SDL2
-I/home/naourr/buildroot/test/efl-1.15.2-v2/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include
-D_REENTRANT

sdl2-config --libs
-L/home/naourr/buildroot/test/efl-1.15.2-v2/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib
-lSDL2 -lpthread

Good catch !

Best regards,
Romain
