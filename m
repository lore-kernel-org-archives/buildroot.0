From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 17:59:00 +0200
Subject: [Buildroot] [PATCH v5] package/radlib: new package
In-Reply-To: <1461167054.3415.27.camel@intel.com>
References: <1460563603-3748-1-git-send-email-ray.kinsella@intel.com>
 <1461167054.3415.27.camel@intel.com>
Message-ID: <20160420175900.2d55af03@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 15:44:14 +0000, Kinsella, Ray wrote:

> Please ignore this patch, as the current radlib build results in an
> incorrect dynamic link table in librad. 
> 
> Lines like the following are just broken 
> 
> raddebug_LDADD   += -lmysqlclient
> radmrouted_LDADD   += -lmysqlclient
> 
> or 
> 
> radmrouted_LDADD   += $(MYSQL_LIBS)
> raddebug_LDADD   += $(MYSQL_LIBS)
> 
> The radlib library (librad.so) should link against
> mysql/sqlite/postgresql. The radlib executables (shown above) should
> then link again radlib (librad.so). 

There were some other issues in your patch, and I was planning to
review it. I'll try to give you some feedback so that you can take it
into account for your v6.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
