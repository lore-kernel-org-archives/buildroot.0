From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 10:56:19 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/python-web2py: new package
In-Reply-To: <CA+TH9VmPa_hiGf4OmhUZf2vm3zKb0=y0=DE=DEZOLN4dk+LHdQ@mail.gmail.com>
References: <1428933447-32061-1-git-send-email-angelo.compagnucci@gmail.com>
 <1428933447-32061-3-git-send-email-angelo.compagnucci@gmail.com>
 <20150413162140.7851d045@free-electrons.com>
 <CA+TH9V=m3fCRPzt+vPKV3m=o5KL8W7DaxokRp1WFKNH07zzf0w@mail.gmail.com>
 <20150413231059.79c1d264@free-electrons.com>
 <CA+TH9VmPa_hiGf4OmhUZf2vm3zKb0=y0=DE=DEZOLN4dk+LHdQ@mail.gmail.com>
Message-ID: <20150414105619.13a008df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Tue, 14 Apr 2015 10:46:21 +0200, Angelo Compagnucci wrote:

> >> I can try! Honestly, I've not explored the option cause web2py is self
> >> contained and it doesn't require installation. It uses a writable
> >> directory for served applications, so suing a custom directory un
> >> /usr/share with writing permission setted to www-data seemed the most
> >> sensible choice.
> >
> > Installing with python-package seems to work, but it does not install
> > the web2py.py program itself, so it should be done separately.
> 
> Yes, I tried and it's practically useless.

Well, the setup.py can be fixed to also install web2py.py, or the
web2py.py can be installed by Buildroot separately, using a post
install hook.

> Honestly, more or less all the application framework I saw in the past
> runs in a www-data owned directory, I can think of joomla, redmine an
> many others I poked with.
> Probably do you want a more finer grain in the permission table, like
> giving writable permissions only to the directories that really need
> it, I can try!

Well, if the Python modules of web2py get installed by the setup.py
script, they are installed in /usr/lib/python<version>/site-packages/.
And clearly, we do not want to directory to be owned by www-data.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
