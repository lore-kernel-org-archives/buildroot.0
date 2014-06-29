From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 12:39:26 +0200
Subject: [Buildroot] [PATCH 1 of 3 v3] infra: support buildroot being
 located in /usr
In-Reply-To: <f9dbe1c9d761945aaf97.1403362907@localhost>
References: <patchbomb.1403362906@localhost>
 <f9dbe1c9d761945aaf97.1403362907@localhost>
Message-ID: <20140629123926.5a17535c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sat, 21 Jun 2014 17:01:47 +0200, Thomas De Schampheleire wrote:
> pkg-generic and pkg-autotools both perform sed replacements of /usr to
> $(STAGING_DIR)/usr, in .pc and .la files respectively. However, if buildroot
> itself is located in /usr, then STAGING_DIR also starts with /usr, and naive
> replacements of '/usr' can result in paths of the form:
>     /usr/buildroot/.../sysroot/usr/buildroot/.../sysroot/...
> 
> This patch makes the replacements more careful, by first replacing the known
> paths BASE_DIR and STAGING_DIR to tokens, then performing the actual
> replacement, and finally replacing the tokens with the corresponding paths.
> 
> Additionally it removes the unnecessary making of a backup copy in
> pkg-autotools.
> 
> Partially fixes bug #5750 (https://bugs.busybox.net/show_bug.cgi?id=5750)
> 
> Partially-based-on-a-patch-from: Ben Stoltz <benstoltz@gmail.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

I've applied this patch, after adding the explanation comment proposed
by Arnout. However, I haven't implemented the other possible
improvements suggested by Arnout, which I believe can be proposed as
followup patches.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
