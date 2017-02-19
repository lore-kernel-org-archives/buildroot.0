From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Feb 2017 18:44:32 +0100
Subject: [Buildroot] [PATCH 4/4] bctoolbox: disable rpath
In-Reply-To: <1487516855.17793.1.camel@embedded.rocks>
References: <20170214224402.8785-1-joerg.krause@embedded.rocks>
 <20170214224402.8785-4-joerg.krause@embedded.rocks>
 <20170215052846.yxjzvhmsgdc3hy57@tarshish>
 <20170215095650.236f21b5@free-electrons.com>
 <1487516855.17793.1.camel@embedded.rocks>
Message-ID: <20170219184432.58c82ea1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Feb 2017 16:07:35 +0100, J?rg Krause wrote:

> > Worth mentioning that there is both CMAKE_SKIP_RPATH and
> > CMAKE_SKIP_INSTALL_RPATH. The former skips adding the rpath during
> > both
> > the build and install steps, which prevents from running the binary
> > from the build directory. The latter only skips the rpath during the
> > install step. But since we're cross-compiling, running on the host
> > machine from the build directory anyway doesn't make sense. So
> > CMAKE_SKIP_RPATH is OK.
> > 
> > See https://cmake.org/cmake/help/v3.0/variable/CMAKE_SKIP_RPATH.html.  
> 
> Samuel argues not to force this option by the infrastructure. I am 	
> not sure how do we handle this properly. So, what shall we do?

As I said in my second e-mail (sent after reading Samuel's answer),
Samuel is probably correct. Skipping the rpath in *all* cases may not
be correct, so we have to do it at the per-package level, like your
patch does.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
