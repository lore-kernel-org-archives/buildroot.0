From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Aug 2019 22:26:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: fix static build
 with openssl
In-Reply-To: <20190804204458.2385-1-fontaine.fabrice@gmail.com>
References: <20190804204458.2385-1-fontaine.fabrice@gmail.com>
Message-ID: <20190805222626.75534e7f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Aug 2019 22:44:58 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> mosquitto library can be built statically since commit
> a95bdd964761ec69a23174f5213dd54b77d0971b however build fails with
> openssl because mosquitto does not use pkg-config to retrieve static
> dependencies so provide them through the STATIC_LIB_DEPS variable
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2ee69a5d7834c9a4845ebde801be6aa8f97cc5fa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mosquitto/mosquitto.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
