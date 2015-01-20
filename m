From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Tue, 20 Jan 2015 18:45:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/iojs: new package
In-Reply-To: <20150118162959.GQ4275@free.fr>
References: <1421278696-15122-1-git-send-email-jkrause@posteo.de>
 <20150115093427.0b5118b2@free-electrons.com>
 <1421351925.2625.14.camel@posteo.de> <20150118162959.GQ4275@free.fr>
Message-ID: <1421775938.28321.10.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On So, 2015-01-18 at 17:29 +0100, Yann E. MORIN wrote:
> J?rg, All,
> 
> On 2015-01-15 20:58 +0100, J?rg Krause spake thusly:
> > On Do, 2015-01-15 at 09:34 +0100, Thomas Petazzoni wrote:
> > > On Thu, 15 Jan 2015 00:38:16 +0100, J?rg Krause wrote:
> > > > io.js is a fork of Node.js. This package is mainly based on the nodejs
> > > > package, except for the patches.
> > > > 
> > > > io.js is currently marked as unstable and there is no stable release for now.
> > > > 
> > > > Signed-off-by: J?rg Krause <jkrause@posteo.de>
> > > 
> > > Immediate question that comes to mind: is the code base diverging from
> > > Node.js ?
> > 
> > Yes, it is.
> > 
> > > Do we need two separate packages ?
> > 
> > I would say yes. io.js is build against modern versions of V8 and libuv
> > and bundles a recent npm package. This enables the user the new features
> > from the upcoming JavaScript ECMA-262 specification (ES6).
> > 
> > From io.js ChangeLog:
> > "The io.js codebase inherits the majority of the changes found in the
> > v0.11 branch of the joyent/node repository and therefore can be seen as
> > an extension to v0.11."
> 
> OK, so in the long run, will we need to have a virtual package for the
> NodeJS feature?
> 
> That is, are there packages that would work with either NodeJS or iojs?
> 
> We need not add such a virtual package for now, but will need to when/if
> we package in Buildroot new packages that can use either one.

I'm not quite sure if I get you right.

We would have two packages: nodejs and iojs. Node.js uses npm as package
management system. iojs is based on Node.js and compatible to npm. In
Buildroot, additional modules for Node.js are installed with
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL.

Additional modules for io.js will be installed with
BR2_PACKAGE_IOJS_MODULES_ADDITIONAL.

This is the config menu:
[*] iojs
    Module Selection --->
    () Additional modules

[] nodejs
    Module Selection --->
    () Additional modules

There are no packages in Buildroot which depends on or selects the
package nodejs (or iojs).

Best regards
J?rg
