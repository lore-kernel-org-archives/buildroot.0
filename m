From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 12:12:02 +0100
Subject: [Buildroot] [PATCH] package/opentracing-cpp: needs dynamic
 library support
In-Reply-To: <20190208205042.12833-1-patrickdepinguin@gmail.com>
References: <20190208205042.12833-1-patrickdepinguin@gmail.com>
Message-ID: <20190211121202.61907667@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 Feb 2019 21:50:41 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> opentracing-cpp requires dlfcn.h from src/dynamic_load_unix.cpp.
> This file is compiled unconditionally.
> 
> Disable opentracing-cpp on BR2_STATIC_LIBS configurations.
> 
> Fixes: http://autobuild.buildroot.net/results/454173aef9ff7c808294a974088d7682cad240a8/
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/opentracing-cpp/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
