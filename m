From: Christian Stewart <christian@paral.in>
Date: Tue, 11 Aug 2020 19:26:42 -0700
Subject: [Buildroot] [PATCH 1/4] package/mender-artifact: bump version
 to 3.4.0
In-Reply-To: <20200811235833.03115c8b@windsurf.home>
References: <20200715173707.584226-1-aduskett@gmail.com>
 <20200811235833.03115c8b@windsurf.home>
Message-ID: <CA+h8R2qLY-5FbL_HTjwTH_i=w3ky_=C=17n48_=18-E=9mUYVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Aug 11, 2020 at 3:02 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> +Matt since his autobuilders are causing issues.
> +Christian for some more Go expertise.

[snip]

> This is causing some significant amount of build failures in the
> autobuilders:
>
>   http://autobuild.buildroot.net/?reason=host-mender%
>
> It fails only on Matthew Weber autobuilders, which don't have a
> "normal" access to Internet, and the build fails with errors such as:
>
> go: github.com/davecgh/go-spew at v1.1.1: Get https://proxy.golang.org/github.com/davecgh/go-spew/@v/v1.1.1.mod: proxyconnect tcp: read tcp 192.168.6.146:34964->128.24.38.25:9091: read: connection reset by peer
>
> go: github.com/davecgh/go-spew at v1.1.1: Get https://proxy.golang.org/github.com/davecgh/go-spew/@v/v1.1.1.mod: proxyconnect tcp: net/http: TLS handshake timeout
>
> Can this be fixed somehow ?

Yes. Please merge this patch series:
https://patchwork.ozlabs.org/project/buildroot/list/?series=161729

Thanks,
Christian
