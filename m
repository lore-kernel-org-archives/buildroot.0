From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 14:47:06 +0200
Subject: [Buildroot] [PATCH v3] vlc: fix compile error with uClibc-ng
 Linuxthreads
In-Reply-To: <20160826212727.GA21169@waldemar-brodkorb.de>
References: <20160826212727.GA21169@waldemar-brodkorb.de>
Message-ID: <20160827144706.6df2379a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Aug 2016 23:27:27 +0200, Waldemar Brodkorb wrote:
> The fallback code path didn't work correctly, so fix it.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/3122287ddea1e316a64ccf0d0dc9415bfefebb49/
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v2 -> v3:
>  - use git format patch, requested by Thomas Petazzoni
>  - remove unneeded -lpthread, requested by Thomas Petazzoni
> v1 -> v2:
>  - rework autobuild failure, there is fallback code for non-NPTL,
>    so fix it up. Suggested by Thomas Petazzoni
> ---
>  ...ck-code-and-add-required-realtime-library.patch | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/vlc/0008-fix-fallback-code-and-add-required-realtime-library.patch

I've applied to master. But in fact, the change in VLC should have made
using two separate patches, as they are not directly related.

Could you please split them in two patches, and submit them upstream?
Once it gets accepted upstream, we can backport the final version.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
