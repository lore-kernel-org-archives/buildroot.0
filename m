From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 May 2013 19:25:43 +0200
Subject: [Buildroot] [PATCH 04/12] lbase64: New package
In-Reply-To: <CADwac6CnLFHP5=yDsnF5xfB4GOMSQsCi3=J2QVPukdy=kTS+QA@mail.gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-4-git-send-email-shmuelzon@gmail.com>
 <20130520165204.0269d05a@skate>
 <CADwac6CnLFHP5=yDsnF5xfB4GOMSQsCi3=J2QVPukdy=kTS+QA@mail.gmail.com>
Message-ID: <20130520192543.3b61d666@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Assaf Inbal,

On Mon, 20 May 2013 18:23:22 +0300, Assaf Inbal wrote:

> Thank you for the comments.
> Using TARGET_CONFIGURE_OPTS wont save much since I still need to override
> CFLAGS and add -fPIC (as is done in other Lua packages).

I think we still do prefer:

	$(MAKE) -C $(@D) \
		$(TARGET_CONFIGURE_OPTS)
		CFLAGS="$(TARGET_CFLAGS) -fPIC"

> Also, regarding the static library, the output of the package is always a
> shared object since it needs to be loaded dynamically by Lua scripts. The
> default target of the package is a test so I need to specifically specify
> the target.

Ok. Then maybe your package needs to depend on !BR2_PREFER_STATIC_LIB.
Or maybe more of the Lua stuff, if it requires shared libraries.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
