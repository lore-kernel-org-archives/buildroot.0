From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 17:47:33 +0200
Subject: [Buildroot] [PATCH v4 2/7] boot/optee-os: install trusted
 shared libraries
In-Reply-To: <20190514085319.9031-2-etienne.carriere@linaro.org>
References: <20190514085319.9031-1-etienne.carriere@linaro.org>
 <20190514085319.9031-2-etienne.carriere@linaro.org>
Message-ID: <20190514174733.46e24099@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 May 2019 10:53:14 +0200
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Install generated trusted shared libraries in the target file
> system next to the trusted applications.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
> Changes v3 -> v4:
> - Fix trusted shared libraries install source path
> Changes v2 -> v3:
> - Install shared trusted libs from OPTEE_OS_LOCAL_SDK (build
>   dir) instead of $(OPTEE_OS_SDK) (staging dir) that is
>   populated only upon BR2_TARGET_OPTEE_OS_SDK=y.
> Changes v1 -> v2:
> - Fixes on .ta file install commands move to a specific patch
> - Fix BR2_TARGET_OPTEE_OS_SERVICES 1-string description
> - Replace conditional commands in .ta files install commands
>   with Makefile script level conditionals
> ---
>  boot/optee-os/Config.in   | 14 +++++++-------
>  boot/optee-os/optee-os.mk |  3 +++
>  2 files changed, 10 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
