From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Aug 2016 22:06:18 +0200
Subject: [Buildroot] [PATCH 3/5] imx-parser: add install hooks to fix
	libraries path
In-Reply-To: <1469627614-29709-4-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Wed, 27 Jul 2016 15:53:32 +0200")
References: <1469627614-29709-1-git-send-email-gary.bisson@boundarydevices.com>
 <1469627614-29709-4-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <87a8gtipmt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > By default, all the libraries are installed under /usr/lib/imx-mm
 > which causes problems at runtime.

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
 > ---
 >  package/freescale-imx/imx-parser/imx-parser.mk | 7 +++++++
 >  1 file changed, 7 insertions(+)

 > diff --git a/package/freescale-imx/imx-parser/imx-parser.mk b/package/freescale-imx/imx-parser/imx-parser.mk
 > index a207d6e..75fe6cc 100644
 > --- a/package/freescale-imx/imx-parser/imx-parser.mk
 > +++ b/package/freescale-imx/imx-parser/imx-parser.mk
 > @@ -20,4 +20,11 @@ endef
 >  # The Makefile installs several versions of the libraries, but we only
 >  # need one of them, depending on the platform.
 
 > +define IMX_PARSER_FIXUP_TARGET_PATH
 > +	find $(TARGET_DIR)/usr/lib/imx-mm -mindepth 2 -maxdepth 2 -not -type d \
 > +		-exec mv {} $(TARGET_DIR)/usr/lib \;
 > +	rm -fr $(TARGET_DIR)/usr/lib/imx-mm

Same comment as for imx-codec. Committed with that fixes, thanks.

-- 
Bye, Peter Korsgaard
