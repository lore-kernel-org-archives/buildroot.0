From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:43:25 +0100
Subject: [Buildroot] [PATCH 03/25] luarocks-package: use
 $(HOST_PKG_VERSION) instead of $(PKG_VERSION)
In-Reply-To: <20170223170047.24417-4-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-4-arnout@mind.be>
Message-ID: <20170302224325.4b92748d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 18:00:25 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The inner-luarocks-package macro was using $(3)_VERSION as the package
> version, i.e. the version of the target package, even when it's the
> host package. We should instead use $(2)_VERSION, i.e. the host package
> version, like is done in inner-generic-package.
> 
> Since luarocks-package doesn't even support a host version, it doens't
> make a whole lot of difference, but let's keep things consistent.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/pkg-luarocks.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
