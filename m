From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Aug 2013 21:28:02 +0200
Subject: [Buildroot] [PATCH v2] host-mkpasswd: new package
In-Reply-To: <5c108e45ee2998346481.1375898511@BEANTN0L019720>
References: <5c108e45ee2998346481.1375898511@BEANTN0L019720>
Message-ID: <20130810212802.6266df89@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 07 Aug 2013 20:01:51 +0200, Thomas De Schampheleire wrote:
> Since the addition of root password setting support in buildroot, there have
> been a few bug reports in this area ([1], [2]). In these cases, the system
> mkpasswd did either not work, or did not provide the options we expect, like
> -m <method>.
> 
> This patch adds a mkpasswd host package, based on the sources from whois. When
> a non-empty root password is set, this package is used as a dependency.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks. I just did two minor changes:

 * Put -lcrypt at the end of the compilation line, otherwise the
   mkpasswd build was failing here.

 * Change 'install' to '$(INSTALL)'

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
