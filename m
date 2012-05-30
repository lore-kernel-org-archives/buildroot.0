From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 May 2012 21:04:41 +0200
Subject: [Buildroot] [PATCH] New package: freerdp
In-Reply-To: <20120530195334.06a0bad1@jl-desk-LL>
References: <1337809509-29526-1-git-send-email-git@jlunz.de>
 <4FC51F9D.6000503@mind.be> <20120530195334.06a0bad1@jl-desk-LL>
Message-ID: <20120530210441.0a4711be@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 30 May 2012 19:53:34 +0200,
Julian Lunz <git@jlunz.de> a ?crit :

> True, but I tend to have it stated more explicitly that these options
> could but mustn't be used.
> So it is more a question of how would I buildroot like to behave.
> A lot of other packages use the mechanism you describe, so what about
> merging both like that:
> 
> (make "logical or")
> 
> ifneq (,$(filter y, $(BR2_PACKAGE_CUPS) \
> $(BR2_PACKAGE_FREERDP_WITHCUPS)))
> ...
> endif

No, please do like we do for all other packages in Buildroot: simply
use them if available, i.e:

ifeq ($(BR2_PACKAGE_CUPS),y)
... do whatever is needed in your package to use cups
yourpkg_DEPENDENCIES += cups
else
... do whatever is needed in your package to not use cups
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
