From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 16:47:15 +0200
Subject: [Buildroot] [PATCH v3] ncurses: bump to 6.0
In-Reply-To: <20170321005337.2687-1-Adamduskett@outlook.com>
References: <20170321005337.2687-1-Adamduskett@outlook.com>
Message-ID: <20170401164715.4c427f90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Mar 2017 20:53:37 -0400, Adam Duskett wrote:
> ncurses 6.0 has been out for a while now (August 8th 2015!)  This
> patch brings us up to the latest version.  Not too many changes had
> to occure to get this working well.
> 
> - The first patch is no longer needed as it was fixed in the new release.
> - The other two packages are still applicable, however I did have to change
>   the line numbers.  Because that is the only thing I had to change, I didn't
>   put my signature on them.  If this is needed I will gladly do so.
> - A new option: --with-pkg-config-libdir has been added. Without it
>   pkg files wouldn't install to the correct location.
> - NCURSES_ABI_VERSION is no longer needed, as there is only 6.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
> v2 -> v3:
>   - Now compatible with the master branch.
>   
> v1 -> v2:
>   - Updated to work with Thomas Petazzoni's changes.
>   
>  .../ncurses/0001-fixup-pkg-config-handling.patch   | 89 ----------------------
>  ...Klib_gen.patch => 0001-gcc-5.x-MKlib_gen.patch} |  6 +-
>  package/ncurses/0002-recognise-uclinux.patch       | 28 +++++++
>  package/ncurses/0003-recognise-uclinux.patch       | 30 --------
>  package/ncurses/ncurses.hash                       |  2 +-
>  package/ncurses/ncurses.mk                         | 11 ++-
>  6 files changed, 37 insertions(+), 129 deletions(-)
>  delete mode 100644 package/ncurses/0001-fixup-pkg-config-handling.patch
>  rename package/ncurses/{0002-gcc-5.x-MKlib_gen.patch => 0001-gcc-5.x-MKlib_gen.patch} (87%)
>  create mode 100644 package/ncurses/0002-recognise-uclinux.patch
>  delete mode 100644 package/ncurses/0003-recognise-uclinux.patch

Applied to master, thanks. I've only slightly tweaked the commit log to
avoid using the first person.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
