From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 15:04:12 +0200
Subject: [Buildroot] [PATCH v4 1/7] package/go: implement go modules
 integration
In-Reply-To: <20200813213220.260112-1-christian@paral.in>
References: <20200813213220.260112-1-christian@paral.in>
Message-ID: <20200829150412.43fd3c14@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Aug 2020 14:32:14 -0700
Christian Stewart <christian@paral.in> wrote:

> +HOST_GO_GOPATH = $(HOST_DIR)/usr/share/go-path

[...]

> +	GOPATH="$(HOST_GO_GOPATH)" \

Are you sure this GOPATH is needed ? We're supposed to move away from
GOPATH, but you're adding a new GOPATH location here, and in a build
that has all our Go packages enabled, this
$(HOST_DIR)/usr/share/go-path location doesn't even exist.

Could you clarify ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
