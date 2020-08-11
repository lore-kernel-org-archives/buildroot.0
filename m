From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 23:58:33 +0200
Subject: [Buildroot] [PATCH 1/4] package/mender-artifact: bump version
 to 3.4.0
In-Reply-To: <20200715173707.584226-1-aduskett@gmail.com>
References: <20200715173707.584226-1-aduskett@gmail.com>
Message-ID: <20200811235833.03115c8b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Matt since his autobuilders are causing issues.
+Christian for some more Go expertise.

On Wed, 15 Jul 2020 10:37:04 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Update the following license file hashes due to copyright year changes:
>   - vendor/github.com/mendersoftware/mendertesting/LICENSE
>   - vendor/github.com/davecgh/go-spew/LICENSE
>   - vendor/github.com/stretchr/testify/LICENSE
> 
> Add hashes for the the following new files:
>   - vendor/github.com/minio/sha256-simd/LICENSE
>   - vendor/gopkg.in/yaml.v2/LICENSE
>   - vendor/github.com/klauspost/compress/LICENSE
>   - vendor/github.com/russross/blackfriday/v2/LICENSE.txt
>   - vendor/github.com/klauspost/pgzip/LICENSE
>   - vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md
>   - vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

This is causing some significant amount of build failures in the
autobuilders:

  http://autobuild.buildroot.net/?reason=host-mender%

It fails only on Matthew Weber autobuilders, which don't have a
"normal" access to Internet, and the build fails with errors such as:

go: github.com/davecgh/go-spew at v1.1.1: Get https://proxy.golang.org/github.com/davecgh/go-spew/@v/v1.1.1.mod: proxyconnect tcp: read tcp 192.168.6.146:34964->128.24.38.25:9091: read: connection reset by peer

go: github.com/davecgh/go-spew at v1.1.1: Get https://proxy.golang.org/github.com/davecgh/go-spew/@v/v1.1.1.mod: proxyconnect tcp: net/http: TLS handshake timeout

Can this be fixed somehow ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
