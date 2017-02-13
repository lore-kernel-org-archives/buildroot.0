From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 14:29:52 +0100
Subject: [Buildroot] [PATCH v3] classpath: bump to version 0.99
In-Reply-To: <5160b52a-c48a-4b52-3d0e-9d73a6fb5c37@cartelsol.com>
References: <20170212015451.16715-1-m.hoffmann@cartelsol.com>
 <20170212020444.32045-1-m.hoffmann@cartelsol.com>
 <20170212151431.1fe6cce3@free-electrons.com>
 <5160b52a-c48a-4b52-3d0e-9d73a6fb5c37@cartelsol.com>
Message-ID: <20170213142952.302e6ee4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 16:36:02 +0100, Marcus Hoffmann wrote:

> >  1. If you're using/interested in classpath, would you mind adding your
> >     name in the DEVELOPERS file for this package? Same if you're
> >     using/interested in jamvm. Those two packages are currently not
> >     associated to any developer, it would be nice to have a developer
> >     interested in those two packages.  
> I don't know, we are looking into jamvm/classpath but haven't decided on
> a Java VM/class library yet. For now I would wait a while until there is
> a decision if we'll be using those packages.

OK.

> >  2. classpath has a "depends on BR2_PACKAGE_JAMVM" and jamvm has a
> >     "select BR2_PACKAGE_CLASSPATH" which feels a bit like a circular
> >     dependency. It would be nice to fix that up as well.  
> 
> What would be the preferred solution here? JamVM selecting classpath
> seems fine, as long as there is no alternative class library in
> buildroot. So we allow selecting classpath but not JamVM? Here is a list
> of projects using gnu classpath:
> https://www.gnu.org/software/classpath/stories.html#jvm

My understanding is that the build dependency is:

	jamvm -> classpath

i.e the classpath package needs to be built/installed before we build
the jamvm package. If that's the case, then I would keep the "select
BR2_PACKAGE_CLASSPATH" in jamvm/Config.in, but get rid of the "depends
on BR2_PACKAGE_JAMVM" in classpath/Config.in.

Peter, you're the one who added classpath originally (commit
5062f530081913bd0487f0f879be180f30836ab8) including this "depends on
BR2_PACKAGE_JAMVM" dependency. What do you think ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
