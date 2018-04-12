From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 21:15:41 +0200
Subject: [Buildroot] [PATCH v2] package/llvm: remove $ORIGIN/../lib from
 RPATH
In-Reply-To: <20180412123628.26076-1-valentin.korenblit@smile.fr>
References: <20180412123628.26076-1-valentin.korenblit@smile.fr>
Message-ID: <20180412211541.174834d5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Apr 2018 14:36:28 +0200, Valentin Korenblit wrote:
> AddLLVM.cmake adds $ORIGIN/../lib to the RPATH of llvm binaries.
> This causes a problem when llvm-config from host installed in
> STAGING_DIR is executed under the following conditions:
> 
> *Target architecture same as host architecture (normally x86_64)
> *Target's libc different from host's libc (normally glibc)
> 
> llvm-config will try to link with the target's libc, resulting in:
> 
> ./llvm-config: error while loading shared libraries: libc.so.0:
> cannot open shared object file: No such file or directory.
> 
> Link to autobuild error:
> http://autobuild.buildroot.net/results/b81c12d529c66a028e2297ea5ce1d6930324fa69/
> 
> To avoid this, add HOST_LLVM_CONF_OPTS += -DCMAKE_INSTALL_RPATH="$(HOST_DIR)/lib"
> 
> Link to discussion:
> http://lists.busybox.net/pipermail/buildroot/2018-April/218627.html
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> ---
> Changes v1 -> v2:

Applied to master with some minor tweaks to the commit log and comment
in the code. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
