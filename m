From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Aug 2014 18:14:22 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/pkg-autotools: don't use
 config.site when cross-compiling
In-Reply-To: <1408698774-13615-1-git-send-email-romain.naour@openwide.fr>
References: <1408698774-13615-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140824181422.5dd8c43d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 22 Aug 2014 11:12:53 +0200, Romain Naour wrote:
> On fedora 20 64bits host, the file /usr/share/config.site contains
> a fix for installing libraries into /lib/lib64 on 64bits systems
> that redefine libdir in the generated Makefile
> 
> For safety and avoid the bug #7262 [1], disable loading this file
> when running the configure script for the target and the host.
> 
> Note: configure scripts generated with autoconf < 2.65 will source
> the /dev/null and print this line:
> "configure: loading site script /dev/null"
> 
> [1]: https://bugs.busybox.net/show_bug.cgi?id=7262
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

I am wondering if this change should go in master (for 2014.08) or in
the next branch (for 2014.11). That close to the release, doing a
change in the core infrastructure seems a bit invasive to me. What if
it breaks the build of other packages? Seems unlikely, I admit, but
still. What do others think?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
