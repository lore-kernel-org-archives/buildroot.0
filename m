From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 21:12:47 +0100
Subject: [Buildroot] [PATCH v9 1/1] docker-engine: split docker-{cli,
 engine}, bump to v18.09.0
In-Reply-To: <20181127085655.27230-1-christian@paral.in>
References: <20181127085655.27230-1-christian@paral.in>
Message-ID: <20181203211247.101780bc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Nov 2018 00:56:55 -0800, Christian Stewart wrote:
> Docker upstream has split the Docker daemon and CLI into separate codebases:
> 
>  - github.com/docker/engine: daemon, "dockerd" binary
>  - github.com/docker/cli: "docker" command line interface
> 
> This commit splits the docker-engine package into docker-engine and docker-cli.
> Conveniently, the Docker project has begun maintaining two separate
> release-tagged repositories for the CLI and daemon as of v18.06-ce-rc1. Previous
> versions were tagged in a common "docker-ce" repository which makes compilation
> awkward for Buildroot, especially due to some limitations in the new Go package
> infrastructure.
> 
> Docker repositories "engine" and "cli" recently started tagging releases. Select
> the latest stable release, v18.09.0.
> 
> The CLI is no longer automatically included with the engine. Users will need to
> select BR2_PACKAGE_DOCKER_CLI to produce a both docker and dockerd target
> binaries.
> 
> Docker CLI can be statically compiled. This enables usage of the system docker
> client binary to access the parent daemon API from within containers, where
> shared libraries are not available.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> ---

Applied to master. I did two things:

 - dropped the host-go dependency, since it's already added by the
   golang-package infrastructure

 - added an entry in the DEVELOPERS file for package/docker-cli/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
