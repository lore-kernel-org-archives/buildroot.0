From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 11 Jan 2010 09:14:50 -0500
Subject: [Buildroot] [PATCH 1/2] Support for a kernel-modules catagory
In-Reply-To: <1263060020.18571.8.camel@venture>
References: <1263060020.18571.8.camel@venture>
Message-ID: <a038bef51001110614y2d1e6130gc88bc5b0cc90d19@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 9, 2010 at 1:00 PM, Clark Rawlins <clark.rawlins@escient.com> wrote:
> Add support for a catagory of packages called
> "Extra kernel modules" in menuconfig and a
> new subdirectory similar to the "editors"
> subdirectory to hold the kernel-modules packages.
> diff --git a/package/kernel-modules/Config.in b/package/kernel-modules/Config.in
[snip]
> new file mode 100644
> index 0000000..ddd27c3
> --- /dev/null
> +++ b/package/kernel-modules/Config.in
> @@ -0,0 +1,3 @@
> +menu "Extra Kernel Modules"
> +source "package/kernel-modules/cdfs/Config.in"
> +endmenu

This depends on code in your next patch. Perhaps just start with an
empty menu then add the cdfs part in your next patch. I'm not sure how
pedantic buildroot is with creating git bisect points that build.
