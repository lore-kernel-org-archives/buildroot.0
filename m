From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 11:01:07 +0200
Subject: [Buildroot] [PATCH] lvm2: disable PIE on ARC
In-Reply-To: <1435754151-23359-1-git-send-email-abrodkin@synopsys.com>
References: <1435754151-23359-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150702110107.3bd1cf7a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed,  1 Jul 2015 15:35:51 +0300, Alexey Brodkin wrote:
> Even though ARC gcc understands "-pie" option and attempts to generate
> PIE binaries as of today PIE is not really supported for user-space
> applications.
> 
> So we disable PIE detection if building for ARC.
> That first fixes http://autobuild.buildroot.net/results/988/9888a7a30538c9851f4910c16674d8dbb8edeb8f/
> and also prevents execution of non-supported PIE binary in runtime.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/lvm2/lvm2.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
