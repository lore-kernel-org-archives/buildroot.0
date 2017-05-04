From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 17:12:48 +0200
Subject: [Buildroot] [PATCH 1/1] uboot-tools: disable libfdt swig wrapper
In-Reply-To: <1493697677-24802-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1493697677-24802-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170504171248.77c9f3ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 May 2017 23:01:17 -0500, Matt Weber wrote:
> The current tools build assumes the host system
> when trying to detect if swig/python are present.
> It then uses those tools from the path.
> 
> The upstream RFC included this commit set's patch
> but offered up discussion on how to cleanly
> introduce a better method for detecting swig and
> using the tools.  The tools build really needs to
> be sysroot and prefix/host dir tools aware.
> 
> Upsteam submission for RFC:
> https://lists.denx.de/pipermail/u-boot/2017-May/289520.html
> 
> Workaround for:
> http://autobuild.buildroot.net/results/6d5/6d52ac8bb71012aea6fc4c679691b31a3366728b
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  ...nditionally-disable-python-libfdt-wrapper.patch | 44 ++++++++++++++++++++++
>  package/uboot-tools/uboot-tools.mk                 |  5 +++
>  2 files changed, 49 insertions(+)
>  create mode 100644 package/uboot-tools/0005-tools-conditionally-disable-python-libfdt-wrapper.patch

As I said, I'm not entirely happy with this solution, but it does the
job for now, and nobody has provided a different patch.

So: applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
