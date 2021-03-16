From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 22:00:31 +0100
Subject: [Buildroot] [PATCH v1] package/sane-backends: fix gcc-4.8
 compile
In-Reply-To: <20210315201345.4567-1-ps.report@gmx.net>
References: <20210315201345.4567-1-ps.report@gmx.net>
Message-ID: <20210316220031.19a4cdc8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Mar 2021 21:13:45 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Add patch to use legacy initializer variant to fix gcc-4.8 compile.
> 
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/9d1cd0d0aa8c929c4b1b23b04075c331c1be80e0
> 
>   genesys/utilities.h:229:23: error: invalid initialization of non-const reference of type 'std::basic_ios<char>&' from an rvalue of type '<brace-enclosed initializer list>'
>            stream_{stream}
>                          ^
>   genesys/image_pipeline.cpp:715:19: error: invalid initialization of non-const reference of type 'genesys::ImagePipelineNode&' from an rvalue of type '<brace-enclosed initializer list>'
>        source_{source}
>                      ^
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  .../0002-genesys-fix-gcc-4.8-compile.patch    | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 package/sane-backends/0002-genesys-fix-gcc-4.8-compile.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
