From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Sep 2013 11:05:10 +0200
Subject: [Buildroot] [RFCv1 00/11] Convert toolchain backends to
 packages to fix source/external-deps/legal-info
In-Reply-To: <a732406fe5a58630caddfdf3453ff06e@sysmic.org>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <a732406fe5a58630caddfdf3453ff06e@sysmic.org>
Message-ID: <20130906110510.2890328f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri, 06 Sep 2013 10:57:43 +0200, J?r?me Pouiller wrote:

> > To do so, the idea of this patch is to:
> >
> >  (1) Create a 'toolchain' virtual package, which will depend on the
> >      particular toolchain backend depending on the configuration.
> Is it too early to move toolchain/ to package/? Or there is a reason
> to keep toolchain/ out of package/?

Well, we do have packages outside of package/, such as the kernel and
bootloaders. I believe it makes sense to keep the toolchain backends in
toolchain/. Besides, the toolchain-buildroot/ package is really just an
indirection for host-gcc-final. Only the toolchain-external/ package
really contains some real stuff.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
