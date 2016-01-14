From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jan 2016 13:39:34 +0100
Subject: [Buildroot] [PATCH 1/2] Disabling trousers package for arc
In-Reply-To: <1452772556-18734-2-git-send-email-ltrimas@synopsys.com>
References: <1452772556-18734-1-git-send-email-ltrimas@synopsys.com>
 <1452772556-18734-2-git-send-email-ltrimas@synopsys.com>
Message-ID: <20160114133934.6554ac7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lada,

On Thu, 14 Jan 2016 14:55:55 +0300, Lada Trimasova wrote:
> Even though ARC gcc understands "-pie" option and attempts
> to generate PIE binaries as of today PIE is not really supported
> for user-space applications. Trousers configure scripts don't provide any
> options which can disable pie usage. So there is no easy way to prevent
> linking with -pie on ARC. The easiest solution is just to make
> the trousers package not available on ARC.
> 
> Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>

Rather than doing this, what about adding an option to make the pie
usage optional? You can take some inspiration from
http://www.spinics.net/lists/linux-cifs/msg06418.html for example.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
