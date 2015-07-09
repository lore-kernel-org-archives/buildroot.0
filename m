From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jul 2015 22:14:28 +0200
Subject: [Buildroot] [PATCH] quagga: disable PIE on ARC
In-Reply-To: <1436436011-8126-1-git-send-email-abrodkin@synopsys.com>
References: <1436436011-8126-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150709221428.478a52a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Thu,  9 Jul 2015 13:00:11 +0300, Alexey Brodkin wrote:
> Even though ARC gcc understands "-pie" option and attempts to generate
> PIE binaries as of today PIE is not really supported for user-space
> applications.
> 
> So we disable PIE detection if building for ARC.
> That fixes http://autobuild.buildroot.net/results/ca0/ca0b1e271f29d7639b6a6e895472a35e2c1d8aba
> and also prevents execution of non-supported PIE binary in runtime.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/quagga/quagga.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
