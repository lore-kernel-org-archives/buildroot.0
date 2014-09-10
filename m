From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Sep 2014 23:04:24 +0200
Subject: [Buildroot] [PATCH 2/2] procps-ng: Fix installation and take
 precedence over busybox
In-Reply-To: <1410359406-49326-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1410359406-49326-1-git-send-email-Vincent.Riera@imgtec.com>
 <1410359406-49326-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140910230424.14192582@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 10 Sep 2014 15:30:06 +0100, Vicente Olivert Riera wrote:
> Currently procps-ng binaries are installed under $(TARGET_DIR)/usr/usr
> instead of $(TARGET_DIR)/usr, which would be the expected. This is
> caused because the default value of the --exec-prefix configure option
> is /usr, and Buildroot always adds --prefix=/usr to the configure
> option. We fix this by setting --exec-prefix to an empty value.
> 
> At the same time we make sure the procps-ng binaries have precedence
> over the busybox ones.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Reviewed-by: Markos.Chandras <Markos.Chandras@imgtec.com>
> ---
>  package/procps-ng/procps-ng.mk |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
