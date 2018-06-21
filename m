From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 20 Jun 2018 21:29:55 -0500
Subject: [Buildroot] [RFC PATCH v4 9/9] chromium: new package
In-Reply-To: <CAMWSM7jmYPhWONsnKGCStTO+YvkGK3T6x_P8AJmFVU6DnnTw8A@mail.gmail.com>
References: <20180610205417.13963-1-joseph.kogut@gmail.com>
 <20180614224820.27126-1-joseph.kogut@gmail.com>
 <20180614224820.27126-10-joseph.kogut@gmail.com>
 <CANQCQpYM5oyJpk-=G8UvYtHHoXVGt6wVRU8=GPN9KBK0hL9FLQ@mail.gmail.com>
 <CAMWSM7jmYPhWONsnKGCStTO+YvkGK3T6x_P8AJmFVU6DnnTw8A@mail.gmail.com>
Message-ID: <CANQCQpYZX7ysz7k-VgfwXkz=YT7TReKgMJkpYS5+1iDqhqPCvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joseph,

On Wed, Jun 20, 2018 at 6:07 PM, Joseph Kogut <joseph.kogut@gmail.com> wrote:
> Matt,
>
> On Wed, Jun 20, 2018 at 1:57 PM Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
>>
>> Joseph,
>>
>> On Thu, Jun 14, 2018 at 5:48 PM, Joseph Kogut <joseph.kogut@gmail.com> wrote:
>> >
>> [snip]
>>
>> > diff --git a/package/chromium/Config.in b/package/chromium/Config.in
>> > new file mode 100644
>> > index 0000000000..aa71d0e2dd
>> > --- /dev/null
>> > +++ b/package/chromium/Config.in
>> > @@ -0,0 +1,46 @@
>> > +config BR2_PACKAGE_CHROMIUM
>> > +       bool "chromium"
>> > +       depends on BR2_PACKAGE_HAS_LIBGL
>> > +       depends on BR2_PACKAGE_XORG7
>> > +       depends on BR2_TOOLCHAIN_USES_GLIBC
>> > +       depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64
>> > +       select BR2_PACKAGE_ALSA_LIB
>> > +       select BR2_PACKAGE_CUPS
>> > +       select BR2_PACKAGE_DBUS
>> > +       select BR2_PACKAGE_FREETYPE
>> > +       select BR2_PACKAGE_HARFBUZZ
>> > +       select BR2_PACKAGE_LLVM_ENABLE_HOST_ARCH
>> > +       select BR2_PACKAGE_HOST_CLANG
>> > +       select BR2_PACKAGE_HOST_LLD
>> > +       select BR2_PACKAGE_HOST_NINJA
>> > +       select BR2_PACKAGE_HOST_NODEJS
>> > +       select BR2_PACKAGE_HOST_PYTHON
>> > +       select BR2_PACKAGE_JPEG
>> > +       select BR2_PACKAGE_LIBDRM
>> > +       select BR2_PACKAGE_LIBERATION # runtime
>> > +       select BR2_PACKAGE_LIBGLIB2
>> > +       select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
>> > +       select BR2_PACKAGE_LIBKRB5
>> > +       select BR2_PACKAGE_LIBNSS
>> > +       select BR2_PACKAGE_LIBPNG
>> > +       select BR2_PACKAGE_PCIUTILS
>> > +       select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
>> > +       select BR2_PACKAGE_XLIB_LIBXCURSOR
>> > +       select BR2_PACKAGE_XLIB_LIBXI if !BR2_PACKAGE_LIBGTK3_X11
>> > +       select BR2_PACKAGE_XLIB_LIBXRANDR
>> > +       select BR2_PACKAGE_XLIB_LIBXSCRNSAVER
>> > +       select BR2_PACKAGE_XLIB_LIBXTST if !BR2_PACKAGE_LIBGTK3_X11
>> > +
>> > +config BR2_PACKAGE_CHROMIUM_TARGET_ARCH
>> > +       string
>> > +       default "arm" if BR2_arm
>> > +       default "arm64" if BR2_aarch64
>> > +       default "x86" if BR2_i386
>> > +       default "x64" if BR2_x86_64
>> > +       default "mips" if BR2_mips
>> > +
>> > +comment "chromium needs toolchain w/ Glibc"
>> > +       depends on !BR2_TOOLCHAIN_USES_GLIBC
>> > +
>> > +comment "chromium depends on X.org and needs an OpenGL backend"
>> > +       depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
>>
>> I have not checked through all the threads to see if this already is reported.
>>
>> Using master as of today and the v4 patchset adjusted for
>> merges/bumps, I got the following failure.  Is there a minimum GCC
>> version that should be a dependency?
>> https://paste.ubuntu.com/p/dKsNXBms5x/
>>
>> Matt
>
> Doing some cursory searching, it seems the c++14 standard is supported
> in GCC 4.9.0 and later. Before that, it was called c++1y.
>
> More information here:
> https://stackoverflow.com/questions/31965413/compile-c14-code-with-g
>
> I'll go ahead and add that as a dependency for the next version.
>

Ah, ic my RHEL7.4 is GCC4.8.5 and this must have been a host tool being built.

Matt
