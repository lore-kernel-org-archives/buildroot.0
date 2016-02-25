From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 25 Feb 2016 11:32:17 +0100
Subject: [Buildroot] [PATCH v3 1/1] jsen: new package
In-Reply-To: <20160223220413.2050528c@free-electrons.com>
References: <1456233895-31812-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
 <56CCC4C4.5020402@mind.be> <20160223220413.2050528c@free-electrons.com>
Message-ID: <1456396337.29027.16.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas, Atul,

On Di, 2016-02-23 at 22:04 +0100, Thomas Petazzoni wrote:
> Arnout,
> 
> On Tue, 23 Feb 2016 21:44:52 +0100, Arnout Vandecappelle wrote:
> 
> > 
> > ?I wonder if this is really the correct place for it. This menu is
> > for
> > Javascript libraries that are installed in /var/www, i.e. that are
> > meant to be
> > used by web clients. AFAICS, however, jsen is meant to be used with
> > nodejs
> > (which is why it's installed in /usr/share, I guess). So I think we
> > should
> > create a new menu under the nodejs package:
> Atul originally placed jsen under the Libraries -> JSON/XML, and I
> suggested him to put it under the Javascript libraries.
> 
> > 
> > 	source "package/nodejs/Config.in"
> > if BR2_PACKAGE_NODEJS
> > menu "NodeJS libraries/modules"
> > 	source "package/jsen/Config.in"
> > endmenu
> > endif
> If it's indeed a NodeJS package, then comes the question of how we
> are
> going to package those zillions of modules. Today, one can request
> any
> random NodeJS module to be installed using
> BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL (which is simple, but obviously
> circumvents completely the download and legal infrastructures of
> Buildroot).
> 
> Atul, are you using jsen in the context of NodeJS ? If not, in which
> context are you using it ?

Using BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL should be the only way to
install Node.js modules. Note that npm, the Node.js package manager
takes care of all the package dependencies. In my opinion, this is the
only sane way of installing Node.js modules for now.

About legal infrastructure: for all installed Node.js packages the
package.json file could be searched for the license information.

Best regards
J?rg Krause
