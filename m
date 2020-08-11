From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 23:49:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: add
 security fix for CVE-2020-14347
In-Reply-To: <20200810064109.447089-1-bernd.kuhls@t-online.de>
References: <20200810064109.447089-1-bernd.kuhls@t-online.de>
Message-ID: <20200811234906.051e8caa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Aug 2020 08:41:09 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://lists.x.org/archives/xorg-announce/2020-July/003051.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../1.20.8/0007-fix-for-ZDI-11426.patch       | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/x11r7/xserver_xorg-server/1.20.8/0007-fix-for-ZDI-11426.patch

You had forgotten to set XSERVER_XORG_SERVER_IGNORE_CVES to ignore
CVE-2020-14347 now that it is fixed by your patch. I have done so when
the selected X.org version is 1.20.

This raises a question: what about the older X.org server releases?
According to the NIST CVE entry, all versions prior to 1.20.9 are
affected, so should the patch be backported to the other X.org server
versions we support ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
