From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:38:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: correct systemd
 service install
In-Reply-To: <1466097338-19149-1-git-send-email-martin@barkynet.com>
References: <1466097338-19149-1-git-send-email-martin@barkynet.com>
Message-ID: <20160618153808.08a12e22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 18:15:38 +0100, Martin Bark wrote:
> Commit d732fa4 add the BLUEZ5_UTILS_INSTALL_INIT_SYSTEMD rule, however,
> it is not correct.  The [Install] section of bluetooth.service is as
> follows:
> 
>  [Install]
>  WantedBy=bluetooth.target
>  Alias=dbus-org.bluez.service
> 
> hence there are currently two mistakes:
>  1) bluetooth.service is wanted by bluetooth.target not multi-user.target
>  2) dbus-org.bluez.service is a missing alias to bluetooth.service
> 
> This commit fixes both these issues.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/bluez5_utils/bluez5_utils.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
