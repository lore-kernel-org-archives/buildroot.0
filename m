From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 14:15:23 +0100
Subject: [Buildroot] [PATCH v2 3/4] package/avrdude: depends on libftdi1
 instead of libftdi
In-Reply-To: <CAHXCMMJ30MEE33mytg4xy9pZePD0Z+ezH8pJE6wzhaqJWdkyGg@mail.gmail.com>
References: <1425813964-5295-1-git-send-email-s.martin49@gmail.com>
 <1425813964-5295-4-git-send-email-s.martin49@gmail.com>
 <20150308114842.GB2518@tarshish>
 <CAHXCMMJ30MEE33mytg4xy9pZePD0Z+ezH8pJE6wzhaqJWdkyGg@mail.gmail.com>
Message-ID: <20150316141523.2561f737@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 8 Mar 2015 18:03:09 +0100, Samuel Martin wrote:

> > How do you tell avrdude to link with libftdi1 and not libftdi when both are
> > built? The same question goes for openocd.
> 
> Both avrdude and openocd first check for libftdi1, and use it if any,
> otherwise check for libftdi.
> So, unless I'm missing something this is ok; but that's true I forgot
> to mention this point in the commit log. :-/

So the patch should actually be:

ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
AVRDUDE_DEPENDENCIES += libftdi1
else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
AVRDUDE_DEPENDENCIES += libftdi
endif

Can you fix and resend?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
