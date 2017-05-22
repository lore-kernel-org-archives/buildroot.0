From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 21:58:12 +0200
Subject: [Buildroot] [PATCH v3 next] flex: bump version to 2.6.4
In-Reply-To: <20170510135139.30976-1-Vincent.Riera@imgtec.com>
References: <20170510135139.30976-1-Vincent.Riera@imgtec.com>
Message-ID: <20170522215812.078b9c7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 May 2017 14:51:39 +0100, Vicente Olivert Riera wrote:
> - 0001 patch removed. It doesn't apply on this version and is also not
>   necessary since the AR binary is now handled correctly with AR = @AR at .
> - 0002 patch removed. It's already included in this release:
>   https://github.com/westes/flex/commit/a5cbe929ac3255d371e698f62dc256afe7006466
> - The flex project has moved to GitHub, so modify the URLs in both
>   flex.mk and Config.in files.
> - The sed command over Makefile.in to prevent the flex binary to be
>   built fails, so remove it. That logic has been moved to
>   src/Makefile.in, and whenever we disable the flex binary to be built
>   then the compilation fails when building the documentation because
>   some bits require "../src/flex", which is the flex binary.
>   We prevent building the flex binary and the documentation using a new
>   patch.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

This commit causes a major bug: host-flex no longer builds/installs the
"flex" program. This will cause a huge number of build failures,
because there are a lot of packages that depend on host-flex to get the
flex program.

Could you send a patch that fixes this? Either revert back to the
previous solution of patching the Makefile.in in flex.mk, or adding a
proper configure.ac option to enable/disable building/installation the
flex program.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
