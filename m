From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 22:47:43 +0200
Subject: [Buildroot] [PATCH 1/2] package/libwebsockets: fix build with
 libev and libevent
In-Reply-To: <20191006125339.23402-1-fontaine.fabrice@gmail.com>
References: <20191006125339.23402-1-fontaine.fabrice@gmail.com>
Message-ID: <20191007224743.4137296a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Oct 2019 14:53:38 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libev and libevent can't be enabled at the same time since version 3.0.0
> and
> https://github.com/warmcat/libwebsockets/commit/ff2f5f601d5965f5860bc989d05b61246f172095
> 
> So prefer libev over libevent to have the same default behavior than
> upstream LWS_WITH_DISTRO_RECOMMENDED target
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ee5ef79a39570bcf5c605b1a4b6b48523605d647
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libwebsockets/libwebsockets.mk | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
