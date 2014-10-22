From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 23:03:02 +0200
Subject: [Buildroot] [PATCHv2] package/eudev: tweak initscript
In-Reply-To: <1413829612-12373-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413829612-12373-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141022230302.6db34503@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 20 Oct 2014 15:26:52 -0300, Gustavo Zacarias wrote:
> Make the udev initscript trigger in a coherent way, i.e. first set
> subsystems, then device and then let the whole thing settle.
> Otherwise for usb_modeswitch udev rules they never kick in since the
> storage aspect (device) gets claimed first and the switch ignored.
> Also set the settle timeout to a smaller value than the default
> 120 seconds to avoid stalling too much.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/eudev/S10udev | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
