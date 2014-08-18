From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 18 Aug 2014 16:08:12 +0200
Subject: [Buildroot] [PATCH 0/6] CMake cleanup
In-Reply-To: <1408113551-29932-1-git-send-email-s.martin49@gmail.com>
References: <1408113551-29932-1-git-send-email-s.martin49@gmail.com>
Message-ID: <CAAXf6LVLzfn2epviETRe_Aaf6S64uak=VLC8vG2zx2Boa0iifA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Aug 15, 2014 at 4:39 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi all,
>
> Here is a short series cleaning up the {host-,}cmake-package
> infrastructure, and more specifically how the {C,CXX,LD}FLAGS are
> handled.
>
> The patches 1-4/6 are preliminary work for the fix for #7280
> (patch 5/6).
>
> The last patch of this series is nothing more than an RFC.
>
> Cheers,
>
> Samuel Martin (6):
>   package/pkg-cmake.mk: remove the USE_CCACHE CMake flag for
>     host-package
>   package/pkg-cmake.mk: set the {C,CXX,LD}FLAGS for host packages
>   toolchainfile.cmake.in: set linker flags
>   package/cdrkit: clean {HOST_,}CDRKIT_CONF_OPT
>   toolchainfile.cmake.in: do not force the CMAKE_{C,CXX}_FLAGS to the
>     cache
>   [RFC] package/pkg-cmake.mk: add ccache support for host packages
>
>  package/cdrkit/cdrkit.mk            |  7 -------
>  package/pkg-cmake.mk                | 15 ++++++++++++++-
>  support/misc/toolchainfile.cmake.in |  5 +++--
>  3 files changed, 17 insertions(+), 10 deletions(-)
>

I did a general test of this series (except for the last RFC patch) by
building some cmake (target) packages (flann, gtest, taglib, cdrkit)
and host-cdrkit. The compilation was successful, I have not done
runtime checks.

For the fifth patch, I have explicitly tested the failure scenario
described by the bug submitter.

I think we should merge these patches in buildroot-2014.08, as it fixes a bug.

For the sixth RFC patch, I cannot make statements. I do not know
enough of cmake to comment on it.

Best regards,
Thomas
