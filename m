From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Sep 2012 20:51:16 +0200
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
 host-pkg-config
In-Reply-To: <505C597E.8020306@mind.be>
References: <1348224356-20104-1-git-send-email-arnout@mind.be>
 <505C4969.8090707@zacarias.com.ar> <505C4C17.2000701@mind.be>
 <505C4DB3.8000008@zacarias.com.ar> <505C4E1A.7000809@mind.be>
 <505C5180.10105@zacarias.com.ar> <505C597E.8020306@mind.be>
Message-ID: <20120921205116.1ea5d2c8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Fri, 21 Sep 2012 14:11:42 +0200, Arnout Vandecappelle wrote:

>   Maybe we should make that _always_ present, and add host-pkg-config to
> the toolchain build...  It is more or less part of the toolchain, and it
> doesn't hurt to build it if it's not needed.

host-pkg-config depends on host-automake, which depends on
host-autoconf and host-libtool, themselves needing host-m4.

Are we going to become OpenEmebdded, and rebuild the entire host
distribution before building anything useful for the target?

Sorry, but the fact that when building a Busybox system, Buildroot
builds Busybox and nothing else is a very good property of Buildroot.
Let's keep it this way, thanks :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
