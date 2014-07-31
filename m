From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Jul 2014 22:28:39 -0300
Subject: [Buildroot] [PATCH] samba4: bump to version 4.1.10
In-Reply-To: <20140731003118.322103fe@free-electrons.com>
References: <1406657724-21261-1-git-send-email-gustavo@zacarias.com.ar>	<20140729202202.6ca3c3f3@free-electrons.com>	<53D7EDCD.8040402@zacarias.com.ar>	<20140730235820.3f3275d2@free-electrons.com>	<53D96C6E.5060203@zacarias.com.ar>
 <20140731003118.322103fe@free-electrons.com>
Message-ID: <53D99BC7.70404@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/30/2014 07:31 PM, Thomas Petazzoni wrote:

> Then wouldn't it be simpler/saner to simply remove those tools and
> Python modules from the target completely?

We can remove the tools and keep the comment but i wouldn't go as far as
removing everything since some are related to samba support libraries
and others are part of bundled libraries (talloc, tdb, tevent).
There's another option, we can do a compileall run on samba's
site-packages directory, a quick test says it works fine.
We can do it from the samba4 package (what i tested) or maybe a
target-finalize hook from within the python infra for the whole site dir.
Regards.
