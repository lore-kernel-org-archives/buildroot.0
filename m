From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Jun 2011 00:19:06 +0200
Subject: [Buildroot] adding libiqrf
In-Reply-To: <BANLkTi=zt4AaA4HZ_bXGGymeZt5=p_2CqQ@mail.gmail.com> (Belisko
 Marek's message of "Mon, 16 May 2011 21:53:41 +0200")
References: <BANLkTi=zt4AaA4HZ_bXGGymeZt5=p_2CqQ@mail.gmail.com>
Message-ID: <8739iw6xt1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Belisko" == Belisko Marek <marek.belisko@gmail.com> writes:

 Belisko> Hi,
 Belisko> I want to add libiqrf to buildroot (https://github.com/nandra/libiqrf).
 Belisko> I create simple patch but after running make seems library isn't builded.
 Belisko> I just get:
 >>>> libiqrf v1.0.0 Extracting
 >>>> libiqrf v1.0.0 Patching package/libiqrf
 >>>> libiqrf v1.0.0 Configuring
 >>>> libiqrf v1.0.0 Building
 >>>> libiqrf v1.0.0 'Installing to staging directory'
 >>>> libiqrf v1.0.0 Installing to target

 Belisko> +LIBIQRF_VERSION = v1.0.0
 Belisko> +LIBIQRF_SITE = git://github.com/nandra/libiqrf.git
 Belisko> +LIBIQRF_INSTALL_STAGING = YES
 Belisko> +LIBIQRF_INSTALL_TARGET = YES
 Belisko> +
 Belisko> +LIBIQRF_DEPENDENCIES = libusb
 Belisko> +
 Belisko> +$(eval $(call GENTARGETS,package,libiqrf))
 Belisko> +

 Belisko> Any ideas why it doesn't work?

With gentargets there's no default implementation of the build + install
steps, so you need to explicitly implement them (look at the other
gentargets packages for examples).

-- 
Bye, Peter Korsgaard
