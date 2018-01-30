From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jan 2018 22:58:28 +0100
Subject: [Buildroot] [PATCH 2/3] eudev: fix printf usage in init script
In-Reply-To: <20180130040720.20172-2-casantos@datacom.ind.br>
References: <20180130040720.20172-1-casantos@datacom.ind.br>
 <20180130040720.20172-2-casantos@datacom.ind.br>
Message-ID: <20180130225828.4aab000c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Jan 2018 02:07:19 -0200, Carlos Santos wrote:
> Using a variable in a printf format string may lead to undesirable
> results if the variable contains format controls, so replace
> 
>     printf "foo $var bar"
> 
> by
> 
>     printf "foo %s bar" "$var"
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
