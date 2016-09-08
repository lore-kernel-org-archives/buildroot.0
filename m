From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 22:21:24 +0200
Subject: [Buildroot] [PATCH 1/2] package/mysql: add MYSQL_SOCKET variable
In-Reply-To: <1ac57a8d-e8b7-4a0a-8b6c-3951e584b54a@je-eigen-domein.nl>
References: <1473345222-10563-1-git-send-email-bos@je-eigen-domein.nl>
 <20160908144421.GA5740@free.fr>
 <1ac57a8d-e8b7-4a0a-8b6c-3951e584b54a@je-eigen-domein.nl>
Message-ID: <20160908222124.086a8b68@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Sep 2016 17:27:24 +0200, Floris Bos wrote:

> > If that is the default of mysql, is there a way to force it during
> > configure? I'm a bit uneasy to rely on magic values, in case a future
> > version changes this default location...  
> 
> Yes, could force it to use that value with a --with-unix-socket-path= 
> configure option or in the server configuration file.

That would be a good idea.

> 
> 
> Do note that while /tmp is the upstream default for all MySQL versions, 
> it is naturally not the safest location for multi-user systems.
> If an unprivileged user gains access to the system sooner than MySQL is 
> up & running, he could create his own /tmp/mysql.sock and intercept 
> authentication details and queries of clients connecting.
> So normal Linux distributions would override the default to a different 
> location, e.g. under /var/run

So why not use --with-unix-socket-path=/var/run/mysql.sock ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
