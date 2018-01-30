From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jan 2018 22:58:23 +0100
Subject: [Buildroot] [PATCH 1/3] eudev: fix error handling init script
In-Reply-To: <20180130040720.20172-1-casantos@datacom.ind.br>
References: <20180130040720.20172-1-casantos@datacom.ind.br>
Message-ID: <20180130225823.190c0cf3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Jan 2018 02:07:18 -0200, Carlos Santos wrote:
> Replace (echo "msg" && exit 1) by { echo "msg"; exit 1; }.
> 
> The (list) compound command runs in a subshell, so the "exit" interrupts
> the subshell, not the main script. Examples:
> 
>     $ sh -c "echo 1; (exit 1); echo 2"
>     1
>     2
>     $ sh -c "echo 1; { exit 1; }; echo 2"
>     1
>     $
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/eudev/S10udev | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
