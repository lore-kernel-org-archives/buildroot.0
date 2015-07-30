From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:44:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/libserial: bump to version
 0.6.0rc2
In-Reply-To: <1438291705.21638.12.camel@embedded.rocks>
References: <1438284088-20483-1-git-send-email-joerg.krause@embedded.rocks>
 <20150730230054.3b0dd927@free-electrons.com>
 <1438291705.21638.12.camel@embedded.rocks>
Message-ID: <20150730234423.39000033@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 30 Jul 2015 23:28:25 +0200, J?rg Krause wrote:

> > Woo, now to use a simple library to communicate over serial port, you
> > need Boost. Open-source developers are crazy sometimes.
> 
> Seems boost::scoped_ptr is absolutely necessary :-)

... Thomas goes on and does some research about boost::scoped_ptr ...

Ah, yes! Indeed! It is absolutely impossible to send/receive bytes over
a serial port without using boost::scoped_ptr ! :-))

> > >  	depends on BR2_INSTALL_LIBSTDCPP
> > > +	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS # boost
> > > +	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
> > > +	depends on BR2_USE_WCHAR # boost
> > > +	select boost
> > 
> > Really? I don't think this is the valid way to select boost :-)
> > 
> 
> Oops!

I'll merge your updated version, I think it was the only issue I saw in
the patch. Please make sure to double check all reverse dependencies of
libserial.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
