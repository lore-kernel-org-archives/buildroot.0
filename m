From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 19:37:22 +0100
Subject: [Buildroot] [PATCHv2] dhcpcd: needs MMU
In-Reply-To: <1383400021-16905-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383400021-16905-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131102193722.15d105a1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Sat,  2 Nov 2013 14:47:01 +0100, Thomas Petazzoni wrote:
> dhcpcd fails to build on non-MMU platforms, even with the
> --disable-fork option:
> 
>   bind.o: In function `_daemonise':
>   bind.c:(.text+0x62): undefined reference to `_fork'
>   collect2: ld returned 1 exit status
> 
> Therefore, we make dhcpcd depend on MMU support, and remove the
> non-MMU condition in the .mk file. More recent versions of dhcpcd do
> support non-MMU properly, but this commit intends to be only a fix.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> v1 -> v2: remove non-MMU condition in .mk file, mentionned by Gustavo.
> ---
>  package/dhcpcd/Config.in | 1 +
>  package/dhcpcd/dhcpcd.mk | 4 ----
>  2 files changed, 1 insertion(+), 4 deletions(-)

Committed to for-peter-2013.11, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
