From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Oct 2015 18:56:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: add patch to fix musl
 build issue on x86
In-Reply-To: <1446188767-14602-1-git-send-email-joerg.krause@embedded.rocks>
References: <1446188767-14602-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151031185624.378650cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 30 Oct 2015 08:06:07 +0100, J?rg Krause wrote:
> This patch is replaces two previous sumbissions, the first by Bernd Kuhls [1],
> the second by me [2].
> 
> The posix_memalign declaration is incompatible with musl for C++ on x86, because
> of the exception specification [2]. Note, the referenced patch is part of a
> patch series to "Add musl support to GCC".
> 
> However, this build issue only happens if compilation is done with the GCC
> compiler option '-pedantic' [3] which is done so in jsoncpp.
> 
> Fortunately, upstream accepted a patch to opt-out '-pedantic' [4]. We backport
> this patch to fix autobuild errors.
> 
> Fixes:
> http://autobuild.buildroot.net/results/588/5885d33b8d9f17878f565f3ae5371017dc89aede/
> http://autobuild.buildroot.net/results/0d9/0d90c7c13ae1640b07709c4c686e0237ada1324d/
> http://autobuild.buildroot.net/results/30b/30b98ac7362c27254218a6e521d29971070f8c3c/
> http://autobuild.buildroot.net/results/292/29289c125166630aeaf884ccc006bcf12c8aa0f6/
> 
> and many more.
> 
> [1] https://patchwork.ozlabs.org/patch/505425/
> [2] https://patchwork.ozlabs.org/patch/533169/
> [3] https://gcc.gnu.org/ml/gcc-patches/2015-05/msg01425.html
> [4] https://github.com/open-source-parsers/jsoncpp/commit/48bfe910622d79507983fc36254ca9f3ca63acb6
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../0002-Add-option-JSONCPP_WITH_STRICT_ISO.patch  | 68 ++++++++++++++++++++++
>  package/jsoncpp/jsoncpp.mk                         |  3 +-
>  2 files changed, 70 insertions(+), 1 deletion(-)
>  create mode 100644 package/jsoncpp/0002-Add-option-JSONCPP_WITH_STRICT_ISO.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
