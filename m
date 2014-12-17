From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Dec 2014 09:57:37 +0100
Subject: [Buildroot] [PATCH v2] gnupg2: fix linking with intl
In-Reply-To: <548B0998.5000001@imgtec.com>
References: <1418299611-50833-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141211195331.48f6f7c4@free-electrons.com>
 <548B0998.5000001@imgtec.com>
Message-ID: <20141217095737.564714af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 12 Dec 2014 15:28:24 +0000, Vicente Olivert Riera wrote:
> On 12/11/2014 06:53 PM, Thomas Petazzoni wrote:
> > Dear Vicente Olivert Riera,
> > 
> > On Thu, 11 Dec 2014 12:06:51 +0000, Vicente Olivert Riera wrote:
> > 
> >> +ifeq ($(BR2_PACKAGE_GETTEXT),y)
> >> +GNUPG2_DEPENDENCIES += gettext
> >> +GNUPG2_CONF_ENV += LIBS=-lintl
> > 
> > Are you sure we need this LIBS part when glibc is used?
> 
> Uhm..., something must have changed in the tree and right now I'm not
> able to reproduce this failure even using the same config file :/
> 
> http://autobuild.buildroot.net/results/9aa/9aaca74dd3a1f82e12358530db4d5d17eb833f7f/config

This problem was related to static linking, but the
BR2_PREFER_STATIC_LIB option has been renamed to BR2_STATIC_LIBS (with
a bogus Config.in.legacy handling done by me). So if you took the old
config file, BR2_PREFER_STATIC_LIB was discarded, and you were doing a
shared library build instead of a static library build, which explains
why the problem was not appearing anymore.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
