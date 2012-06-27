From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jun 2012 16:29:35 +0200
Subject: [Buildroot] Avahi build failed with BR2_STRIP_none=y and
 BR2_ENABLE_DEBUG=n
In-Reply-To: <1340800887.3122.113.camel@jr-ThinkCentre-A57>
References: <1340800887.3122.113.camel@jr-ThinkCentre-A57>
Message-ID: <20120627162935.5bf51809@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 27 Jun 2012 14:41:27 +0200,
Joerg Rebenstorf <Joerg.Rebenstorf@GiN.de> a ?crit :

> Bugfix: Fix avahi build breakage with BR2_STRIP_none=y and
> BR2_ENABLE_DEBUG=n 
> The fix works like this:
> Look at BR2_STRIP_none to decide whether to strip avahi binaries.
> This avoids bad quoting in avahi Makefile.in when $STRIP is set to:
> true Not_stripping

We no longer use the 'install-strip' target since quite a while, so I
*guess* this problem has been fixed, but I haven't checked since I
never build with BR2_STRIP_none=y.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
