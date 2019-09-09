From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 9 Sep 2019 09:29:31 -0500
Subject: [Buildroot] [PATCH v2 10/12] core: allow to use Clang as
 cross-compiler
In-Reply-To: <20190907094027.9537-11-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
 <20190907094027.9537-11-romain.naour@smile.fr>
Message-ID: <CANQCQpaArjmSRm7t_y49Lt_L99sZfn2-pRND-hwnDLzpLqspMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sat, Sep 7, 2019 at 4:40 AM Romain Naour <romain.naour@smile.fr> wrote:
>
> Add this new experimental option into "Advanced" menu since
> we are expecting some build and runtime issues for number of
> packages (bootloaders, kernel).
>
> Add host-clang as dependency in toolchain virtual package
> in order to be sure that the clang cross-compiler is built
> before generating Buildroot.cmake file from an
> TOOLCHAIN_CMAKE_INSTALL_FILES hook (defined in cmake package).
> Buildroot.cmake can be used by a cmake package as soon as
> the toolchain package is installed.
>
> Install the GCC external toolchain before executing
> realpath command by adding an explicit dependency on
> toolchain-external. Without this dependency, host-clang
> may be build before toolchain-external when
> BR2_USER_HOST_CLANG_AS_CROSS_COMPILER=y, so the realpath
> fail to set GCC_INSTALL_PREFIX leading to
> "crtbegin.o no such file or directory" error while linking
> applications.
>
> Only Glibc toolchain has been tested.
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Valentin Korenblit <valentinkorenblit@gmail.com>

Did a build time test using the qemu aarch64 configuration, selecting
the prebuilt external toolchain and enabling the Clang as
cross-compiler option.

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
