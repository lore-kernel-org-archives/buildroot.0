From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 13:51:37 +0100
Subject: [Buildroot] [PATCH v3 1/1] jsen: new package
In-Reply-To: <1456396337.29027.16.camel@embedded.rocks>
References: <1456233895-31812-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
 <56CCC4C4.5020402@mind.be>
 <20160223220413.2050528c@free-electrons.com>
 <1456396337.29027.16.camel@embedded.rocks>
Message-ID: <20160225135137.09136142@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Feb 2016 11:32:17 +0100, J?rg Krause wrote:

> > Atul, are you using jsen in the context of NodeJS ? If not, in which
> > context are you using it ?
> 
> Using BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL should be the only way to
> install Node.js modules. Note that npm, the Node.js package manager
> takes care of all the package dependencies. In my opinion, this is the
> only sane way of installing Node.js modules for now.

Thanks for raising your voice on this patch, it's definitely
interesting to get some feedback. Since I'm not at all a NodeJS guy,
I'm interested in having more details about:

 - Why you think the only sane way is to use
   BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL as opposed to having proper
   packages for the different modules, like we do for the Perl,
   Python and Lua packages ?

 - What solution you propose to properly integrate this with the
   download and legal infrastructure of Buildroot. Right now, having
   "npm install" directly download and install stuff means that the
   download and legal-info infrastructure of Buildroot is completely
   worked-around. Due to this, "make source" will not download all the
   source, "make legal-info" will not list all the licenses, caching in
   BR2_DL_DIR doesn't work, BR2_PRIMARY_SITE doesn't work, etc.

> About legal infrastructure: for all installed Node.js packages the
> package.json file could be searched for the license information.

Yes, but that's not integrated in the legal-info output, and doesn't
solve the download infrastructure integration problem.

At best, what this package.json file could help with, is help creating
a script (much like scancpan) that automatically creates a Buildroot
package for a given npm module.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
