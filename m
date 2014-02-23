From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 18:38:30 +0100
Subject: [Buildroot] [PATCH] lua: needs dynamic library support (dlopen)
In-Reply-To: <8a14c6297835e91f6691.1393175989@argentina>
References: <8a14c6297835e91f6691.1393175989@argentina>
Message-ID: <20140223183830.2a7c25eb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 23 Feb 2014 18:19:49 +0100, Thomas De Schampheleire wrote:
> Fixes
> http://autobuild.buildroot.net/results/e76/e765f992ad721a094579140c153ff71f20753265/
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
>  package/dnsmasq/Config.in     |  4 ++++
>  package/efl/libedje/Config.in |  5 +++--
>  package/haserl/Config.in      |  5 +++++
>  package/lighttpd/Config.in    |  4 ++++
>  package/lua/Config.in         |  4 ++++
>  5 files changed, 20 insertions(+), 2 deletions(-)

No, that's not the correct fix. The correct fix is a variant of
http://patchwork.ozlabs.org/patch/313208/, which as suggested by Peter
should use BR2_PREFER_STATIC_LIB as a condition, and not
BR2_BINFMT_FLAT.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
