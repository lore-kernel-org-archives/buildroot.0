From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 15:08:03 +0100
Subject: [Buildroot] [RFC 3/3] wpewebkit: new package
In-Reply-To: <20181228021832.GB14369@momiji>
References: <20181223154845.23556-1-francois.perrad@gadz.org>
 <20181223154845.23556-4-francois.perrad@gadz.org>
 <20181228021832.GB14369@momiji>
Message-ID: <20181231150803.4af61a99@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrian,

On Fri, 28 Dec 2018 02:18:32 +0100, Adrian Perez de Castro wrote:

> Even better: Have a BR2_WEBKIT_ARCH_SUPPORTS symbol with the common
> dependencies for both the ?webkitgtk? and ?wpewebkit? packages -- they
> basically support the same set of architectures, and the same goes for the
> JavaScriptCore JIT compilation support (look at how the ?webkitgtk? package
> defines BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT).

Could you give a bit of background on the different webkit "variants" ?
Why do they apparently duplicate the same webkit code ?

> > +config BR2_PACKAGE_WPEWEBKIT_WEBDRIVER
> > +	bool "WebDriver support"
> > +	help
> > +	  Enable support for WebDriver. This will build and install the
> > +	  WebKitWebDriver program in the target.
> > +  
> 
> I would also have options to make support for XSLT, WOFF2, and WebCrypto
> optional explicitly instead of choosing them in ?wpewebkit.mk? depending on
> whether the required package(s) have been manually selected. That would avoid
> situations in which, for example, a build mysteriously fails to load a WOFF2
> Web font due to the ?woff2? package not being manually selected at build time
> (because it is not implied in any way that it is needed for WPE WebKit to
> support WOFF2 fonts).

Actually, what Fran?ois did is standard Buildroot practice. We very
often prefer to use "automatic dependencies" (i.e automatically enable
feature FOO if its necessary dependencies are available) rather than
"explicit dependencies (i.e add an explicit Config.in option to enable
feature FOO, which would select the necessary dependencies).

The reasoning for that is simple: we are trying to avoid having
gazillions of Config.in options.

However, we don't have any strict rule on this, and in some situations,
it makes sense to have an explicit option, especially when the
relationship between the needed dependencies and the feature is not
really obvious.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
