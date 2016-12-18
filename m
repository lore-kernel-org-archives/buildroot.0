From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 14:22:30 +0100
Subject: [Buildroot] [PATCH 1/1] lxc: add dependency on gnutls
In-Reply-To: <1482062185-97871-1-git-send-email-fabrice.fontaine@orange.com>
References: <1482062185-97871-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161218142230.65c0e57d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Dec 2016 12:56:25 +0100, Fabrice Fontaine wrote:
> lxc can use gnutls for various checksumming so add a dependency on it if
> package is selected (there is no --enable-gnutls in configure)
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

I was about to apply this... but in fact I don't see how lxc can use
gnutls. The configure script indeed has:

AC_CHECK_LIB([gnutls], [gnutls_hash_fast], [enable_gnutls=yes], [enable_gnutls=no])

But ${enable_gnutls} is only used to print a message. In the source
code, the gnutls related code is surrounded by HAVE_LIBGNUTLS
conditions, but this is never defined anywhere.

Bottom line, I don't see where gnutls is currently used in lxc in practice.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
