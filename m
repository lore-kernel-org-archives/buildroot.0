From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 22:04:13 +0100
Subject: [Buildroot] [PATCH v3 1/1] jsen: new package
In-Reply-To: <56CCC4C4.5020402@mind.be>
References: <1456233895-31812-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
 <56CCC4C4.5020402@mind.be>
Message-ID: <20160223220413.2050528c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, 23 Feb 2016 21:44:52 +0100, Arnout Vandecappelle wrote:

>  I wonder if this is really the correct place for it. This menu is for
> Javascript libraries that are installed in /var/www, i.e. that are meant to be
> used by web clients. AFAICS, however, jsen is meant to be used with nodejs
> (which is why it's installed in /usr/share, I guess). So I think we should
> create a new menu under the nodejs package:

Atul originally placed jsen under the Libraries -> JSON/XML, and I
suggested him to put it under the Javascript libraries.

> 	source "package/nodejs/Config.in"
> if BR2_PACKAGE_NODEJS
> menu "NodeJS libraries/modules"
> 	source "package/jsen/Config.in"
> endmenu
> endif

If it's indeed a NodeJS package, then comes the question of how we are
going to package those zillions of modules. Today, one can request any
random NodeJS module to be installed using
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL (which is simple, but obviously
circumvents completely the download and legal infrastructures of
Buildroot).

Atul, are you using jsen in the context of NodeJS ? If not, in which
context are you using it ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
