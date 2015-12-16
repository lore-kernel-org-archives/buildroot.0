From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 23:38:27 +0100
Subject: [Buildroot] [PATCH] libass: allow compilation without a system
 font provider
In-Reply-To: <1450300308-8371-1-git-send-email-yann.morin.1998@free.fr>
References: <1450300308-8371-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151216233827.7c87780a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 16 Dec 2015 22:11:48 +0100, Yann E. MORIN wrote:
> From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> If no system font provider is provided, then libass will fail to build
> because it requires one by default. The error looks like this:
> 
>     configure: error: Either DirectWrite (on Windows), CoreText (on OSX),
>     or Fontconfig(Linux, other) is required. If you really want to compile
>     withouta system font provider, add --disable-require-system-font-provider
> 
> (typo is from the actual message)
> 
> But, as the error messages says, we can allow the compilation without a
> system font provider if we use the above configure option, so let's do
> it.
> 
> Fixes:
>     http://autobuild.buildroot.net/results/3a4/3a4c07a0a54d5497fa8a4be2191856e286729637/
>     http://autobuild.buildroot.org/results/d5a/d5a93b5a870de748259b097ec0b98b207cfaa303/
>     and many others...
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> [yann.morin.1998 at free.fr: move the --disable option in the !fontconfig
>  case]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libass/libass.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
