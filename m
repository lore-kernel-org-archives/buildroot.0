From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 19:04:59 +0100
Subject: [Buildroot] [PATCH 1/1] systemd: downgrade kernel headers
 minimum version to 3.7
In-Reply-To: <1414666453-18288-1-git-send-email-cvubrugier@fastmail.fm>
References: <1414666453-18288-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <20141030190459.0f512085@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Thu, 30 Oct 2014 11:54:13 +0100, Christophe Vu-Brugier wrote:
> The kernel headers minimum version for systemd was bumped to 3.8
> (IFLA_GRE_FLOWINFO and IFLA_IPTUN_FLAGS definitions) and then to 3.10
> (IFLA_VLAN_PROTOCOL definition). However, systemd since version v215
> contains the following patch that defines IFLA_* constants if
> needed:
> 
>   81577dc missing.h: add various network enums
>   http://cgit.freedesktop.org/systemd/systemd/commit/?id=81577dc
> 
> As a consequence, this patch downgrades the kernel headers minimum
> version to linux 3.7 which is required for BPF_XOR.
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> ---
>  system/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
