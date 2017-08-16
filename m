From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 23:09:53 +0200
Subject: [Buildroot] [PATCH 1/3] whois: fix build with NLS disabled
In-Reply-To: <37040459db3e6ca01e2dc8236cf57a993f1831ed.1502649259.git.baruch@tkos.co.il>
References: <37040459db3e6ca01e2dc8236cf57a993f1831ed.1502649259.git.baruch@tkos.co.il>
Message-ID: <20170816230953.7bfcfc57@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Aug 2017 21:34:17 +0300, Baruch Siach wrote:
> whois build uses the xgettext utility to build translation files.
> This utility may not be available when NLS is disabled. Omit the pos and
> install-pos Makefile targets from the default and the install targets
> when NLS is disabled, respectively.
> 
> Fixes:
> http://autobuild.buildroot.net/results/862/862d8165a59711c970c65d90009a527315a1a6b4/
> http://autobuild.buildroot.net/results/b62/b62ec9d6f350e409731d47ffb585344c516944e8/
> http://autobuild.buildroot.net/results/be2/be28d06ae004a46c87133d6f07709c6f909288d8/
> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/whois/whois.mk | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
