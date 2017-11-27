From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 22:03:06 +0100
Subject: [Buildroot] [PATCH next v2 1/2] gnupg2: don't preserve the old
 gpg2 executable name
In-Reply-To: <4f74cc073562f0ae1d00bdb8b49fb13151a6cf20.1510660959.git.baruch@tkos.co.il>
References: <4f74cc073562f0ae1d00bdb8b49fb13151a6cf20.1510660959.git.baruch@tkos.co.il>
Message-ID: <20171127220306.74e7a1b2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Nov 2017 14:02:38 +0200, Baruch Siach wrote:
> Commit e82fadab236a (gnupg2: bump to version 2.2.0) added a configure
> option to keep the old 'gpg2' executable name to avoid conflict with the
> gnupg package. It turns out that gnupg depends on !BR2_PACKAGE_GNUPG2
> since commit 2cadb26e6d4 (gnupg: make gnupg and gnupg2 mutually
> exclusive). Drop this configure option.
> 
> Rename the config option that controls the removal of gpgv2, now gpgv,
> to match the new name. Add legacy config symbol handling.
> 
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: move legacy entry to 2018.02
> ---
>  Config.in.legacy         | 11 +++++++++++
>  package/gnupg2/Config.in |  6 +++---
>  package/gnupg2/gnupg2.mk | 10 ++++------
>  3 files changed, 18 insertions(+), 9 deletions(-)

Both applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
