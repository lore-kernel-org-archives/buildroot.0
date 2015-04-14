From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 14 Apr 2015 10:46:21 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/python-web2py: new package
In-Reply-To: <20150413231059.79c1d264@free-electrons.com>
References: <1428933447-32061-1-git-send-email-angelo.compagnucci@gmail.com>
 <1428933447-32061-3-git-send-email-angelo.compagnucci@gmail.com>
 <20150413162140.7851d045@free-electrons.com>
 <CA+TH9V=m3fCRPzt+vPKV3m=o5KL8W7DaxokRp1WFKNH07zzf0w@mail.gmail.com>
 <20150413231059.79c1d264@free-electrons.com>
Message-ID: <CA+TH9VmPa_hiGf4OmhUZf2vm3zKb0=y0=DE=DEZOLN4dk+LHdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-04-13 23:10 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Angelo Compagnucci,
>
> On Mon, 13 Apr 2015 16:43:08 +0200, Angelo Compagnucci wrote:
>
>> dependencies. Probably only python would suffice, cause python-sqlite
>> is always compiled with python cause it's selected.
>
> There is no such thing as python-sqlite. There is only python, which
> may or may not have the sqlite functionality. In such cases, what you
> have to do is:
>
>  1/ At the Config.in level, make sure you select the relevant options,
>     i.e BR2_PACKAGE_PYTHON_SQLITE (or BR2_PACKAGE_PYTHON3_SQLITE if you
>     want to support Python 3)
>
>  2/ At the .mk level, depend on the appropriate package, in this case
>     'python' (or 'python3')

Ok!

>> > This package has a setup.py. Any reason why you're not using it,
>> > together with the python-package infrastructure?
>>
>> I can try! Honestly, I've not explored the option cause web2py is self
>> contained and it doesn't require installation. It uses a writable
>> directory for served applications, so suing a custom directory un
>> /usr/share with writing permission setted to www-data seemed the most
>> sensible choice.
>
> Installing with python-package seems to work, but it does not install
> the web2py.py program itself, so it should be done separately.

Yes, I tried and it's practically useless.

> Also, it
> is a bit weird that the whole thing has to be part of a www-data
> writable directory, no?

Honestly, more or less all the application framework I saw in the past
runs in a www-data owned directory, I can think of joomla, redmine an
many others I poked with.
Probably do you want a more finer grain in the permission table, like
giving writable permissions only to the directories that really need
it, I can try!

Thank you!

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
