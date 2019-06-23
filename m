From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 18:04:29 +0200
Subject: [Buildroot] [PATCH] host-rauc: Allow use of host-libp11 for
 crypto hardware support
In-Reply-To: <20190223022338.5210-1-tpiepho@impinj.com>
References: <20190223022338.5210-1-tpiepho@impinj.com>
Message-ID: <20190623180429.5d600f1e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 23 Feb 2019 02:23:51 +0000
Trent Piepho <tpiepho@impinj.com> wrote:

> To use a private key stored on a hardware crypto module, such as an HSM
> or smart card, rauc needs OpenSSL to have support for pkcs11 modules.
> OpenSSL achieves this through the libp11 library.
> 
> The libp11 engine for OpenSSL is a dynamic module, so the dependency is
> at rauc's runtime, rather than openssl's or rauc's build time.  However,
> it still needs to be added as a dependency, so that anything that uses
> host-rauc when building can be assured that host-rauc is fully
> functional.
> 
> As this is a runtime dependency, there's no need for a target
> dependency.  And it's only used for signing updates, which isn't done on
> the target anyway.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
> To work, this requires the patch to add libp11, 
> https://patchwork.ozlabs.org/patch/1009607/

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
