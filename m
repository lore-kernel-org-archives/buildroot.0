From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 7 Apr 2014 08:18:24 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-05
In-Reply-To: <20140406110837.45baff8e@skate>
References: <20140406063010.119BC100CBA@stock.ovh.net>
 <20140406110837.45baff8e@skate>
Message-ID: <20140407111824.GA544@arch.cereza>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Apr 06, Thomas Petazzoni wrote:
> >      nios2 |                   dhcpcd-6.1.0 | NOK | http://autobuild.buildroot.net/results/c32ad4bac5f651502e551f7733f702afaa0e742a/
> 
> Ezequiel, can you look into this?
> 

Ah, yes. Known issue. The kernel headers exported to userspace by the Sourcery
toolchain are completely broken. Seems like they used "cp" instead of
"make headers_install".

If we want to fix headers in an external toolchain, this issue and others like
it will get fixed.
-- 
Ezequiel Garc?a, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
