From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 21:24:07 +0200
Subject: [Buildroot] [RFC PATCH 1/4] .gitlab-ci.yml: save rootfs as
 artifact for runtime tests
In-Reply-To: <20170730044946.11999-1-ricardo.martincoski@gmail.com>
References: <20170730044946.11999-1-ricardo.martincoski@gmail.com>
Message-ID: <20170731212407.02a7b111@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Jul 2017 01:49:43 -0300, Ricardo Martincoski wrote:
> Sometimes when a test fails in a gitlab pipeline the reason of the
> failure cannot be determined using only the logfile.
> 
> Add the modified rootfs as an artifact of the job to improve
> troubleshooting. To accomplish this, always use -k option from the test
> infra, unconditionally add the resulting images to the artifacts, and
> let the runner do the cleanup for us.
> 
> These artifacts can also be useful when a test fails locally but pass at
> gitlab runners.
> 
> When the test does not generate a image, this message is displayed in
> the runner log:
> WARNING: test-output/*/images/*: no matching files
> 
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> See also
> http://lists.busybox.net/pipermail/buildroot/2017-July/199332.html
> ---
>  .gitlab-ci.yml    | 5 ++++-
>  .gitlab-ci.yml.in | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
