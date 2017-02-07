From: Luca Ceresoli <lucaceresoli77@gmail.com>
Date: Tue, 7 Feb 2017 11:15:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/openocd: fix autobuild failure
In-Reply-To: <dafa5878ec5dd9e55107657faf46560fb7aeb9d3.1486440154.git.sam.bobroff@au1.ibm.com>
References: <dafa5878ec5dd9e55107657faf46560fb7aeb9d3.1486440154.git.sam.bobroff@au1.ibm.com>
Message-ID: <a4955e4a-4a46-1ae4-6db4-98302ebaf54b@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

On 07/02/2017 05:02, Sam Bobroff wrote:
> See the included package patch for a description of the issue, which
> causes the doc target to be rebuilt, which fails and breaks the build.
> Fix it by removing the doc subdirectory from the build.
> 
> Fixes
> http://autobuild.buildroot.net/results/53ed571327c814a23fcf03c7ad5bcd551b6732a6
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---
> 
>  package/openocd/0003-disable-docs.patch | 37 +++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/openocd/0003-disable-docs.patch
> 
> diff --git a/package/openocd/0003-disable-docs.patch b/package/openocd/0003-disable-docs.patch
> new file mode 100644
> index 000000000..36fb152ee
> --- /dev/null
> +++ b/package/openocd/0003-disable-docs.patch
> @@ -0,0 +1,37 @@
> +doc: do not build
> +
> +Due to the way the version file is handled by a special script that encodes the
> +file modification time as a human readable *local* time value, a clean build
> +will sometimes, depending on the local time zone, attempt to re-build the
> +documentation, which may fail.
> +
> +We don't want the documentation so fix this by disabling it.

Can't we instead add a --disable-docs flag to openocd and upstream it?
The patch you proposed is not for upstream, so we'd have to carry it in
Buildroot potentially forever.

-- 
Luca
