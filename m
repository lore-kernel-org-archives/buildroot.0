From: Magnus Armholt <magnus.armholt@wapice.com>
Date: Mon, 26 Oct 2020 09:32:02 +0000
Subject: [Buildroot] Building containers on host?
Message-ID: <HE1PR03MB298816B86352B2A4CE807634F0190@HE1PR03MB2988.eurprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
We are interested in using containers on our target.
The reason is mainly for security and dependency isolation.
Our target runs in a separated environment so we can't use a repository but instead want to ship the containers in the target image.
We have done a small proof of concept package where we build a container on host, save it, deploy the compressed image to target, load it and finally launch it during target bootup.
This seems to work as we expect.
Currently the container is loaded and launched with docker, but in the future it would be nice to make `podman` work on the target (lets see I ever get that far).
Since the package builds the container on the host, there is a host side dependency to the container building binary (currently unhandled).
We would prefer to use `buildah` on host side but also `docker` would be an option(although secondary).

Reading the manual my understanding is that I need to add a host side package `host-buildah`.

Buildah is available in basically all package managers, but if building from sources there are dependencies to `runc` and `CNI` (github.com/containernetworking/plugins).

Is the correct understanding that I should add 3 host side packages, `host-buildah`, `host-runc` and `host-cni`?
Would adding `host-docker` be an intermediate easier step (since you have docker buildroot package)?

BR,
Magnus


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201026/f2abff36/attachment.html>
