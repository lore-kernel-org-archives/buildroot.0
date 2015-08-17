From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Aug 2015 22:43:26 +0200
Subject: [Buildroot] [PATCH] clapack: musl patches
In-Reply-To: <20150815161506.GA28405@vostro>
References: <20150815161506.GA28405@vostro>
Message-ID: <20150817224326.0e40b56f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 15 Aug 2015 19:15:06 +0300, Alex Suykov wrote:
> Fixes
> http://autobuild.buildroot.net/results/a94f097193cd5444dee5cd9df9d544ce736a7e7e/
> http://autobuild.buildroot.net/results/036014e492f7caf793b92a9822ab6a0b1a54f2e8/
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/clapack/0006-remove-uninit-f2c.patch | 24 ++++++++++++++++++++++++
>  package/clapack/0007-off64-t.patch           | 16 ++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 package/clapack/0006-remove-uninit-f2c.patch
>  create mode 100644 package/clapack/0007-off64-t.patch

To be honest, I was a bit hesitant to add the patch that removes
uninit.c from the build, as the entire clapack thing looks a bit
complicated, and doing such a change without upstream's opinion is
dangerous. However, clapack is not that widely used I believe, so let's
see if that proposal breaks anything for anyone.

Alex, could you submit the two patches you have written to the upstream
clapack project?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
