From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 21:18:13 +0200
Subject: [Buildroot] [PATCH v2 4/4] ejabberd: bump to version 17.04
In-Reply-To: <20170531163545.23552-4-johan.oudinet@gmail.com>
References: <20170531163545.23552-1-johan.oudinet@gmail.com>
 <20170531163545.23552-4-johan.oudinet@gmail.com>
Message-ID: <20170531211813.07198038@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 May 2017 18:35:45 +0200, Johan Oudinet wrote:
> There are new dependencies: erlang-p1-jiffy, erlang-p1-oauth2,
> erlang-p1-stun, erlang-p1-tls, erlang-p1-utils, erlang-p1-xmpp
> 
> as well as two host dependencies on erlang-p1-utils and
> erlang-p1-xmpp. Otherwise the compilation via rebar fails.
> 
> 4 patches have been refreshed and a new patch have been introduced to
> tell rebar to use host dependencies instead of trying to download them.
> Hopefully this patch could be drop in ejabberd 17.06.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> 
> ---
> Changes v1 -> v2:
>  - Describe in the commit log the new dependencies and patches
> ---
>  .../0001-remove-make-targets-for-deps.patch        |  42 +------
>  ...002-remove-dependencies-from-rebar-config.patch | 129 +++++++++++----------
>  .../ejabberd/0006-fix-install-permissions.patch    |  42 +++----
>  package/ejabberd/0007-fix-ejabberdctl.patch        |  12 +-
>  .../0008-rebar-uses-host-dependencies.patch        |  33 ++++++
>  package/ejabberd/ejabberd.hash                     |   4 +-
>  package/ejabberd/ejabberd.mk                       |   6 +-
>  7 files changed, 136 insertions(+), 132 deletions(-)
>  create mode 100644 package/ejabberd/0008-rebar-uses-host-dependencies.patch

So this one lacks the changes in package/ejabberd/Config.in.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
