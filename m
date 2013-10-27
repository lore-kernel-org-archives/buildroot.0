From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Oct 2013 18:55:20 +0100
Subject: [Buildroot] [PATCH v8 RESEND 2/8] package: add toolchain
 dependency to every target package
In-Reply-To: <5268455D.10106@mind.be>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <1382088860-30524-3-git-send-email-fabio.porcedda@gmail.com>
 <5268455D.10106@mind.be>
Message-ID: <20131027185520.4ec5e1b0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 23 Oct 2013 23:53:33 +0200, Arnout Vandecappelle wrote:

>   What I would prefer is to move glibc, linux-headers and uclibc back 
> under the toolchain directory (why did they ever move out, Thomas?) and 
> to filter on $(pkgparentdir)

Well, the idea is that gcc, uclibc, glibc, linux-headers and so on are
now real, normal, packages. The only thing we keep in toolchain/ are
the "entry" point of toolchain backends: toolchain-buildroot and
toolchain-external.

Moreover, it would be strange to have glibc, uclibc and linux-headers
in toolchain/, but not gcc and binutils, for example. I do understand
that these two packages are host packages, so they don't get the
automatic dependency on the toolchain added, but that's an internal
detail. From an external point of view, all those components are part
of the toolchain, so it would be weird to have some of them in
toolchain/, and some of them in package/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
