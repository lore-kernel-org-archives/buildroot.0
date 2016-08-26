From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 15:39:49 +0200
Subject: [Buildroot] [PATCH/next] system/skeleton: use uid/gid 65534 for
 nobody/nogroup
In-Reply-To: <1472161636-2504-1-git-send-email-peter@korsgaard.com>
References: <1472161636-2504-1-git-send-email-peter@korsgaard.com>
Message-ID: <20160826153949.1c0b5b7e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 23:47:16 +0200, Peter Korsgaard wrote:
> As recently discussed on lwn.net: https://lwn.net/Articles/695478/
> 
> The kernel has special behaviour for uid/gid 65534:
> 
> 1. The kernel maps UIDs > 65535 to it when some subsystem/API/fs
>    only supports 16bit UIDs, but a 32bit UID is passed to it.
> 
> 2. it's used by the kernel's user namespacing as the internal UID
>    that external UIDs are mapped to that don't have any local mapping.
> 
> 3. It's used by NFS for all user IDs that cannot be mapped locally if
>    UID mapping is enabled.
> 
> Most distributions already map (or are in the progress of changing)
> nobody/nogroup to the 65534 uid/gid, so lets do so as well.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  system/skeleton/etc/group  | 2 +-
>  system/skeleton/etc/passwd | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
