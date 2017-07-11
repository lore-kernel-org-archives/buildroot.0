From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Jul 2017 23:13:06 +0200
Subject: [Buildroot] [RFC v1] libv4l: build utils only on MMU (with fork
 support) platforms
In-Reply-To: <20170711172624.7516-1-ps.report@gmx.net>
References: <20170711172624.7516-1-ps.report@gmx.net>
Message-ID: <20170711231306.7405dea8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Jul 2017 19:26:24 +0200, Peter Seiderer wrote:
> Fixes [1]:
> 
>     CXXLD    v4l2-compliance
>   .../output/build/libv4l-1.12.5/lib/libv4lconvert/.libs/libv4lconvert.so: undefined reference to `fork'
>   collect2: error: ld returned 1 exit status
> 
> [1] http://autobuild.buildroot.net/results/7e8/7e8fbd99a8c091d7bbeedd16066297682bbe29fe
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> The libv4l build for noMMU platforms was enabled with commit 'package/libv4l:
> allow build of v4l2 utilities on noMMU platforms' (see [2]). But libv4lconvert uses
> fork internally, so all utils linking against fail to build. Fix this by disabling
> the utils on noMMU platforms (so keep building all libraries).
> 
> Alternatives would be:
> 
> - disable libv4l on all noMMU platforms (not only the utils), revert a part
>   of commit [2]
> 
> - create a patch to disable only libv4lconvert (and all dependend utils)
>   on noMMU platforms
> 
> [2] https://git.buildroot.net/buildroot/commit/?id=f837251785e9389f53d695ddb8a094707865171b

Hugues, could you comment on this, since you originally re-enabled
libv4l for noMMU architectures ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
