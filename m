From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Oct 2013 10:13:27 +0200
Subject: [Buildroot] [PATCH 1/1] libcap: fix static linking issue
In-Reply-To: <420407879.8180852.1381219913546.JavaMail.root@openwide.fr>
References: <20131006232954.71da4d75@skate>
 <420407879.8180852.1381219913546.JavaMail.root@openwide.fr>
Message-ID: <20131008101327.5ee7cc9c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 8 Oct 2013 10:11:53 +0200 (CEST), Romain Naour wrote:

> | > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> | > +LIBCAP_LDFLAGS=-fPIC
> | > +endif
> | 
> | This seems really weird, because normally, we would expect exactly
> | the
> | opposite: position independent code is needed for shared libraries,
> | not
> | for static libraries.
> 
> Ok, I'll take the problem from the beginning.
> Sorry for that mistake.

Note that I'm not sure about what I said, but having to build with
-fPIC in the static lib case seems really strange.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
