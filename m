From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 10:59:05 +0100
Subject: [Buildroot] [PATCH 1/1] erlang: bump to version 20.0
In-Reply-To: <20171130154202.437-1-johan.oudinet@gmail.com>
References: <20171130154202.437-1-johan.oudinet@gmail.com>
Message-ID: <20171203105905.3bdd1dc9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 16:42:02 +0100, Johan Oudinet wrote:
> This change bumps the Erlang version from 19.3 to 20.0. As a new major
> release, there are a few incompatibilities. Details are here:
> http://www.erlang.org/news/114
> 
> This should fix builds on ppc64le host machines:
> http://autobuild.buildroot.net/results/407af9800313d4540643d7625e85acc0c2366892
> http://autobuild.buildroot.net/results/2aca54ad48ecfd72242d97499e21a46c1b384b10
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/erlang/erlang.hash | 4 ++--
>  package/erlang/erlang.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

This causes a bunch of build failures:

  http://autobuild.buildroot.net/?reason=host-erlang-20.0

Seems like host-zlib is needed.

Could you have a look ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
