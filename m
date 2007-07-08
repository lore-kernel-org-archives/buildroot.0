From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 8 Jul 2007 14:27:42 +0200 (CEST)
Subject: [Buildroot] busybox package configuration
In-Reply-To: <20070708115519.GG4096@aon.at>
References: <0707081257070.8395@somehost> <20070708115519.GG4096@aon.at>
Message-ID: <0707081417090.26961@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 8 Jul 2007, Bernhard Fischer wrote:

> sed -i -e "/BR2_PACKAGE_BUSYBOX_CONFIG/d"

That was the magic :)

As long as there is a BR2_PACKAGE_BUSYBOX_CONFIG in .config, it's value
will not be changed only because the Config.in is suddenly
changed/corrected.  Only after the variable is removed from .config will
it be reinstated by a re-config.  Is this correct?


-- 
Cristian
