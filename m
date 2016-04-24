From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Sun, 24 Apr 2016 14:49:18 +0000
Subject: [Buildroot] [PATCH v5] package/radlib: new package
In-Reply-To: <20160420175900.2d55af03@free-electrons.com>
References: <1460563603-3748-1-git-send-email-ray.kinsella@intel.com>
 <1461167054.3415.27.camel@intel.com>
 <20160420175900.2d55af03@free-electrons.com>
Message-ID: <1461509358.5247.3.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas,

The backend 'choice' needs to be reworked to to remove sqllite. mysql
or postgresql is used in 'raddatabase', these are mutually exclusive.
SQLite ('radsqlite') is used seperately, it can be simply be enabled or
disabled depending on whether it is BR2_PACKAGE_SQLITE is enabled.

Thanks,

Ray K


On Wed, 2016-04-20 at 17:59 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 20 Apr 2016 15:44:14 +0000, Kinsella, Ray wrote:
> 
> > Please ignore this patch, as the current radlib build results in an
> > incorrect dynamic link table in librad. 
> > 
> > Lines like the following are just broken 
> > 
> > raddebug_LDADD   += -lmysqlclient
> > radmrouted_LDADD   += -lmysqlclient
> > 
> > or 
> > 
> > radmrouted_LDADD   += $(MYSQL_LIBS)
> > raddebug_LDADD   += $(MYSQL_LIBS)
> > 
> > The radlib library (librad.so) should link against
> > mysql/sqlite/postgresql. The radlib executables (shown above)
> > should
> > then link again radlib (librad.so). 
> 
> There were some other issues in your patch, and I was planning to
> review it. I'll try to give you some feedback so that you can take it
> into account for your v6.
> 
> Thanks,
> 
> Thomas
