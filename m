From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Sep 2015 11:33:06 +0200
Subject: [Buildroot] [PATCH 1/2] udisks: bump to version 1.0.5
In-Reply-To: <1441186284-61034-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441186284-61034-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150902113306.6cb82300@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 2 Sep 2015 10:31:23 +0100, Vicente Olivert Riera wrote:
> This version depends on libgudev, otherwise it fails with an error like
> this one:
> 
> checking for GUDEV... no
> configure: error: Package requirements (gudev-1.0 >= 147) were not met:
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/udisks/Config.in   |    1 +
>  package/udisks/udisks.hash |    2 +-
>  package/udisks/udisks.mk   |    5 +++--
>  3 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/udisks/Config.in b/package/udisks/Config.in
> index a5da2bf..8b8fd28 100644
> --- a/package/udisks/Config.in
> +++ b/package/udisks/Config.in
> @@ -12,6 +12,7 @@ config BR2_PACKAGE_UDISKS
>  	select BR2_PACKAGE_PARTED
>  	select BR2_PACKAGE_LVM2
>  	select BR2_PACKAGE_LIBATASMART
> +	select BR2_PACKAGE_LIBGUDEV

No: libgudev should only be used when systemd is used. Otherwise, it's
provided by eudev.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
