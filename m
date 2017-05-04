From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 17:13:51 +0200
Subject: [Buildroot] [PATCH 1/1] libqmi: musl compat
 canonicalize_file_name
In-Reply-To: <1493688546-37339-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1493688546-37339-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170504171351.363ce452@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 May 2017 20:29:06 -0500, Matt Weber wrote:
> Adds an inline equivalent of canonicalize_file_name
> using realpath().
> 
> Bug report (origin of this patch):
> https://bugs.freedesktop.org/show_bug.cgi?id=99944
> 
> Resolves:
> http://autobuild.buildroot.net/results/afa/afa4b97e012586585b11be1e70ed3c63a7c48a4d/
> 
>   CCLD     test-generated
>   CCLD     test-utils
>   CCLD     test-message
> ../../../src/libqmi-glib/.libs/libqmi-glib.so: undefined reference to `canonicalize_file_name'
> collect2: error: ld returned 1 exit status
> Makefile:440: recipe for target 'test-generated' failed
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  .../0001-musl-compat-canonicalize_file_name.patch  | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/libqmi/0001-musl-compat-canonicalize_file_name.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
