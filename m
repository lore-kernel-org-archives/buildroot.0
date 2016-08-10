From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 00:03:27 +0200
Subject: [Buildroot] [PATCH 1/1] libical: use system time zone info
In-Reply-To: <1470839416-92898-1-git-send-email-marc@khouri.ca>
References: <1470839416-92898-1-git-send-email-marc@khouri.ca>
Message-ID: <20160811000327.0d72b065@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Aug 2016 10:30:16 -0400, Marc Khouri wrote:
> libical requires time zone information in order to make use of time
> zone functions (otherwise, segfaults occur when applications call
> the time zone functions). This patch:
> 1. forces the system to build time zone info
> 2. ensures libical does not build its own time zone info (this is
>    the default behaviour, but the flag is added in case libical's
>    default changes in the future).
> 
> Signed-off-by: Marc Khouri <marc@khouri.ca>
> ---
>  package/libical/Config.in  | 1 +
>  package/libical/libical.mk | 2 ++
>  2 files changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
