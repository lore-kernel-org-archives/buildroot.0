From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 12:40:30 +0200
Subject: [Buildroot] [PATCH 2 of 3 v3] qt5: support buildroot being
 located in /usr
In-Reply-To: <b3e4c074d9f7aee6e841.1403362908@localhost>
References: <patchbomb.1403362906@localhost>
 <b3e4c074d9f7aee6e841.1403362908@localhost>
Message-ID: <20140629124030.575a710d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sat, 21 Jun 2014 17:01:48 +0200, Thomas De Schampheleire wrote:
> qt5 performs sed replacements of /usr to $(STAGING_DIR)/usr in .la files.
> However, if buildroot itself is located in /usr, then STAGING_DIR also
> starts with /usr, and naive replacements of '/usr' can result in paths of
> the form:
>     /usr/buildroot/.../sysroot/usr/buildroot/.../sysroot/...
> 
> This patch makes the replacements more careful, by first replacing the known
> paths BASE_DIR and STAGING_DIR to tokens, then performing the actual
> replacement, and finally replacing the tokens with the corresponding paths.
> 
> Partially fixes bug #5750 (https://bugs.busybox.net/show_bug.cgi?id=5750)
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
