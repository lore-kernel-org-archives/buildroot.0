From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Mar 2019 22:31:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpcap: fix
 bluez5_utils-headers dependency
In-Reply-To: <20190318224042.4568-1-fontaine.fabrice@gmail.com>
References: <20190318224042.4568-1-fontaine.fabrice@gmail.com>
Message-ID: <20190319223117.2693ff2b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Mar 2019 23:40:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit c46afc37dc877f1e94ffde0d77585290711b27ec changed bluez5-utils
> dependency by bluez5_utils-headers without replacing the test on
> BR2_PACKAGE_BLUEZ5_UTILS by BR2_PACKAGE_BLUEZ5_UTILS_HEADERS
> 
> Fix this mistake and also add a select on
> BR2_PACKAGE_BLUEZ5_UTILS_HEADERS if BR2_PACKAGE_BLUEZ5_UTILS is set
> so the user does not have to do it
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c6828df1f3782564451ddd4187ff026679bf37d8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libpcap/Config.in  | 1 +
>  package/libpcap/libpcap.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
