From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 May 2020 15:08:37 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5webengine: don't link with
 libstdc++.a on the host
In-Reply-To: <aa6f5047-3c91-e286-7bbe-29d26353b2c1@gmail.com>
References: <20200524155818.126961-1-romain.naour@gmail.com>
 <20200529233458.2dbace04@windsurf.home>
 <aa6f5047-3c91-e286-7bbe-29d26353b2c1@gmail.com>
Message-ID: <20200531150837.67abf9f9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 May 2020 23:48:09 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> > If we have to pass this, doesn't it mean that the host tools are built
> > statically ? Why are they built statically ? They really shouldn't be
> > built statically at all. I believe this is what should be fixed, rather
> > than just avoiding specifically from linking statically with libstdc++.  
> 
> Without this option host tools are built statically because this option is
> enabled by default.

Can't we remove this, and instead link dynamically the host tools ?

> Adding --no-static-libstdc++ allow to link dynamically with libc.so.6.

--no-static-libstdc++ changes how we link against libc.so.6 ? Shouldn't
it only affect how we link against libstdc++.so ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
