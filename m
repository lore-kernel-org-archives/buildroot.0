From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 23:26:02 +0100
Subject: [Buildroot] [PATCH 18/25] luarocks-package: introduce
 PKG_NAME_UPSTREAM
In-Reply-To: <20170223170047.24417-19-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-19-arnout@mind.be>
Message-ID: <20170302232602.083b0bb5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 18:00:40 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Since we now require Lua package names to start with "lua", it is likely
> that the Buildroot name is different from the upstream LuaRocks name.
> Add a feature to the luarocks-package infra that makes it easier to
> handle this situation: the package can explicitly specify the upstream
> name in PKG_NAME_UPSTREAM, and that name will be used in PKG_ROCKSPEC,
> PKG_SOURCE and PKG_SUBDIR.
> 
> Add an explanation of this feature to the manual. To make the example
> relevant, it is changed to lua-foo, where the upstream name is plain
> foo. To avoid confusion with the dependency on a native library, that
> dependency is renamed to bar.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> The change in the manual should perhaps have been a separate commit, but
> this series is already long enough as it is :-)
> ---
>  docs/manual/adding-packages-luarocks.txt | 54 +++++++++++++++++++-------------
>  package/pkg-luarocks.mk                  |  7 +++--
>  2 files changed, 36 insertions(+), 25 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
