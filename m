From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 15:22:23 +0200
Subject: [Buildroot] [PATCH 2 of 2] generic packages: rename
 FOO_CONFIGURE_OPTS into FOO_CONFIGURE_OPT
In-Reply-To: <5b961fc80eb2d23373a6.1406056892@localhost>
References: <9d1a7e2626ad1d2e4b42.1406056891@localhost>
 <5b961fc80eb2d23373a6.1406056892@localhost>
Message-ID: <20140727152223.38c38d68@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 22 Jul 2014 21:21:32 +0200, Thomas De Schampheleire wrote:
> As FOO_MAKE_OPTS has been renamed to FOO_MAKE_OPT, this patch renames
> FOO_CONFIGURE_OPTS into FOO_CONFIGURE_OPT for symmetry reasons.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
> Note: TARGET_CONFIGURE_OPTS has not been changed since the impact is very
> large. It would make sense to change it too, though, so let me know what you
> think.

Yeah, I'm a bit worried with the discrepancy between
TARGET_CONFIGURE_OPTS, TARGET_CONFIGURE_ARGS, HOST_CONFIGURE_OPTS and
HOST_CONFIGURE_ARGS that use the plural form, vs those per-package
<foobar>_OPT options.

My feeling is that the plural form looks more logical, so instead of
moving from _OPTS to _OPT, I'd rather like to see a move from _OPT to
_OPTS. But that indeed involves changing a *lot* of packages.

What do others think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
