From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 Aug 2013 08:12:01 -0300
Subject: [Buildroot] [PATCH] python-setuptools: Add patch to prevent
 detecting the host installation
In-Reply-To: <CAGm1_ksuhkORZYRNw1HPixOjBzRmk3MWgHp_yztMtHsYEyRrLw@mail.gmail.com>
References: <1377008739-12484-1-git-send-email-markos.chandras@imgtec.com>
 <521527EC.8000307@mind.be>
 <CAGm1_kvOgqynT=gJcxQW=xr_MQeiL8QuxiKAi88QrKADwQY1EQ@mail.gmail.com>
 <CAGm1_ktgXAkpBOQJ4JspAfWKirqQg2SdKOvYH9+on2wKKgHOFw@mail.gmail.com>
 <5215D75E.5080301@mind.be>
 <CAGm1_ksuhkORZYRNw1HPixOjBzRmk3MWgHp_yztMtHsYEyRrLw@mail.gmail.com>
Message-ID: <5215F201.6090308@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/22/2013 07:36 AM, Yegor Yefremov wrote:

I'll answer on the last mail to make it simpler, otherwise it would be a
lot of different mails :)
Basically there's two issues going on here.

First, Markos's patch is still necessary.
On a gentoo build host which is also a desktop and where setuptools
installed is "a common thing" thing fails no matter what is done without it.

Second, what Arnout said is valid too, but it's correctness rather than
a fix. python-netifaces doesn't need python-setuptools so that can be
dropped from DEPENDENCIES and Config.in, and PYTHONPATH in
HOST_PYTHON_SETUPTOOLS_INSTALL_CMDS is in fact redundant.
However if someone wants to concoct a patch for python-setuptools
there's an additional nag for the target variant - it should
depend/select BR2_PACKAGE_PYTHON_SSL since pypi forces https these days
otherwise it'll be a terrible experience.

Regards.
