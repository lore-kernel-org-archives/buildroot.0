From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 23:01:37 +0100
Subject: [Buildroot] [PATCH v6 14/28] package/qt5webengine: Convert to
 qmake infra
In-Reply-To: <20200217212350.29750-15-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-15-anaumann@ultratronik.de>
Message-ID: <20200311230137.3c7f06ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Feb 2020 22:23:36 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> Mostly straightforward conversion but keeping custom config/build env
> to apply the python2 workaround.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

I've applied, but I have a comment, see below.

> +QT5WEBENGINE_CONF_ENV = $(QT5WEBENGINE_ENV)
> +QT5WEBENGINE_MAKE_ENV = $(QT5WEBENGINE_ENV)

I'm not really thrilled by this, and we had to do the same in
qt5webkit. This is modeled after the autotools-package infrastructure,
where normally environment variables passed to the ./configure script
don't need to be passed again at build time.

But if with qmake they are needed at both configure time and build
time, then perhaps we should change to have a single <pkg>_ENV
variable, passed at both configure and build time.

Let's see how many packages need this, and we'll adjust later if needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
