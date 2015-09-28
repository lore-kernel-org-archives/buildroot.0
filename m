From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Sep 2015 21:27:55 +0200
Subject: [Buildroot] [PATCH] libstrophe: add a patch to fix static builds
In-Reply-To: <1443431833-24753-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1443431833-24753-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150928212755.617bdb10@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 28 Sep 2015 10:17:13 +0100, Vicente Olivert Riera wrote:
> libstrophe.a and libcrypto.a have symbols with equal names, so
> executables can't be statically linked with libstrophe and openssl:
> 
> sha1dgst.c:(.text+0x1b4c): multiple definition of `SHA1_Update'
> sha1dgst.c:(.text+0x1cc0): multiple definition of `SHA1_Final'
> sha1dgst.c:(.text+0x1e78): multiple definition of `SHA1_Init
> 
> Renaming the internal SHA functions fixes the problem.
> 
> Issue reported upstream:
> 
>   https://github.com/strophe/libstrophe/issues/40
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/047/047e319b9d7bf0cdaabc007326a6d67de2c1ee52/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/libstrophe/libstrophe.mk |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
