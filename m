From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Apr 2018 14:53:39 +0200
Subject: [Buildroot] [PATCH] bluez5_utils: add patch to fix readline
 issue
In-Reply-To: <20180420140713.16271-1-thomas.petazzoni@bootlin.com>
References: <20180420140713.16271-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180421145339.22f2ea88@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Apr 2018 16:07:13 +0200, Thomas Petazzoni wrote:
> Since bluez5_utils 5.49, some code using readline was compiled even if
> readline was not available. After this issue was reported upstream, a
> patch was proposed by an upstream developer to address the issue. This
> commit integrates this patch (under review upstream), which fixes the
> problem.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/3e266a79acab8b8eb33360f7afbc1cd6db46f7cb/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...Is-shall-only-be-build-if-readline-is-pre.patch | 32 ++++++++++++++++++++++
>  package/bluez5_utils/bluez5_utils.mk               |  2 ++
>  2 files changed, 34 insertions(+)
>  create mode 100644 package/bluez5_utils/0001-bt_shell-APIs-shall-only-be-build-if-readline-is-pre.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
