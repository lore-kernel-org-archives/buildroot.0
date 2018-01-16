From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 17 Jan 2018 00:29:13 +0200
Subject: [Buildroot] [PATCH 1/1] vte: new package
In-Reply-To: <d8bb959e-509d-98fa-6f1f-178a16096fe5@petroprogram.com>
References: <20180116152333.29596-1-stefan.froberg@petroprogram.com>
 <20180116170712.63ad80cf@windsurf>
 <d8bb959e-509d-98fa-6f1f-178a16096fe5@petroprogram.com>
Message-ID: <e04130e5-b0f0-8477-a7d4-34742bfbfc7a@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Oh, one thing ...


Stefan Fr?berg kirjoitti 16.01.2018 klo 19:58:
> Hi Thomas
>
>
> Thomas Petazzoni kirjoitti 16.01.2018 klo 18:07:
>> Hello,
>>
>> On Tue, 16 Jan 2018 17:23:33 +0200, Stefan Fr?berg wrote:
>>
>>> diff --git a/package/vte/Config.in b/package/vte/Config.in
>>> new file mode 100644
>>> index 0000000000..e448477d69
>>> --- /dev/null
>>> +++ b/package/vte/Config.in
>>> @@ -0,0 +1,15 @@
>>> +config BR2_PACKAGE_VTE
>>> +	bool "vte"
>>> +	select BR2_PACKAGE_LIBGTK3
>> You can't just select libgtk3 so easily. It has lots of dependencies:
>>
>>         depends on BR2_USE_WCHAR # glib2
>>         depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
>>         depends on BR2_USE_MMU # glib2
>>         depends on BR2_INSTALL_LIBSTDCPP # pango
>>         depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
>> *depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \ BR2_PACKAGE_HAS_LIBGL *

Is OpenGL *really* needed for libgtk3 ?

Im asking because I have a chrooted musl environment where I
intentionally tried to avoid any package that tries to pull OpenGL stuff
(like mesa, wayland etc...) and I managed to build
gtk3 just fine (version 3.22.26)

Here's it's built conf (uses static libs, introspection disabled and
uses X11 backend):

./configure --prefix=/usr --sysconfdir=/etc --disable-nls
--disable-rpath --disable-shared --disable-modules --enable-static
--enable-x11-backend --enable-broadway-backend --disable-glibtest
--disable-cloudprint --disable-introspection --disable-gtk-doc
--disable-man --disable-gtk-doc-html --disable-gtk-doc-pdf --with-pic



Regards
-S

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180117/efcca301/attachment.html>
