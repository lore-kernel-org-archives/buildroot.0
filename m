From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 09:51:08 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/piglit: new package
In-Reply-To: <84ded507-27f9-9e33-a116-becc8dda57f0@smile.fr>
References: <20180211162136.15605-1-romain.naour@gmail.com>
 <20180211162136.15605-3-romain.naour@gmail.com>
 <20180916233840.79495eba@windsurf>
 <84ded507-27f9-9e33-a116-becc8dda57f0@smile.fr>
Message-ID: <20180918095108.1a128bcf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Sep 2018 22:10:02 +0200, Romain Naour wrote:

> > This is surprising, what does it do on the host during the build
> > process that requires those tools ? Or is it that piglit generates a
> > report on the target, and then provides a bunch of host tool to process
> > such reports ?  
> 
> Reports can be processed on the target directly.
> I believe it's for the same reason that we need host-numpy.

What "same reason" ?

> I think the build system is checking the host-python instead of python for the
> target.
> 
> I'm not sure how to fix this...

So you mean that all those Python packages are not needed on the host,
but because the build system is bogus and checks their presence on the
host, we have to have them as dependencies ?

So indeed, there's a macro in cmake/Modules/PythonModule.cmake that is
used to check for Mako, Numpy and Six, and it works by running the host
Python. I imagine they are in fact not needed on the host, and this
macro needs to be adjusted. However, I'm not sure what's the right way
to test if a *target* Python module is available.

Maybe Yegor can help on this ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
