From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 3 Jul 2018 08:25:48 +0300
Subject: [Buildroot] [PATCH 01/50] package/busybox: backport upstream
 patch to fix install-noclobber
In-Reply-To: <2222ddf7fb0c17011ad26da66ff6fa5664f66240.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
 <2222ddf7fb0c17011ad26da66ff6fa5664f66240.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <20180703052548.iqefnv3kedkxuh3u@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Jul 02, 2018 at 11:11:35PM +0200, Yann E. MORIN wrote:
> Currently, we shoehorn the noclobber option with a sed call, but
> upstream has applied a set of 4 patches that adds support to do
> an install without clobbering.
> 
> Backport those patches, and use the new install rule.

Busybox 1.29.0 is out now. You can bump instead of backport.

baruch

> Note that the 3rd and 6th patches do not seem like they would be usefull
> to backport, but a user may well have a custom config that enables shell
> wrappers, or installs no wrapper (to install then at runtime), so it
> still makes sense to backport them (especially since the 3rd was part of
> the noclobber series upstream, and the 6th, a fix of it).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
