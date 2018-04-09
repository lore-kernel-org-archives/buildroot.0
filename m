From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 20:59:17 +0200
Subject: [Buildroot] [PATCH] patch: add upstream security fix
In-Reply-To: <653d97fd8ac542e3eac3c0a78dc701a7033ba39a.1523290836.git.baruch@tkos.co.il>
References: <653d97fd8ac542e3eac3c0a78dc701a7033ba39a.1523290836.git.baruch@tkos.co.il>
Message-ID: <20180409205917.4bf6a8d3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 Apr 2018 19:20:36 +0300, Baruch Siach wrote:
> Fixes CVE-2018-1000156: arbitrary command execution in ed-style patches.
> 
> Depend on MMU for now, because the patch adds a fork() call. Upstream
> later switched to gnulib provided execute(), so this dependency can be
> dropped on the next version bump.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...-files-to-be-missing-for-ed-style-patches.patch |  37 +++++
>  ...ry-command-execution-in-ed-style-patches-.patch | 157 +++++++++++++++++++++
>  package/patch/Config.in                            |   2 +
>  3 files changed, 196 insertions(+)
>  create mode 100644 package/patch/0002-Allow-input-files-to-be-missing-for-ed-style-patches.patch
>  create mode 100644 package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
