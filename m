From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Tue, 21 Aug 2012 16:37:52 +0300
Subject: [Buildroot] [PATCH] python: firefox host-python dependency
 needs --enable-unicodedata
In-Reply-To: <20120821132339.45b28565@skate>
References: <1345057226-18726-1-git-send-email-stefan.froberg@petroprogram.com>
 <1345057226-18726-2-git-send-email-stefan.froberg@petroprogram.com>
 <20120821132339.45b28565@skate>
Message-ID: <50338F30.7020907@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

21.8.2012 14:23, Thomas Petazzoni kirjoitti:
> Le Wed, 15 Aug 2012 22:00:26 +0300,
> Stefan Froberg <stefan.froberg@petroprogram.com> a ?crit :
>
>> +ifneq ($(BR2_PACKAGE_PYTHON_UNICODEDATA),y)
>> +	HOST_PYTHON_CONF_OPT += --disable-unicodedata	
>> +else
>> +	HOST_PYTHON_CONF_OPT += --enable-unicodedata
>> +endif
> No, this is not correct. The BR2_PACKAGE_* options are here to
> configure the *target* packages. Host packages that are only
> dependencies to build target packages do not have kconfig options. So
> in this case, the only solution is to simply use --enable-unicodedata
> unconditionally to the host-python build.

Oh, sorry.
I was just trying to be carefull and not to mess with host-python too much.

>
> Can you post an updated patch with this change?

No problem. I will cook a new lil patch and resend.


By the way Thomas, what do you think about these two little changes to
SQLite and Valgrind ?

http://lists.busybox.net/pipermail/buildroot/2012-August/057377.html

http://lists.busybox.net/pipermail/buildroot/2012-August/057379.html


I also noticed that you accepted yasm and that little cairo patch for
next version.
Thank you!

Stefan

> Thanks,
>
> Thomas
