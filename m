From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jul 2010 10:33:54 +0200
Subject: [Buildroot] Evaluation of make variables
In-Reply-To: <1280231693.22687.47.camel@dubciaranr1.verifone.com>
References: <1280226977.22687.37.camel@dubciaranr1.verifone.com>
	<20100727134209.5fddfa7b@surf>
	<1280231693.22687.47.camel@dubciaranr1.verifone.com>
Message-ID: <20100730103354.1c7f1a0f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 27 Jul 2010 12:54:53 +0100
Quotient Remainder <quotientvremainder@gmail.com> wrote:

> Well my reason for looking at this was so that I could use Maxime's
> git/svn patches to use a git repo to hold the U-Boot source.  As it
> stands only Makefiles using gentargets can use this.  I would want to
> do this for the linux kernel too.

As we discussed in another thread (if I remember correctly), I'm not
sure the gentargets infrastructure is appropriate for building the
kernel and bootloaders. But definitely, some sort of infrastructure
for building these would be good.

> Is this an inherent limitation of the make syntax or specific to the
> layout of the buildroot makefiles?

Inherent limitation of the make syntax. Try a simple test.mk file that
does:

FOOBAR=y

define BARFOO
ifeq ($(FOOBAR),y)
	echo "Hello World"
endif
endef

all:
	$(BARFOO)

it doesn't work, while:

FOOBAR=y

ifeq ($(FOOBAR),y)
define BARFOO
	echo "Hello World"
endef
endif

all:
	$(BARFOO)

does work.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
