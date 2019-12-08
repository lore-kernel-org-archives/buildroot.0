From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 15:41:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: drop autoreconf
In-Reply-To: <20191208141051.1640026-1-fontaine.fabrice@gmail.com>
References: <20191208141051.1640026-1-fontaine.fabrice@gmail.com>
Message-ID: <20191208154143.3f59112c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Dec 2019 15:10:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> As spotted by Thomas during review of
> https://patchwork.ozlabs.org/patch/1205441, autoreconf is no longer
> necessary as alsa.m4 is no longer patched since commit
> e8cb594bc8ce07e22e247972a417d53fd56e10fb

The fact that alsa.m4 is no longer patched is not sufficient: the
configure script in alsa-utils must have been re-generated with the new
alsa.m4 that contains the fix that made it upstream in alsa-lib.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
