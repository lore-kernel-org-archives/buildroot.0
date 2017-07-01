From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 00:36:03 +0200
Subject: [Buildroot] [PATCH] linuxptp: don't check host headers for
 target features
In-Reply-To: <70c812411b4b8408a4cfac95ef66d13fea893102.1498943375.git.baruch@tkos.co.il>
References: <70c812411b4b8408a4cfac95ef66d13fea893102.1498943375.git.baruch@tkos.co.il>
Message-ID: <20170702003603.70eb8dfe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Jul 2017 00:09:35 +0300, Baruch Siach wrote:
> The incdefs.sh script runs ${CROSS_COMPILE}cpp to get a list of default
> headers directories. Make sure CROSS_COMPILE is set correctly to avoid check
> of host headers.
> 
> Also, drop the CC command line override. Upstream makefile sets CC to
> $(CROSS_COMPILE)gcc.
> 
> Should fix:
> http://autobuild.buildroot.net/results/394/394414df25b0b7261b27ca5d4901fde0f639e73c/
> http://autobuild.buildroot.net/results/6ad/6adbc8c77c2ca70246b31600ab66b37c56c1e89e/
> http://autobuild.buildroot.net/results/70d/70dfd05acc9d951169267f2820ecedb37f0711fe/
> 
> Cc: Petr Kulhavy <brain@jikos.cz>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/linuxptp/linuxptp.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
