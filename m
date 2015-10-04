From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 17:50:32 +0100
Subject: [Buildroot] [PATCH 2/2] nfs-utils: systemd support
In-Reply-To: <1443900549-9696-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443900549-9696-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1443900549-9696-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151004175032.69e0523c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat,  3 Oct 2015 21:29:09 +0200, Maxime Hadjinlian wrote:
> From: Aur?lien Chabot <aurelien@chabot.fr>
> 
> nfs-utils has been patched to install only the needed systemd unit files
> supported.
> Also tmpfiles was needed because the folder /run/nfs is a tmpfs
> and nfs-utils need some files to be there to work correctly.
> 
> Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
> [Maxime: Remove patches included originally in the patch as they have
> have been merged upstream in v1.3.3]
> Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> v1 -> v2:
>     - Remove the added patch since the previous patch bump nfs_utils
>       which have them already in the tree.
> ---
>  package/nfs-utils/nfs-utils.mk            | 27 +++++++++++++++++++++++++++
>  package/nfs-utils/nfs-utils_env.sh        |  1 +
>  package/nfs-utils/nfs-utils_tmpfiles.conf |  4 ++++
>  3 files changed, 32 insertions(+)
>  create mode 100755 package/nfs-utils/nfs-utils_env.sh
>  create mode 100644 package/nfs-utils/nfs-utils_tmpfiles.conf

Applied with some changes:

    [Thomas:
      - add comment in nfs-utils_env.sh to explain why an empty script is
        needed.
      - remove incorrect indentation.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
