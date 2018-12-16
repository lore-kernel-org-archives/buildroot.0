From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 15:15:14 +0100
Subject: [Buildroot] [PATCH v8 1/1] docker-engine: split docker-{cli,
 engine}, bump to v18.06.1-ce
In-Reply-To: <20181108032458.1028-1-christian@paral.in> (Christian Stewart's
 message of "Wed, 7 Nov 2018 19:24:58 -0800")
References: <20181108032458.1028-1-christian@paral.in>
Message-ID: <8736qxblsd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Docker upstream has split the Docker daemon and CLI into separate codebases:
 >  - github.com/docker/engine: daemon, "dockerd" binary
 >  - github.com/docker/cli: "docker" command line interface

 > This commit splits the docker-engine package into docker-engine and docker-cli.
 > Conveniently, the Docker project has begun maintaining two separate
 > release-tagged repositories for the CLI and daemon as of v18.06-ce-rc1. Previous
 > versions were tagged in a common "docker-ce" repository which makes compilation
 > awkward for Buildroot, especially due to some limitations in the new Go package
 > infrastructure.

 > Docker repositories "engine" and "cli" recently started tagging releases as
 > recent as the latest stable v18.06.1.

 > The CLI is no longer automatically included with the engine. Users will need to
 > select BR2_PACKAGE_DOCKER_CLI to produce a both docker and dockerd target
 > binaries.

 > Docker CLI can be statically compiled. This enables usage of the system docker
 > client binary to access the parent daemon API from within containers, where
 > shared libraries are not available.

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
