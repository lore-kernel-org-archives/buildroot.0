From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Aug 2016 17:21:31 +0200
Subject: [Buildroot] [PATCH v2] ffmpeg: fix bfin compile
In-Reply-To: <20160821221421.GA7744@waldemar-brodkorb.de>
References: <20160821221421.GA7744@waldemar-brodkorb.de>
Message-ID: <20160822172131.222e06fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 Aug 2016 00:14:22 +0200, Waldemar Brodkorb wrote:
> A gcc bug is triggered when Os/O2/O3 is used to compile the function.
> Just force O1 for the problematic function for Blackfin.
> See gcc bug report:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77311
> 
> Fixes:
>   http://autobuild.buildroot.net/results/1118d568959006b7f973761884fd3f4b63be19b1/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>  - report bug to gcc project add SoB to patch, requested by Thomas Petazzoni
> ---
>  .../ffmpeg/0013-bfin-disable-optimization.patch    | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/ffmpeg/0013-bfin-disable-optimization.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
