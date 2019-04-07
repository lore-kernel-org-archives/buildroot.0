From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 22:17:26 +0200
Subject: [Buildroot] [RFC PATCH v1 1/6] package/go: implement go modules
 integration
In-Reply-To: <20190317012142.10545-1-christian@paral.in>
References: <20190317012142.10545-1-christian@paral.in>
Message-ID: <20190407221726.130ca0fe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

On Sat, 16 Mar 2019 18:21:37 -0700
Christian Stewart <christian@paral.in> wrote:

> This commit moves from the GOPATH mechanism to the new GO111MODULE approach for
> Go based packages. Old Go packages (with the exception of docker-cli) will
> compile without changes (for example, mender, flanneld).

While browsing through the list of pending patches, I found the
following patch series related to Go and package management:

  http://patchwork.ozlabs.org/project/buildroot/list/?series=68102

The first patch in the series,
http://patchwork.ozlabs.org/patch/976322/, introduces:

+	  Glide is a tool for managing the _vendor_ directory within a Go
+	  package. This feature, first introduced in Go 1.5, allows each
+	  package to have a _vendor_ directory containing dependent
+	  packages for the project. These vendor packages can be
+	  installed by a tool (e.g. glide), similar to go get or they
+	  can be vendored and distributed with the package.

and it does a fair amount of changes in pkg-golang.mk.

How does this fit (or not) with the changes you're proposing ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
