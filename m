From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Nov 2013 10:11:12 +0100
Subject: [Buildroot] [pkg-luarocks infra V3 01/10] luainterpreter:
 create virtual package
In-Reply-To: <20131115094423.024e1af8@skate>
References: <1384460249-32410-1-git-send-email-francois.perrad@gadz.org>
 <CAAXf6LXVQ8uFccP2+-TwQOC0iAH=ochrtzUQH-sFN7sZetrpUQ@mail.gmail.com>
 <20131115094423.024e1af8@skate>
Message-ID: <CAAXf6LUixt-3engtthxiHc3iqZo=nd07NPBhZrG5yoNYvrGH_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Nov 15, 2013 at 9:44 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Fri, 15 Nov 2013 08:24:59 +0100, Thomas De Schampheleire wrote:
>
>> >  config BR2_PACKAGE_LBASE64
>> >         bool "lbase64"
>> > +       depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
>> >         help
>> >           A base64 library for Lua
>>
>> The meaning of BR2_PACKAGE_HAS_LUA_INTERPRETER is that the user has
>> selected one of lua or luajit, right?
>> Is the PACKAGE in there really needed? What about
>> BR2_HAS_LUA_INTERPRETER instead? This says that 'buildroot has a lua
>> interpreter' and not that 'a package has a lua interpreter'.
>
> On the other hand, we have:
>
>  BR2_PACKAGE_HAS_OPENGL_EGL
>  BR2_PACKAGE_HAS_OPENGL_ES
>  BR2_PACKAGE_HAS_OPENVG
>  BR2_PACKAGE_HAS_OPENMAX
>  BR2_PACKAGE_HAS_POWERVR

Hm, I wasn't aware of that.
These also sound awkward to me, BR2_HAS_OPENGL_EGL etc. seems more logical...
Changing this would of course mean new legacy options...

>
>
>> > +++ b/package/luainterpreter/luainterpreter.mk
>> > @@ -0,0 +1,18 @@
>> > +#############################################################
>> > +#
>> > +# Virtual package for luainterpreter
>> > +#
>> > +#############################################################
>> > +
>> > +LUAINTERPRETER_VERSION = 5.1
>>
>> What is the meaning of this version? It seems to be the lua version,
>> but is this relevant for a virtual package?
>
> No, it is not relevant. Maybe we could have the policy of doing:
>
> <foo>_VERSION = virtual
> <foo>_SOURCE =
>
> for virtual packages. This way instead of showing "unknown" in the ">>>
> blabla unknown extracting" messages, we would have ">>> blabla virtual
> extracting".

Sounds good to me. This could also be used for the external toolchain then...

>>> toolchain undefined Extracting
>>> toolchain undefined Patching
>>> toolchain-external undefined Extracting
mkdir -p /home/tdescham/repo/contrib/buildroot-vim-sh-2/output/host/opt/ext-toolchain
bzcat /home/tdescham/repo/contrib/dl/br-sh4-full-2013.05-1.tar.bz2 |
tar --strip-components=1 --exclude='usr/lib/locale/*' -C
/home/tdescham/repo/contrib/buildroot-vim-sh-2/output/host/opt/ext-toolchain
 -xf -
>>> toolchain-external undefined Patching
>>> toolchain-external undefined Configuring
>>> toolchain-external undefined Building
>>> toolchain-external undefined Installing to staging directory
>>> toolchain-external undefined Copying external toolchain libraries to target...
>>> toolchain-external undefined Copying external toolchain sysroot to staging...
>>> toolchain-external undefined Building ext-toolchain wrapper



Best regards,
Thomas
