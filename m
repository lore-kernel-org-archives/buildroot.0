From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Nov 2019 20:45:52 +0100
Subject: [Buildroot] [PATCH,
 next 1/1] package/libglib2: bump to version 2.62.2
In-Reply-To: <CAFSsvmqzCBG0+FX+bp2p+XJQD+pQDM3f=sefTEn9067CH7tM0w@mail.gmail.com>
References: <20191111210251.2216431-1-aduskett@gmail.com>
 <20191112215341.28f7b1aa@windsurf>
 <CAFSsvmqzCBG0+FX+bp2p+XJQD+pQDM3f=sefTEn9067CH7tM0w@mail.gmail.com>
Message-ID: <20191113204552.5198d038@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Nov 2019 11:19:50 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> > > + # Don?t build the tests unless we can run them (either natively, in an exe wrapper, or by installing them for later use)
> > > +-build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper()) or installed_tests_enabled
> > > ++build_tests = installed_tests_enabled  
> >
> > Why do we need to change this ? Is meson.has_exe_wrapper() true in our case ?
> >  
> I believe so. Without the change, the tests are triggered to build.
> I'm not sure where we are triggering has_exe_wrapper,
> but it is indeed being triggered.

It would be good to understand what is this has_exe_wrapper thing, and
why we are triggering it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
