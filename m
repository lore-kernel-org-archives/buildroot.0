From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Wed, 11 Nov 2015 22:11:04 +0900
Subject: [Buildroot] [PATCH] package/gauche: remove unnecessary files
 for target, fix a typo
In-Reply-To: Your message of Tue, 10 Nov 2015 11:42:11 +0100.
 <20151110114211.365afbbc@free-electrons.com>
Message-ID: <201511111311.tABDB5aR013551@ms-omx03.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas.

I checked latest 25 fails of
    http://autobuild.buildroot.org/?reason=gauche-0.9.4
Summary is tail of this e-mail.

I looked at tree of gauche, but it will not so easy to use external
(existing in buildroot) bdwgc, so I'd like to exclude architectures
not supported by current boehm gc as first.

I know this is not long term solution, but to classify further cause,
it will be useful.
If you agree, I will send patch for this.

Regards, Kawashima

2015-11-11 12:36:54	xtensa		gc not ported
2015-11-10 23:30:21	powerpc		./libgauche-0.9.so: undefined reference to `getcontext'
2015-11-10 23:11:45	arc		gc not ported
2015-11-10 22:20:21	powerpc		./libgauche-0.9.so: undefined reference to `getcontext'
2015-11-10 17:30:19	arc		gc not ported
2015-11-10 14:16:58	sh4		./libgauche-0.9.so: undefined reference to `getcontext'
2015-11-10 08:46:51	powerpc		./libgauche-0.9.so: undefined reference to `getcontext'
2015-11-10 04:28:00	arm		./libgauche-0.9.so: undefined reference to `AO_pt_lock'
2015-11-10 03:44:37	xtensa		gc not ported
2015-11-10 01:17:44	microblazeel	gc not ported
2015-11-10 00:37:46	arm		./libgauche-0.9.so: undefined reference to `AO_pt_lock'
2015-11-10 00:00:05	arm		./include/private/../gc_pthread_redirects.h:37:22: fatal error: dlfcn.h: No such file or directory
2015-11-09 16:40:33	xtensa		gc not ported
2015-11-09 16:24:36	powerpc		./libgauche-0.9.so: undefined reference to `getcontext'
2015-11-09 14:43:12	arc		gc not ported
2015-11-09 10:43:50	arc		gc not ported
2015-11-09 07:08:04	xtensa		gc not ported
2015-11-09 05:14:36	arm		./libgauche-0.9.so: undefined reference to `AO_pt_lock'
2015-11-09 01:00:08	microbazeel	gc not ported
2015-11-08 20:14:57	arm		./libgauche-0.9.so: undefined reference to `AO_pt_lock'
2015-11-08 15:41:57	arm		./include/private/../gc_pthread_redirects.h:37:22: fatal error: dlfcn.h: No such file or directory
2015-11-08 07:18:05	xtensa		gc not ported
2015-11-08 06:41:22	arc		gc not ported
2015-11-08 05:34:02	powerpc		./libgauche-0.9.so: undefined reference to `getcontext'
2015-11-07 02:03:42	powerpc		./libgauche-0.9.so: undefined reference to `getcontext'
...

> If you cannot use the bdwgc package, then just add some architecture
> dependencies in gauche/Config.in, probably in the form of:
> 
> config BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
> 	bool
> 	default y if BR2_arm || BR2_i386 || ...
> 
> config BR2_PACKAGE_GAUCHE
> 	bool "gauche"
> 	depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
> 
> comment "gauche needs ..."
> 	depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
> 
> Best regards,
> 
> Thomas
============================================================
    Hiroshi Kawashima
