From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 21:41:44 +0100
Subject: [Buildroot] [PATCH next v6] systemd: allow to build with uClibc
 toolchains
In-Reply-To: <20180212210633.GA20420@waldemar-brodkorb.de>
References: <20180212210633.GA20420@waldemar-brodkorb.de>
Message-ID: <20180214214144.4dd5c41c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Feb 2018 22:06:33 +0100, Waldemar Brodkorb wrote:
> We need to disable any systemd parts using either IDN, NSS or gshadow.
> IDN is only disabled in C library function call to getnameinfo(),
> it does not effect libidn/libidn2 usage in systemd.
> 
> Tested with qemu-system-arm.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   - added Upstream commit URL suggested by Thomas Petazzoni
>   - rework enable/disable options suggested by Thomas Petazzoni
>   - extend commit message a little bit
> v2 -> v3:
>   - sync to latest master changes
>   - remove patches included upstream
>   - disable features not usable with uClibc-ng lacking nss.h
> v3 -> v4:
>   - add comment about missing nss suggested by Arnout
>   - add extra parenthesis suggested by Arnout
> v4 -> v5:
>   - update after switch to meson
>   - fix typo for resolve option
> v5 -> v6:
>   - split of typo fix from uClibc enable patch
> ---
>  package/systemd/Config.in  |  3 +++
>  package/systemd/systemd.mk | 11 +++++++++++
>  system/Config.in           |  6 +++---
>  3 files changed, 17 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
