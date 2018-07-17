From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Jul 2018 16:08:21 +0200
Subject: [Buildroot] [PATCH] cutelyst: new package
In-Reply-To: <CACo8zOdPnJhMDqcJMp4fdKdLTsuGg9RLMNbjGEZBtxQaXEOeyg@mail.gmail.com>
References: <20180716204912.8915-1-dantti12@gmail.com>
 <20180717090151.30233d21@windsurf>
 <CACo8zOdPnJhMDqcJMp4fdKdLTsuGg9RLMNbjGEZBtxQaXEOeyg@mail.gmail.com>
Message-ID: <20180717160821.2178aacf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Jul 2018 10:23:26 -0300, Daniel Nicoletti wrote:

> > Why do you have a depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE ? This
> > dependency is not used by anything in qt5base.  
> I based on the grantlee package, I actually thought this means QJson..

Grantlee has the BR2_PACKAGE_QT5_JSCORE_AVAILABLE dependency because it
selects the BR2_PACKAGE_QT5SCRIPT option.

Since you don't select BR2_PACKAGE_QT5SCRIPT, there is no reason to
depend on BR2_PACKAGE_QT5_JSCORE_AVAILABLE.

> > We like to have a hash for the license file as well.  
> a hash of the license file included in the tarball?

Yes. This allows us to detect when license files are modified, and
therefore to check if the license terms have been changed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
