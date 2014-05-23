From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 May 2014 10:02:54 +0200
Subject: [Buildroot] [PATCH 2/3] qt5enginio: new package
In-Reply-To: <201405230854.51725.fatih.asici@gmail.com> ("Fatih
 =?utf-8?B?QcWfxLFjxLEiJ3M=?=
 message of "Fri, 23 May 2014 08:54:51 +0300")
References: <1400587934-17338-1-git-send-email-fatih.asici@gmail.com>
 <1400587934-17338-2-git-send-email-fatih.asici@gmail.com>
 <87oayqc4lq.fsf@dell.be.48ers.dk>
 <201405230854.51725.fatih.asici@gmail.com>
Message-ID: <877g5cdis1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:

Hi,

 >> > +config BR2_PACKAGE_QT5ENGINIO
 >> > +	bool "qt5enginio"
 >> > +	select BR2_PACKAGE_OPENSSL
 >> > +	select BR2_PACKAGE_QT5BASE
 >> > +	select BR2_PACKAGE_QT5BASE_GUI
 >> > +	select BR2_PACKAGE_QT5BASE_NETWORK
 >> 
 >> <snip>
 >> 
 >> > +QT5ENGINIO_DEPENDENCIES = qt5base
 >> 
 >> You forgot to add openssl to _DEPENDENCIES.

 > openssl is not a direct dependency of this package. It needs an openssl-
 > enabled qt5base. qt5base has openssl in its _DEPENDENCIES variable.

Ahh, ok - That wasn't clear to me.

 > In this case, do I really need to add this dependency to this package?

It cannot hurt. I would say you should either:

 - Add openssl to _DEPENDENCIES
 - Add a comment after the 'select BR2_PACKAGE_OPENSSL' to explain why
   (similar to how we do for runtime dependencies)

-- 
Bye, Peter Korsgaard
