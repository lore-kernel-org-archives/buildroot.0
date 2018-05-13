From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 21:39:57 +0200
Subject: [Buildroot] [PATCH] libkrb5: disable rpath
In-Reply-To: <2d3716532e37e7fd57c930fcca6e4656ec7fa649.1526236679.git.baruch@tkos.co.il>
References: <2d3716532e37e7fd57c930fcca6e4656ec7fa649.1526236679.git.baruch@tkos.co.il>
Message-ID: <20180513213957.7925756d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 May 2018 21:37:59 +0300, Baruch Siach wrote:
> The default rpath value for krb5 is /usr/lib. On some hosts this might
> confuse the build time linker as it looks for target libraries in the
> host /usr/lib directory.
> 
> Should fix:
> http://autobuild.buildroot.net/results/6df/6df84ed325ddd92248741d2f4737423b1b999489/
> http://autobuild.buildroot.net/results/049/049f5147288b418402b6e5a4181eff4d426c8d7a/
> http://autobuild.buildroot.net/results/432/432d5d0295f77cd34b78e70e8b4b7d77ef19ae3c/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libkrb5/libkrb5.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
