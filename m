From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Dec 2017 23:27:39 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5scxml: needs
 qt5declarative package
In-Reply-To: <20171227231700.4b3cfadf@gmx.net>
References: <20171227210731.11EFE83571@busybox.osuosl.org>
 <20171227222616.6f4dd5de@gmx.net>
 <20171227224206.37fef60a@windsurf.home>
 <20171227231700.4b3cfadf@gmx.net>
Message-ID: <20171227232739.3312d727@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Dec 2017 23:17:00 +0100, Peter Seiderer wrote:

> > > 	select BR2_PACKAGE_QT5BASE_GUI # qt5declarative
> > > 	select BR2_PACKAGE_QT5XMLPATTERNS # qt5declarative    
> > 
> > So why does your patch also selects them, if they are already
> > implicitly selected by qt5declarative ?  
> 
> Thanks for the reasoning, but one more question: with this logic
> the above 'select BR2_PACKAGE_QT5BASE' could be removed (but the
> below dependency on qt5base without the corresponding select seems
> ugly)?

We don't have a very clear cut approach on this. I believe the best
reasoning is: if the package uses *directly* qt5base, then it should
explicitly select it and have it in <pkg>_DEPENDENCIES. If it's only
indirectly used through another package, then selecting this "another
package" is enough.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
