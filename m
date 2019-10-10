From: Christian Stewart <christian@paral.in>
Date: Thu, 10 Oct 2019 09:59:50 -0700
Subject: [Buildroot] How to get the (GIT) Version string into the source
 code
In-Reply-To: <b96c8d0a-48b2-9735-7c38-01cd7f826035@grandegger.com>
References: <b96c8d0a-48b2-9735-7c38-01cd7f826035@grandegger.com>
Message-ID: <CA+h8R2oQCTbbGZYtQisOWOC-Xz2UDp=3Aj4B7axAOVr0LMsCyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Wolfgang,


On Thu, Oct 10, 2019, 6:54 AM Wolfgang Grandegger <wg@grandegger.com> wrote:

> I'm looking for a simple method to get the package version string used
> by buildroot into the source code of that package. Unfortunately, the
> GIT version information is stripped off. For the moment, I use the name
> of the build directory and pass it to the code via Makefile, but maybe
> there is a more elegant version.
>

See package/docker-engine/docker-engine.mk for an example. Here is a
permalink;

DOCKER_ENGINE_LDFLAGS = \
-X main.GitCommit=$(DOCKER_ENGINE_VERSION) \
-X main.Version=$(DOCKER_ENGINE_VERSION)

You should use the $(MY_PACKAGE_VERSION) string as your version string.

If you want more details from "git describe" then unfortunately it's not as
easy as code often comes from a tarball exported from the source repo
rather than a full clone.

Best,
Christian Stewart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191010/3aec3e2b/attachment.html>
