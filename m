From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 19:55:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/exiv2: fix build without SSP
In-Reply-To: <20210701174719.112866-1-fontaine.fabrice@gmail.com>
References: <20210701174719.112866-1-fontaine.fabrice@gmail.com>
Message-ID: <20210718195549.4b091ea9@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu,  1 Jul 2021 19:47:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build without SSP fails since bump to version 0.27.4 in commit
> bcace429426ee91aac56f3dcc33b69e22141d384
> 
> This is due to the fact that
> https://github.com/Exiv2/exiv2/commit/bbe0b70840cf28b7dd8c0b7e9bb1b741aeda2efd
> removed the wrong GCC_ prefix from HAS_FSTACK_PROTECTOR_STRONG variable
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ae4635899124c602c70d2b342a76f95c34aa4a3d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...dd-BUILD_WITH_STACK_PROTECTOR-option.patch | 52 +++++++++++++++++++
>  package/exiv2/exiv2.mk                        |  4 +-
>  2 files changed, 55 insertions(+), 1 deletion(-)
>  create mode 100644 package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
