From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 23:10:59 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/python-web2py: new package
In-Reply-To: <CA+TH9V=m3fCRPzt+vPKV3m=o5KL8W7DaxokRp1WFKNH07zzf0w@mail.gmail.com>
References: <1428933447-32061-1-git-send-email-angelo.compagnucci@gmail.com>
 <1428933447-32061-3-git-send-email-angelo.compagnucci@gmail.com>
 <20150413162140.7851d045@free-electrons.com>
 <CA+TH9V=m3fCRPzt+vPKV3m=o5KL8W7DaxokRp1WFKNH07zzf0w@mail.gmail.com>
Message-ID: <20150413231059.79c1d264@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Mon, 13 Apr 2015 16:43:08 +0200, Angelo Compagnucci wrote:

> dependencies. Probably only python would suffice, cause python-sqlite
> is always compiled with python cause it's selected.

There is no such thing as python-sqlite. There is only python, which
may or may not have the sqlite functionality. In such cases, what you
have to do is:

 1/ At the Config.in level, make sure you select the relevant options,
    i.e BR2_PACKAGE_PYTHON_SQLITE (or BR2_PACKAGE_PYTHON3_SQLITE if you
    want to support Python 3)

 2/ At the .mk level, depend on the appropriate package, in this case
    'python' (or 'python3')

> > This package has a setup.py. Any reason why you're not using it,
> > together with the python-package infrastructure?
> 
> I can try! Honestly, I've not explored the option cause web2py is self
> contained and it doesn't require installation. It uses a writable
> directory for served applications, so suing a custom directory un
> /usr/share with writing permission setted to www-data seemed the most
> sensible choice.

Installing with python-package seems to work, but it does not install
the web2py.py program itself, so it should be done separately. Also, it
is a bit weird that the whole thing has to be part of a www-data
writable directory, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
