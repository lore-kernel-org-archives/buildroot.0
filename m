From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Dec 2012 21:44:21 +0100
Subject: [Buildroot] [PATCH] imx-lib: new package
In-Reply-To: <50CF5987.90805@mind.be> (Arnout Vandecappelle's message of "Mon, 
 17 Dec 2012 18:42:31 +0100")
References: <1355752131-31966-1-git-send-email-arnout@mind.be>
 <50CF5987.90805@mind.be>
Message-ID: <87mwxc76je.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 17/12/12 14:48, Arnout Vandecappelle (Essensium/Mind) wrote:
 >> +if BR2_PACKAGE_IMX_LIB
 >> +choice
 >> +	prompt "i.MX platform"
 >> +
 >> +config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX25_3STACK
 >> +	bool "imx25-3stack"
 >> +
 >> +config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX27ADS
 >> +	bool "imx27ads"
 >> +
 >> +config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX37_3STACK
 >> +	bool "imx37-3stack"
 >> +
 >> +config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX50
 >> +	bool "imx50"
 >> +
 >> +config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX51
 >> +	bool "imx51"
 >> +
 >> +config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX53
 >> +	bool "imx53"
 >> +
 >> +config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX6Q
 >> +	bool "imx6q"
 >> +
 >> +endchoice

 Arnout>  Here's a second issue that I'd like to get some feedback on:
 Arnout> gst-fsl-plugins also uses a PLATFORM definition, but the list of
 Arnout> platforms is slightly different:
 Arnout> MX28/MX233/MX25/MX27/MX31/MX35/MX37/MX51/MX53/MX50/MX5X/MX6

 Arnout>  Ideally the 'platform' should be defined only once, but where? Or
 Arnout> should I add all the platforms to gst-fsl-plugins with a select of the
 Arnout> appropriate imx-lib platform?

We once talked about adding a SoC selection to buildroot, but decided it
would be too much effort to maintain.

Is the gst-fsl-plugins stuff still needed now that the coda driver is in
mainline?

 Arnout>  I can only test the mx6q because that's the only one for which
 Arnout> I have a board... Build-testing doesn't make a difference
 Arnout> because all platforms use the same API.

I have access to mx28 / mx51 / mx53 / mx6q boards and could do some
testing during christmas.

-- 
Bye, Peter Korsgaard
