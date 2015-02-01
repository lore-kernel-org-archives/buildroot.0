From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 23:29:18 +0100
Subject: [Buildroot] [PATCH] package/ipsec-tools: hybrid config support
In-Reply-To: <1422768412-13155-1-git-send-email-rdkehn@yahoo.com>
References: <1422768412-13155-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <20150201232918.3e7db047@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Doug Kehn,

On Sat, 31 Jan 2015 23:26:52 -0600, Doug Kehn wrote:
> Add config option for enabling hybrid mode.  Hybrid mode is required for
> successful interoperability.
> 
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> ---
>  package/ipsec-tools/Config.in      | 6 ++++++
>  package/ipsec-tools/ipsec-tools.mk | 7 ++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)

Applied, thanks. I originally wondered if we shouldn't simply enable
this option by default, since it doesn't require any external
dependency. However, there are already several ipsec-tools options that
exist without having external dependencies, so the addition of this
new option continues in the same logic.

> +ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_HYBRID), y)

I've committed a follow-up patch to replace ', y' by ',y' which is what
we use everywhere in Buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
