From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 12 Oct 2011 11:59:11 +0200
Subject: [Buildroot] [PATCH v2] New package: ImLib2
In-Reply-To: <20111012115317.3cc2fc4e@skate>
References: <1318328770-9496-1-git-send-email-yegorslists@googlemail.com>	<201110111817.28102.arnout@mind.be>	<CAGm1_kuSe7ubgejMu0YHfcoh8NDdgFENtLz2iKJWyjFKATdgVQ@mail.gmail.com>	<20111012114042.67308131@skate>	<4E95618E.6010203@visionsystems.de>
 <20111012115317.3cc2fc4e@skate>
Message-ID: <4E9564EF.6050708@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 12.10.2011 11:53, schrieb Thomas Petazzoni:
> Le Wed, 12 Oct 2011 11:44:46 +0200,
> Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :
>
>>> The dependencies on X.org are quite a mess these days. Maybe
>>> packages depend on xserver-xorg_server, while they should depend on
>>> the X11 libraries that they require.
>> O.K. BR2_PACKAGE_XSERVER_XORG_SERVER definitely specifies that
>> libXext is to be selected. 
> Yes, but technically speaking, all X11 client libraries and programs
> should *not* depend on the X.org server, but rather on the needed X11
> libraries. For several reasons:
>
>  *) Because technically, the clients don't require the server to
>     already be built ;
>
>  *) Because if one day, we manage to enable parallel building of
>     packages, it is great to have correct dependencies ;
>
>  *) Because you can imagine a setup in which you build several X11
>     client libraries and programs, but not the X server, and the
>     X applications display their windows to a remote X server, which is
>     not built by Buildroot.

O.K. I make ImLib2 depend on libXext. Du to the fact, that libX11 is selected by libXext I don't need this additional dependency.

For feh I then make 2 dependencies: 

BR2_PACKAGE_XLIB_LIBXINERAMA
BR2_PACKAGE_XLIB_LIBXT

Yegor
