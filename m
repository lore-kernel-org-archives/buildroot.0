From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 29 Jan 2018 10:03:01 +0200
Subject: [Buildroot] [PATCH] package/gpsd: upgrade to 3.17,
 remove obsolete patch
In-Reply-To: <1517212625-32760-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1517212625-32760-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20180129080301.3x4ek2l3ogyraupn@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zoltan,

On Mon, Jan 29, 2018 at 08:57:05AM +0100, Zoltan Gyarmati wrote:
> The upstream patch which disables the build-time systemctl call made it into
> this release so removing it here. Also adding hash for the COPYING file.
> 
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
>  ...001-SConstruct-do-not-force-O2-by-default.patch | 29 +++++++++++++++
>  ...eract-with-systemctl-when-cross-compiling.patch | 41 ----------------------
>  ...002-SConstruct-do-not-force-O2-by-default.patch | 29 ---------------
>  package/gpsd/gpsd.hash                             |  3 +-
>  package/gpsd/gpsd.mk                               |  2 +-
>  5 files changed, 32 insertions(+), 72 deletions(-)
>  create mode 100644 package/gpsd/0001-SConstruct-do-not-force-O2-by-default.patch
>  delete mode 100644 package/gpsd/0001-do-not-interact-with-systemctl-when-cross-compiling.patch
>  delete mode 100644 package/gpsd/0002-SConstruct-do-not-force-O2-by-default.patch

It looks like the -O2 patch file is just renamed. To make this apparent it 
would be better to pass -M to 'git format-patch', so that git would detect the 
file rename. This also makes the patch review easier, especially when the file 
is also changed along the way.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
