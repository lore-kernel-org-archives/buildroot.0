From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 10:27:26 +0200
Subject: [Buildroot] [PATCH 2/2] qemu: add host/target Linux version
 check
In-Reply-To: <XnsA4A16452115E4berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1418249519-15794-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1418249519-15794-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <XnsA4A16452115E4berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150521102726.7826d7f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 21 May 2015 09:51:43 +0200, Bernd Kuhls wrote:

> > +ifneq
> > ($(HOST_QEMU_COMPARE_VERSION_MAJOR)$(HOST_QEMU_COMPARE_VERSION_MINOR),OKO
> > K) +$(error "Refusing to build qemu-user: target Linux version newer
> > than host's.") +endif
> 
> while testing an allyesconfig with "make source-check" this error was
> raised. I had to comment this line in order to run the source-check. Is it
> possible to run this check only during a build phase? 

Yes, but that's not the proper solution. The proper solution is to
enclose the test with:

ifeq ($(BR_BUILDING),y)
...
endif

See how it's used in linux.mk or uboot.mk.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
