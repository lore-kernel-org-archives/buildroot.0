From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 23:01:39 +0200
Subject: [Buildroot] [PATCH 1/2] core/pkg-infra: set no-check-hash only
 for main download
In-Reply-To: <225d2666517e3f008a4674456c4fbfd0db13fdf8.1524685305.git.yann.morin.1998@free.fr>
References: <cover.1524685305.git.yann.morin.1998@free.fr>
 <225d2666517e3f008a4674456c4fbfd0db13fdf8.1524685305.git.yann.morin.1998@free.fr>
Message-ID: <20180501230139.1e298518@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Apr 2018 21:41:52 +0200, Yann E. MORIN wrote:
> Currently, when the main download if from an SCM, we exclude all
> downloads from being hash-checked, on the assumption that we don't
> have hashes for downloads from an SCM.
> 
> However, the exclusion s computed on the DOWNLOAD macro, which is
> called for each download of a package, thus effectively disabling
> hash checks for extra downloads, even though those are only ever
> download with wget.
> 
> What we really wanted to do, in fact, was to exclude just the main
> download.
> 
> We fix that by appending the main source file to the global list of
> excluded files, from within the generic-package infra itself.
> 
> Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/pkg-download.mk | 2 --
>  package/pkg-generic.mk  | 4 ++++
>  2 files changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
