From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 18:27:59 +0200
Subject: [Buildroot] [PATCH] linux: adjust fixup logic for ktap
In-Reply-To: <1424612340-2332-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1424612340-2332-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150713182759.6d79741d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Feb 2015 14:39:00 +0100, Thomas Petazzoni wrote:
> The ktap package requires some parts of the kernel tracing
> infrastructure to be enabled, especially
> CONFIG_EVENT_TRACING. However, this option is a blind option in the
> kernel, so enabling it in linux.mk has no effect: we need to enable a
> non-blind option that selects CONFIG_EVENT_TRACING. We've chosen to
> select CONFIG_FTRACE.
> 
> This fixes the build of ktap.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  linux/linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied with Arnout's suggestion taken into account.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
