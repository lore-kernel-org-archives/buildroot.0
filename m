From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Dec 2020 22:59:06 +0100
Subject: [Buildroot] [PATCH next] package/daemon: bump to version 0.7
In-Reply-To: <1fd6d6ff9eaedda5e3b3e85c4c5c0b950dcbaec8.1605981054.git.baruch@tkos.co.il>
References: <1fd6d6ff9eaedda5e3b3e85c4c5c0b950dcbaec8.1605981054.git.baruch@tkos.co.il>
Message-ID: <20201207225906.58a9f0db@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Sat, 21 Nov 2020 19:50:54 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> The configure script now runs 'make ready'. Drop it from BUILD_CMDS.
> 
> Refresh the musl support path.
> 
> Upstream now provides sha256 hashes. Format hashes with two spaces.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

I have applied, but I have one question, see below.

>  define DAEMON_CONFIGURE_CMDS
> -	(cd $(@D); ./config)
> +	(cd $(@D); ./configure)

What is the config/configure script doing? Indeed, it seems odd that
when cross-compiling, we don't need to pass it the
cross-compiler/cross-linker/CFLAGS, etc. ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
