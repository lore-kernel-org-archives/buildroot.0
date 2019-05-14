From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 17:47:29 +0200
Subject: [Buildroot] [PATCH v4 1/7] boot/optee-os: correct TA files
 install
In-Reply-To: <20190514085319.9031-1-etienne.carriere@linaro.org>
References: <20190514085319.9031-1-etienne.carriere@linaro.org>
Message-ID: <20190514174729.0c503675@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 May 2019 10:53:13 +0200
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> This change corrects TA binary files install sequence that
> were previously install in target filesystem though
> OPTEE_OS_INSTALL_IMAGES_CMDS instead of expected
> OPTEE_OS_INSTALL_TARGET_CMDS.
> 
> This change removes useless mkdir prior call to $(INSTALL)
> that already handles parent directory creation when needed.
> 
> This change conditions .ta files install upon their
> generation as a custom package repository may not generate
> any .ta files.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
> Changes v3 -> v4:
> - No change
> Changes v2 -> v3:
> - No change
> Changes v1 -> v2:
> - Patch introduced in v2
> ---
>  boot/optee-os/optee-os.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
