From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Aug 2015 15:05:32 +0200
Subject: [Buildroot] [PATCH] libsodium: disable PIE on ARC
In-Reply-To: <1439205890-17076-1-git-send-email-abrodkin@synopsys.com>
References: <1439205890-17076-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150810150532.5ccb22d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 10 Aug 2015 14:24:50 +0300, Alexey Brodkin wrote:
> Even though ARC gcc understands "-pie" option and attempts to generate
> PIE binaries as of today PIE is not really supported for user-space
> applications.
> 
> So we disable PIE detection if building for ARC.
> That fixes http://autobuild.buildroot.net/results/be4/be46b621ce5443788b0a1bc9fab614c4ca5d0859
> and also prevents execution of non-supported PIE binary in runtime.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libsodium/libsodium.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
