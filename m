From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 23:30:27 +0100
Subject: [Buildroot] [PATCH v3] bluez_utils: broken for static builds
In-Reply-To: <1386266208-52779-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1386266208-52779-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20131226233027.5f8c4ba5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 5 Dec 2013 17:56:48 +0000, Vicente Olivert Riera wrote:
> The bluez_utils package requires shared library support unconditionally.
> We can't fix it to make it build on static because, for instance,
> "plugin.c" file uses dlfcn and it's a basic prereq for bluetoothd, so
> add "depend on !BR2_PREFER_STATIC_LIB" to it and recursively to all
> packages that selects BR2_PACKAGE_BLUEZ_UTILS.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/d81/d81970024649c1e89c01da491c63760afdad6cb6/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/bluez_utils/Config.in   |    5 +++--
>  package/efl/libedbus/Config.in  |    5 +++--
>  package/openobex/Config.in      |    5 +++--
>  package/sconeserver/Config.in   |    5 +++++
>  package/snowball-init/Config.in |    5 +++--
>  package/ussp-push/Config.in     |    5 +++--
>  6 files changed, 20 insertions(+), 10 deletions(-)

Thanks, applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
