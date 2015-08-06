From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 20:50:38 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <55C36A0E.3000707@oliseo.fr>
References: <20150729063017.EDA6D101EBC@stock.ovh.net>
 <20150729100334.00137b70@free-electrons.com>
 <55C366E8.3060207@oliseo.fr>
 <20150806155803.66771b6f@free-electrons.com>
 <55C36A0E.3000707@oliseo.fr>
Message-ID: <20150806205038.52618bea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guillaume GARDET - Olis?o,

On Thu, 6 Aug 2015 16:07:10 +0200, Guillaume GARDET - Olis?o wrote:

> >> What would be the best way to fix it? Maybe a "depends on !BR2_STATIC_LIBS" ?
> > Either fix c-icap, or simpler, make it depends on !BR2_STATIC_LIBS (and
> > don't forget the corresponding comment).
> 
> Will send a patch to depends on !BR2_STATIC_LIBS.
> For the comment, '# dlopen' is enough?

Yes, but I was actually referring to the Config.in comment to express
the dynamic library dependency.

Hum, wait. Look at c-icap/Config.in:

config BR2_PACKAGE_C_ICAP
        bool "c-icap"
        depends on !BR2_PREFER_STATIC_LIB
        depends on BR2_TOOLCHAIN_HAS_THREADS

It already has the dependency, it is just wrong: it should be
BR2_STATIC_LIBS and not BR2_PREFER_STATIC_LIB. I'll fix that up.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
