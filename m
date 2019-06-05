From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 5 Jun 2019 09:35:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/mender-artifact: fix lzma
 detection
In-Reply-To: <20190604210753.15731-1-fontaine.fabrice@gmail.com>
References: <20190604210753.15731-1-fontaine.fabrice@gmail.com>
Message-ID: <CADHdJwCqoc-iEtLy6m_k6HtK74TXThi5+jCK=rzFw3FM+ThvsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 4, 2019 at 11:08 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Use CGO_CFLAGS and CGO_LDFLAGS to help mender-artifact to find lzma.h
> and link with liblzma (with a correct rpath)
>
> Fixes:
>  - http://autobuild.buildroot.org/results/b436d50a11687afa7021efc7eedd24fc337b0994

I also sent a patch [1] trying to resolve these build errors, but my
approach was to patch the pkg-golang.mk instead of mender-artifact.mk
as I would expect this problem to exist for any golang host package
that is using CGO, and is not isolated to mender-artifact.mk (though
is is probably the only package in Buildroot that does use CGO in host
environment).


[1]. https://patchwork.ozlabs.org/patch/1109161/
-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
