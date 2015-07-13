From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 22:39:15 +0200
Subject: [Buildroot] [PATCH] atftp: fix build with gcc5
In-Reply-To: <ac8be3f9d655c21dbc07a66ad3a459c00a67ae17.1436815178.git.baruch@tkos.co.il>
References: <ac8be3f9d655c21dbc07a66ad3a459c00a67ae17.1436815178.git.baruch@tkos.co.il>
Message-ID: <20150713223915.7d215c0a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 13 Jul 2015 22:19:38 +0300, Baruch Siach wrote:
> gcc5 defaults to -std=gnu11 which changes the inline semantics. This leads to
> multiple definition error with 'extern inline'. See
> https://gcc.gnu.org/gcc-5/porting_to.html for the details.
> 
> Fixes:
> http://autobuild.buildroot.net/results/762/762bce2bbc1f994cc796f0442bfa73b7ad64e272/
> http://autobuild.buildroot.net/results/28b/28bf6018dcf91ddacfb76f54a92313da8bf182e1/
> http://autobuild.buildroot.net/results/fde/fdee23ecd0c5c66fda1ed38efe43048ce934b733/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/atftp/atftp.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
