From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 06 Feb 2016 12:56:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: fix build with uClibc-ng
References: <1454191379-2800-1-git-send-email-bernd.kuhls@t-online.de>
 <20160131083749.534f5dd5@free-electrons.com>
Message-ID: <kj3hocx8lv.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sun, 31 Jan 2016 08:37:49 +0100 schrieb Thomas Petazzoni:

> Boost already checks for the availability of fenv functionality, and
> should set BOOST_NO_FENV_H if fenv functionality is not there.
[...]
> Do you have any idea why the check doesn't work ?

No.

> I've tried to go through the Boost mechanism that does this test, but
> it is really not conventional, so I couldn't so far figure out how it
> was all working.

Let's see what the result of the upstream bug report[1] will be. Until 
then we can try this new fix: http://patchwork.ozlabs.org/patch/579807/
or, alternatively, we can disable BR2_PACKAGE_BOOST_TEST for 
BR2_TOOLCHAIN_USES_UCLIBC=y. At least this will make to autobuilders 
happy ;)

Regards, Bernd

[1] https://svn.boost.org/trac/boost/ticket/11756
