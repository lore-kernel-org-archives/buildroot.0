From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 23:45:43 +0200
Subject: [Buildroot] [PATCH 1/3] .gitlab-ci.yml: run our runtime tests
In-Reply-To: <20170702161324.485-1-arnout@mind.be>
References: <20170702161324.485-1-arnout@mind.be>
Message-ID: <20170702234543.2ad96550@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 2 Jul 2017 18:13:22 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> This commit improves our .gitlab-ci.yml logic to execute our runtime
> tests located in support/testing/. To do so, this commit:
> 
>  - Adds more Debian packages to be installed, namely the nose2 and
>    pexpect packages needed by the runtime testing infrastructure, as
>    well as the necessary Qemu emulators
> 
>  - The description of how to run the runtime tests. Each test is
>    executed as a separate Gitlab CI job, so that the status of each
>    test is easily visible in the Gitlab CI web interface.
> 
>  - The Makefile is improved to auto-generate .gitlab-ci.yml from
>    .gitlab-ci.yml.in, like we're doing for defconfigs. Since the
>    dependencies of .gitlab-ci.yml are no longer correct, we abandon
>    them and instead make it a PHONY target.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> [Arnout: simplify .gitlab-ci.in a little, removing redundant stuff;
>          make .gitlab-ci.yml a PHONY target]
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  .gitlab-ci.yml    | 33 +++++++++++++++++++++++++++++++++
>  .gitlab-ci.yml.in |  8 ++++++++
>  Makefile          |  7 +++++--
>  3 files changed, 46 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
