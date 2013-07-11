From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 11 Jul 2013 10:16:46 +0100
Subject: [Buildroot] [PATCH v4 2/2] qt: add powervr and opengl
In-Reply-To: <20130711104744.7fa84966@skate>
References: <1373479838-8288-1-git-send-email-spenser@gillilanding.com>
 <51DDAF1A.5040602@carallon.com> <20130711104744.7fa84966@skate>
Message-ID: <51DE77FE.2060709@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/07/2013 09:47, Thomas Petazzoni wrote:
> Dear Will Wagner,
>
> On Wed, 10 Jul 2013 19:59:38 +0100, Will Wagner wrote:
>
>>> +config BR2_PACKAGE_QT_GFX_POWERVR
>>> +	depends on BR2_PACKAGE_QT_OPENGL_ES
>>> +	depends on BR2_PACKAGE_TI_GFX
>>> +	bool "powervr"
>>> +
>> I don't like that this depends on the TI_GFX package. When I added
>> powervr support to Qt I added a powervr virtual package the same as
>> opengl_es or opengl_egl. This allows Qt to not contain anything specific
>> to the hardware graphics package.
> I don't quite understand this. The Qt code that gets enabled with this
> option *is* specific to this very driver, so it makes a lot of sense to
> have this dependency.
>
> If at some point in the future, we have a different package that is
> API-compatible with the ti-gfx package and allows the same Qt PowerVR
> code to be enabled, then it will be good time to have a virtual
> package. Virtual packages have not impact on the Config.in options
> stored in .config, so moving things to a virtual package does not break
> the .config API, so we can safely do that in the future, when needed.

Ok, makes sense that the virtual package is only needed if we have more 
than one package that offers it. I already have two hardware packages 
that offer powervr support which is why I did it that way and it sounds 
like Spenser is planning to add another as well.

Just to be difficult I'll also point out that currently in buildroot 
there is only one package (rpi_userland) that offers opengl_es and 
opengl_egl support so you were obviously planning for the future when 
you made those a virtual package :)

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
