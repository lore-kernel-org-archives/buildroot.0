From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 14:29:39 +0200
Subject: [Buildroot] [PATCH v8 04/12] e2fsprogs: remove uuidgen support
In-Reply-To: <20170422115955.22718-5-arnout@mind.be>
References: <20170422115955.22718-1-arnout@mind.be>
 <20170422115955.22718-5-arnout@mind.be>
Message-ID: <20170422142939.059c5ea6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Apr 2017 13:59:47 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: Carlos Santos <casantos@datacom.ind.br>
> 
> In fact, uuidgen was never built because we pass --disable-libuuid. So
> the option was a NOP.
> 
> Remove the license info for libuuid.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> [Arnout:
>  - do not remove --disable-uuidd - even though that is implied by
>    --disable-libuuid, it's better to be explicit about it;
>  - remove license info of libuuid]
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/e2fsprogs/Config.in    | 7 +++----
>  package/e2fsprogs/e2fsprogs.mk | 5 ++---
>  2 files changed, 5 insertions(+), 7 deletions(-)

Applied to master, thanks. I suppose the logic for not having a
Config.in.legacy entry is that the tool had never been installed
anyway, so nobody could have been relying on this option to install
uuidgen. Am I right?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
