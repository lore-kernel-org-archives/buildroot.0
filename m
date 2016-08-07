From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 21:41:52 +0200
Subject: [Buildroot] [PATCH] procps-ng: fix BR2_STATIC_LIBS=y build
In-Reply-To: <29A57947-77D1-4AF2-9327-D2B27C7C5EF7@gmail.com>
References: <1470561551-22910-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <29A57947-77D1-4AF2-9327-D2B27C7C5EF7@gmail.com>
Message-ID: <20160807214152.2b388080@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 Aug 2016 07:31:43 -0700, Khem Raj wrote:

> > + #include <ctype.h>
> > ++#if ENABLE_LIBSELINUX  
> 
> Should this check be numa | selinux

Nope: in this file there is only one use of dlopen(), and it's related
to SELinux.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
