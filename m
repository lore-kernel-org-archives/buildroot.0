From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 17 Jan 2018 00:55:15 +0200
Subject: [Buildroot] [PATCH 1/1] vte: new package
In-Reply-To: <20180116234700.545dad71@windsurf>
References: <20180116152333.29596-1-stefan.froberg@petroprogram.com>
 <20180116170712.63ad80cf@windsurf>
 <d8bb959e-509d-98fa-6f1f-178a16096fe5@petroprogram.com>
 <e04130e5-b0f0-8477-a7d4-34742bfbfc7a@petroprogram.com>
 <20180116234700.545dad71@windsurf>
Message-ID: <d911f8a2-a35d-e0a2-b19e-9eb907135812@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi


Thomas Petazzoni kirjoitti 17.01.2018 klo 00:47:
> Hello,
>
> On Wed, 17 Jan 2018 00:29:13 +0200, Stefan Fr?berg wrote:
>
>>>>         depends on BR2_USE_WCHAR # glib2
>>>>         depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
>>>>         depends on BR2_USE_MMU # glib2
>>>>         depends on BR2_INSTALL_LIBSTDCPP # pango
>>>>         depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
>>>> *depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \ BR2_PACKAGE_HAS_LIBGL *  
>> Is OpenGL *really* needed for libgtk3 ?
> I remember having a lengthy discussion back then with Gustavo, who said
> OpenGL was really needed. However, things might have evolved since then.
>
>> Im asking because I have a chrooted musl environment where I
>> intentionally tried to avoid any package that tries to pull OpenGL stuff
>> (like mesa, wayland etc...) and I managed to build
>> gtk3 just fine (version 3.22.26)
>>
>> Here's it's built conf (uses static libs, introspection disabled and
>> uses X11 backend):
>>
>> ./configure --prefix=/usr --sysconfdir=/etc --disable-nls
>> --disable-rpath --disable-shared --disable-modules --enable-static
>> --enable-x11-backend --enable-broadway-backend --disable-glibtest
>> --disable-cloudprint --disable-introspection --disable-gtk-doc
>> --disable-man --disable-gtk-doc-html --disable-gtk-doc-pdf --with-pic
> Does the result actually runs on some target platform ?
I really hope so.
I am currently, at this very moment, building my app against webkitgtk
in that chrooted environment
and if all goes well, I get a nice big static binary blob that I could
try with any Linux, no matter
what C-libc is being used. And should not need OpenGL.
As long as the CPU is x86_64 it should run.
>
> If so, it would definitely be nice to support gtk3 without OpenGL.
>
>
Great! I keep fingers crossed :-)

Regards
-S-
