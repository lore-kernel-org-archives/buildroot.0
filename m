From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 08:40:43 +0200
Subject: [Buildroot] [PATCH] lz4: fix host build with glibc older than
 2.17
In-Reply-To: <81c4c77f0304c32bd46c98bdd34da22c62c4c51e.1524197840.git.baruch@tkos.co.il>
References: <81c4c77f0304c32bd46c98bdd34da22c62c4c51e.1524197840.git.baruch@tkos.co.il>
Message-ID: <20180420084043.256c7e27@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Apr 2018 07:17:20 +0300, Baruch Siach wrote:
> glibc before 2.17 require the -lrt linker option for clock_gettime(). We
> do not support pre 2.17 glibc for the target anymore, but there are
> still host platforms with these versions. Add upstream patch to skip use
> of clock_gettime() with older glibc versions.
> 
> Should fix:
> http://autobuild.buildroot.net/results/bc5/bc5d6447ab16a61d9dcf56723106f0b107826ef4/
> http://autobuild.buildroot.net/results/7dd/7dd47bef902845a0f7803f1a6c702ec154855858/
> http://autobuild.buildroot.net/results/952/9523dbc767dc325befabeb9240c4009e78779c7d/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...rictive-conditions-for-clock_gettime.patch | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 package/lz4/0001-use-more-restrictive-conditions-for-clock_gettime.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
