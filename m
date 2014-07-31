From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 09:38:21 +0200
Subject: [Buildroot] Build failed for package avahi
In-Reply-To: <53D9EF25.8040803@posteo.de>
References: <53D9739C.7040301@posteo.de>
 <20140731010417.77c5d67c@free-electrons.com>
 <53D9EF25.8040803@posteo.de>
Message-ID: <20140731093821.2c5d8ac3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 31 Jul 2014 09:24:21 +0200, J?rg Krause wrote:

> >> checking how to run the C++ preprocessor... /lib/cpp
> >> configure: error: in
> >> `/home/joerg/Freescale/buildroot/output/build/avahi-0.6.31':
> >> configure: error: C++ preprocessor "/lib/cpp" fails sanity check
> >> See `config.log' for more details
> > Can you post the contents of output/build/avahi-0.6.31/config.log ?
> 
> I attached the config.log.

Problem is:

configure:13407: /lib/cpp  conftest.cpp
./configure: line 2321: /lib/cpp: No such file or directory

Autotools (or parts of it) expect /lib/cpp to be a symbolic link to the
C preprocessor. However, certain distributions (I think Archlinux) are
no longer installing this symbolic link.

I'm not sure what is to blame here: the distro not creating
the /lib/cpp symbolic link, or the autotools using this symbolic link?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
