From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 22:41:28 +0100
Subject: [Buildroot] [PATCH] nilfs-utils: needs threads support
In-Reply-To: <9b6db0c182b7adc0dbc24bf62e9c7464859f5e6c.1514893343.git.baruch@tkos.co.il>
References: <9b6db0c182b7adc0dbc24bf62e9c7464859f5e6c.1514893343.git.baruch@tkos.co.il>
Message-ID: <20180102224128.5cdcd9a5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Jan 2018 13:42:23 +0200, Baruch Siach wrote:
> nilfs-utils uses the sem_* family of functions from the realtime
> extension. Technically this is not part of pthreads. But in uClibc
> enabling threads enables also UCLIBC_HAS_REALTIME.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c5d/c5d93b6ab5b260fe5db46298b956a9ae765c828a/
> http://autobuild.buildroot.net/results/9d6/9d6a248f9acbb58b6c2893de58978c6013332415/
> 
> Cc: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/nilfs-utils/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
