From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 24 Jul 2015 08:52:23 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/python-web2py: new package
In-Reply-To: <20150723222622.53792f93@free-electrons.com>
References: <1429023904-20194-1-git-send-email-angelo.compagnucci@gmail.com>
 <1429023904-20194-3-git-send-email-angelo.compagnucci@gmail.com>
 <20150723222622.53792f93@free-electrons.com>
Message-ID: <CA+TH9VkFjmDk7nsjX+eozV5j6aCLNvmes4HwG1Krcx6KQQwnqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-07-23 22:26 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Angelo Compagnucci,
>
> On Tue, 14 Apr 2015 17:05:04 +0200, Angelo Compagnucci wrote:
>> This patch adds web2py package. web2py is a free open source
>> full-stack framework for rapid development of fast, scalable,
>> secure and portable database-driven web-based applications.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> ---
>> Changelog:
>>
>> v2 -> v3:
>>  * Fixed systemd service file installation path.
>>  * Fixed dependencies in Config.mk
>>  * Moved to the systemwide installed pydal.
>>  * Moved installation path to /var/www/.
>>
>> v1 -> v2:
>>  * Adding python2 dependency only (suggested by Yegor)
>
> Applied with some minor change:
>
> [Thomas: fixup symbolic link to the systemd service file.]
>
> However, there are two things that I believe should be
> improved/investigated:
>
>  * The installation of web2py on the target is huge: 20 MB. When I look
>    at it, it seems like there's a huge amount of example applications
>    and so on, which don't really make sense to install by default. Can
>    you look at trimming down the installation size to something closer
>    to what people would really need?

Yes, it could be trimmed, it indeed ships with a welcome application
and an examples application, I'll post a patch shortly.

>  * I setup an admin password, but I don't know what to do with. When I
>    connect to http://<myip>:8000, I can see web2py running. If I click
>    on "admin" in the box on the right hand side, it brings me to a
>    blank page that says "Admin is disabled because insecure channel".

It's the default behaviour. Admin interface could be accessed by
https, localhost, or ssh port redirect only. But unfortunately, web2py
doesn't starts if a password is not setted.

Sincerely, Angelo

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
