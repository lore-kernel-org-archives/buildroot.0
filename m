From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 9 Nov 2012 17:36:41 +0100
Subject: [Buildroot] problem building a SDL app with buildroot
In-Reply-To: <20121108183649.0cae75f1@skate>
References: <18ba4b30-2ac3-44e7-ae59-5ca40d8137b3@zimbra2.corp.accelance.fr>
 <ec166773-a3e8-47b9-be33-ea05a0cfccab@zimbra2.corp.accelance.fr>
 <CAHXCMMJjaafke3POAv04fdK80L_DWguu+UdbDrah9HSYPfwf-g@mail.gmail.com>
 <20121108183649.0cae75f1@skate>
Message-ID: <CAHXCMMJ3Xu-Ua6hCFLfPQJ6E0taSJa=JqyEiFvRS1uxBagnD7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Jemery, all,

2012/11/8 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Samuel,
>
> On Thu, 8 Nov 2012 11:49:58 +0100, Samuel Martin wrote:
>
>> As a quick fix, in your app *.mk file, you can try to add:
>> <your app prefix>_CONF_OPT += -DSDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config"
>>
>> You don't have to change anything in the sdl-config from the staging
>> area, it is already handled by the sdl package.
>>
>> BTW, that an issue we are aware of, and we talked a bit about it
>> during the last Buildroot Dev Days.
>> We just need some time to work on and figure out the best way to fix this.
>
> We indeed discussed it, but as far as I understood, there isn't really
> another solution than what we're doing at the moment. Options we
> discussed where:
>
>  (1) Install those <foo>-config scripts in $(HOST_DIR)/usr/bin. This
>  isn't possible as they would clash with other <foo>-config scripts
>  installed by host packages.
>
>  (2) Create a special directory, which is in the PATH passed when
>  configuring/building packages, in which we would install those
>  <foo>-config script. This works quite OK when those <foo>-config
>  scripts are self-contained (which is the case most of the time), but
>  not necessarily if they are more elaborate.
>
> So in general, I think we said it wasn't really worth the effort, and
> it was probably a lot better to work on moving packages to pkg-config
> instead.
Thomas, you're right.

> For example, in this case, Jeremy should rather use the pkg-config
> files of SDL to discover the right compiler/linker flags. pkg-config is
> very nicely integrated with CMake, it should even simplify the
> CMakeLists.txt.

Jeremy, actually it's weird that you need to find the sdl-config
binary because CMake provide a package for SDL.
So, as much as possible, it should use the CMake way: using FindSDL.
See: http://www.cmake.org/cmake/help/v2.8.10/cmake.html#module:FindSDL


Regards,

-- 
Sam
