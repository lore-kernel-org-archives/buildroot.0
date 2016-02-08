From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 09:17:52 +0100
Subject: [Buildroot] [PATCH] yad: fix libgtk3 dependency
In-Reply-To: <56B7DFB4.4030101@zacarias.com.ar>
References: <1454504515-4365-1-git-send-email-gustavo@zacarias.com.ar>
 <20160207233241.7e5eb5b9@free-electrons.com>
 <56B7DFB4.4030101@zacarias.com.ar>
Message-ID: <20160208091752.293fd9da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 7 Feb 2016 21:22:12 -0300, Gustavo Zacarias wrote:
> On 07/02/16 19:32, Thomas Petazzoni wrote:
> 
> >>   config BR2_PACKAGE_YAD
> >>   	bool "yad"
> >>   	depends on BR2_PACKAGE_XORG7
> >> -	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
> >> +	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3_X11
> >
> > Is the BR2_PACKAGE_XORG7 dependency still needed, then?
> 
> Hi.
> I believe it isn't, the only weak spot right now is that libgtk3 isn't 
> deterministic - you can select multiple backends like x11 & wayland, 
> however i'm unsure if that's allowed, IIRC there's no way to select 
> which one you want.

I'm not sure to understand: following your patch, we depend on
BR2_PACKAGE_LIBGTK3_X11, so yad can only be enabled if the Gtk3 X11
backend was selected.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
