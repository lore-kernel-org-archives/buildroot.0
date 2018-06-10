From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 14:57:09 +0200
Subject: [Buildroot] [PATCH] libvncserver: add upstream security fix for
 CVE-2018-7225
In-Reply-To: <20180609160229.8741-1-peter@korsgaard.com>
References: <20180609160229.8741-1-peter@korsgaard.com>
Message-ID: <20180610145709.282dcf85@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Jun 2018 18:02:29 +0200, Peter Korsgaard wrote:
> Fixes CVE-2018-7225 - An issue was discovered in LibVNCServer through
> 0.9.11.  rfbProcessClientNormalMessage() in rfbserver.c does not sanitize
> msg.cct.length, leading to access to uninitialized and potentially sensitive
> data or possibly unspecified other impact (e.g., an integer overflow) via
> specially crafted VNC packets.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...0001-Limit-client-cut-text-length-to-1-MB.patch | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 package/libvncserver/0001-Limit-client-cut-text-length-to-1-MB.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
