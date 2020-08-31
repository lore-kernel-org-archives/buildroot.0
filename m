From: Christian Stewart <christian@paral.in>
Date: Sun, 30 Aug 2020 21:38:00 -0700
Subject: [Buildroot] [PATCH v2 3/6] package/nvidia-container-runtime:
 new package
In-Reply-To: <20200808123918.1880533-3-christian@paral.in>
References: <20200808123918.1880533-1-christian@paral.in>
 <20200808123918.1880533-3-christian@paral.in>
Message-ID: <CA+h8R2pMR8mV+e4oJTUVwUXK-rY_N5Sj3YRyRichnsq5NXsv-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Aug 8, 2020 at 5:39 AM Christian Stewart <christian@paral.in> wrote:
>
> NVIDIA Container Runtime is a fork of runc which adds support for mounting GPUs
> into containers.
>
> https://github.com/NVIDIA/nvidia-container-runtime
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/Config.in                             |  1 +
>  package/nvidia-container-runtime/Config.in    | 16 +++++++++
>  package/nvidia-container-runtime/config.toml  | 20 +++++++++++
>  package/nvidia-container-runtime/daemon.json  | 12 +++++++
>  .../nvidia-container-runtime.hash             |  3 ++
>  .../nvidia-container-runtime.mk               | 33 +++++++++++++++++++
>  6 files changed, 85 insertions(+)
>  create mode 100644 package/nvidia-container-runtime/Config.in
>  create mode 100644 package/nvidia-container-runtime/config.toml
>  create mode 100644 package/nvidia-container-runtime/daemon.json
>  create mode 100644 package/nvidia-container-runtime/nvidia-container-runtime.hash
>  create mode 100644 package/nvidia-container-runtime/nvidia-container-runtime.mk

> +$(eval $(golang-package))

Unfortunately this package does not include a "vendor" tree inside the
source repository. This means that, for this package to work, we will
need to implement a step to run "go mod vendor" on the build
directory, which will download and build the vendor/ tree based on the
go.mod and go.sum files.

I've marked the series as Changes Requested for now.

Best,
Christian Stewart
