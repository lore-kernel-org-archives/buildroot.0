From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 Aug 2009 22:48:43 +0200
Subject: [Buildroot] [PATCH 1/2] e2fsprogs: factor out libuuid support
In-Reply-To: <20090803150941.GM19257@buzzloop.caiaq.de> (Daniel Mack's message
	of "Mon\, 3 Aug 2009 17\:09\:41 +0200")
References: <20090729172019.GS19257@buzzloop.caiaq.de>
	<1248888083-11767-1-git-send-email-daniel@caiaq.de>
	<20090803143614.GK19257@buzzloop.caiaq.de>
	<20090803165815.312deddd@surf>
	<20090803150941.GM19257@buzzloop.caiaq.de>
Message-ID: <873a88sjx0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

Hi,

 >> From 97b17587e8dca5774fb59347426f0b7ae04c3415 Mon Sep 17 00:00:00 2001
 Daniel> From: Daniel Mack <daniel@caiaq.de>
 Daniel> Date: Wed, 29 Jul 2009 19:13:46 +0200
 Daniel> Subject: [PATCH] e2fsprogs: factor out libuuid support

 Daniel> Add a new target for libuuid so it can be built without e2fsprogs.

 Daniel> Signed-off-by: Daniel Mack <daniel@caiaq.de>
 Daniel> ---
 Daniel>  package/e2fsprogs/Config.in    |    4 ++++
 Daniel>  package/e2fsprogs/e2fsprogs.mk |   27 +++++++++++++++++++++++++--
 Daniel>  2 files changed, 29 insertions(+), 2 deletions(-)

 Daniel> diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
 Daniel> index d353fd9..398dc56 100644
 Daniel> --- a/package/e2fsprogs/Config.in
 Daniel> +++ b/package/e2fsprogs/Config.in
 Daniel> @@ -1,6 +1,10 @@
 Daniel> +config BR2_PACKAGE_LIBUUID
 Daniel> +	bool

Why did you make this a hidden config? Couldn't we imagine someone
wanting to use libuuid in their own programs?

-- 
Bye, Peter Korsgaard
