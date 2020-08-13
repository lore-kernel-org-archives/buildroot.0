From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:08:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: disable TEAP
 for internal TLS implementation
In-Reply-To: <20200108190439.459316-1-geomatsi@gmail.com>
References: <20200108190439.459316-1-geomatsi@gmail.com>
Message-ID: <20200813230848.16f715d0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 Jan 2020 22:04:39 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> EAP-TEAP support in hostapd/wpa_supplicant fails to build with internal
> TLS implementation. This patch disables TEAP support in wpa_supplicant
> when internal TLS implementation is selected. Similar fix for hostapd
> package has already been merged to Buildroot: see commit 47d14e3b1c20
> ("package/hostapd: disable TEAP for internal TLS implementation").
> 
> TEAP is still an experimental feature that is not recommmended for
> production use. Currently it should not be used for anything else
> than experimentation and interoperability testing. Those who needs
> experimenting with TEAP are encouraged to enable openssl in their
> buildroot configuration.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e83613c06041a60f89da787f4ebf876245713cd2/
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  package/wpa_supplicant/wpa_supplicant.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
