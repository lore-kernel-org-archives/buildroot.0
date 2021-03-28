From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:56:43 +0200
Subject: [Buildroot] [PATCH 1/2] package/pkg-meson.mk: fix setting host
 C++ compiler
In-Reply-To: <20210323163051.1284416-1-joerg.krause@embedded.rocks>
References: <20210323163051.1284416-1-joerg.krause@embedded.rocks>
Message-ID: <20210328225643.75421467@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Mar 2021 17:30:50 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Commit f4a61d1ae23ec7729af3a8a165bbee45b6b9ef75 introduced CC_FOR_BUILD and
> CXX_FOR_BUILD to avoid detecting ccache.
> 
> Both values are set to `HOSTCC`. This causes issues where C++ files are
> compiled with the C compiler without passing the `stdc++` flag to the
> linker, too.
> 
> Therefore, switch to pass the C++ compiler to CXX_FOR_BUILD.
> 
> Correctly fixes:
> http://autobuild.buildroot.org/results/871e1362c44e5b68a149e6a5dd3caf99ea0d904a
> 
> Commit 9783c04aaf5e4fc94099772f1dc699a974ee6538 proposed a fix which in
> fact is a workaround to get Meson to pass the `stdc++` flag to the C
> linker.
> 
> A fellow-up commit will revert this commit, as it is no longer
> needed.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/pkg-meson.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, both applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
