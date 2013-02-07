From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Feb 2013 09:24:57 +0100
Subject: [Buildroot] [git commit] qextserialport: don't require Qt GUI
 module
In-Reply-To: <511350F7.9060504@mind.be>
References: <20121114214738.427A799B26@busybox.osuosl.org>
 <50A580BA.5020402@mind.be> <511350F7.9060504@mind.be>
Message-ID: <20130207092457.7ab44d3e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 07 Feb 2013 08:00:07 +0100, Arnout Vandecappelle wrote:

> >   While we're at it, we could also throw out our patching of the
> > platform-specific qws config file: we are anyway replacing all
> > "interesting" variables with our own values, so all useful content
> > is thrown away.  Instead, we could make our own spec file that
> > contains exactly what we need:
> >
> > include(../../common/linux.conf)
> > include(../../common/gcc-base-unix.conf)
> > include(../../common/g++-unix.conf)
> > include(../../common/qws.conf)
> > <our stuff goes here>
> > load(qt_config)
> >
> >
> >   What do you think?
> 
> 
>   Thomas,
> 
>   Now that you're working on Qt5, maybe you can check with qt-project
> if this is indeed the way to go?

I am not sure why you mean by "this", but in the Qt5 packaging, I do
add our own linux-buildroot-g++ configuration. See
http://git.free-electrons.com/users/thomas-petazzoni/buildroot/diff/package/qt5/qt5base/qt5base-mkspecs-files.patch?h=qt5&id=7c1f7b9967d814e3f5c838e7090ac04b9d06af51.

Is that what you meant?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
