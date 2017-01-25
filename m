From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 14:37:43 +1300
Subject: [Buildroot] [PATCH 1/2] Add BR2_CMAKE_USE_NINJA_BACKEND option
In-Reply-To: <20170106223748.2203-1-cedric.marie@openmailbox.org>
References: <20170106223748.2203-1-cedric.marie@openmailbox.org>
Message-ID: <20170125143743.0df51d6d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 Jan 2017 23:37:47 +0100, C?dric Marie wrote:
>  $(2)_CONF_ENV			?=
>  $(2)_CONF_OPTS			?=
> +$(2)_INSTALL_STAGING_ENV	?= DESTDIR=$$(STAGING_DIR)
> +$(2)_INSTALL_TARGET_ENV		?= DESTDIR=$$(TARGET_DIR)

We don't have such options in any other package infrastructure. So I
think I'd prefer if you kept just INSTALL_STAGING_OPTS and
INSTALL_TARGET_OPTS, and define them to the appropriate value depending
on whether you're using Ninja or Make.

Are there any existing CMake package that overrides
INSTALL_STAGING_OPTS or INSTALL_TARGET_OPTS ? If that's the case, then
we cannot change its semantic like this without taking care of those
packages first.

But as I said in my other reply on this thread, I'd really like to get
some justification of why adding support for the Ninja backend is
useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
