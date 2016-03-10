From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 20:59:36 +0100
Subject: [Buildroot] [PATCH] mesa3d: add intel gallium driver support
In-Reply-To: <1457632891-4354-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 10 Mar 2016 15:01:31 -0300")
References: <1457632891-4354-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8760wum7dj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/mesa3d/Config.in | 9 +++++++++
 >  package/mesa3d/mesa3d.mk | 1 +
 >  2 files changed, 10 insertions(+)

 > diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
 > index 9057746..5badefa 100644
 > --- a/package/mesa3d/Config.in
 > +++ b/package/mesa3d/Config.in
 > @@ -43,6 +43,15 @@ config BR2_PACKAGE_MESA3D_NEEDS_XA
 
 >  comment "Gallium drivers"
 
 > +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 > +	bool "Gallium i915 driver"
 > +	depends on BR2_i386 || BR2_x86_64
 > +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 > +	select BR2_PACKAGE_LIBDRM_INTEL
 > +	select BR2_PACKAGE_MESA3D_NEEDS_XA
 > +	help
 > +	  Driver for Intel integrated graphics.
 > +

I don't know much about mesa, but I thought the Intel driver didn't use
galium? Is this some kind of alternative to the dri driver?

-- 
Bye, Peter Korsgaard
