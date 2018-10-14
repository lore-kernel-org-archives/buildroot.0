From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 11:00:02 +0200
Subject: [Buildroot] [PATCH 1/1] xerces: fix static linking with curl
In-Reply-To: <20181011212711.22694-1-fontaine.fabrice@gmail.com>
References: <20181011212711.22694-1-fontaine.fabrice@gmail.com>
Message-ID: <20181014110002.71a78fa5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Oct 2018 23:27:11 +0200, Fabrice Fontaine wrote:
> When curl is statically built with openssl support, xerces needs to
> link with openssl libraries so use pkg_check_modules to get any
> needed dependencies
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/29ca90fff2c8e38f2edf7240eca3aa3fe7397c45
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-fix-static-linking-with-curl.patch   | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/xerces/0002-fix-static-linking-with-curl.patch

Ah, an upstreamable pkg-config based solution to solve static linking
issues: good! Could you make sure to submit this upstream?

Applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
