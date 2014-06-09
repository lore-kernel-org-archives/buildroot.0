From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 12:11:01 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-06-08
In-Reply-To: <20140609100709.GA3512@free.fr>
References: <20140609063010.9CF93101624@stock.ovh.net>
 <20140609100709.GA3512@free.fr>
Message-ID: <20140609121101.02fc9620@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

Thanks for the analysis!

On Mon, 9 Jun 2014 12:07:09 +0200, Yann E. MORIN wrote:

> >   mips64el |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/0ee234e4557cbdf14aaa8f1a95156845c0dfe05a/
> >        arm |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/43c491a8875bba4b4eed13950346422d52841bf5/
> 
> Needs udev:
>     checking for LIBUDEV... no
>     configure: error: libudev-dev required for building DRI
> 
> Bernd, we need to revisit your libudev patch. ;-)

Shouldn't instead mesa3d depend on eudev || systemd, using
BR2_PACKAGE_HAS_UDEV ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
