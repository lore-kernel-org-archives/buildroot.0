From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 13:37:48 +0200
Subject: [Buildroot] [PATCH 2/5] webkitgtk: add dependency on the woff2
 package
In-Reply-To: <20180927124148.GB16720@momiji> (Adrian Perez de Castro's message
 of "Thu, 27 Sep 2018 12:41:48 +0300")
References: <20180922235333.85642-1-aperez@igalia.com>
 <20180922235333.85642-3-aperez@igalia.com>
 <20180925225255.3fe01107@windsurf> <20180927124148.GB16720@momiji>
Message-ID: <87tvmbw4qb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

Hi,

 >> However, since woff2 has very few dependencies, and
 >> woff2+brotli+host-pkgconf build in 19 seconds, it's nothing compared to
 >> webkitgtk, so I applied your patch.

 > I will make a follow-up patch to make WOFF2 optional. I think it should be
 > fine to enable it by default if BR2_PACKAGE_WOFF2 is enabled, and add a line
 > in the help description telling that it is recommended to enable it.

Correct. Now that we have updated kconfig we could even consider using
the imply keyword to enable woff2 by default if it is really an option
that most people should enable:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=237e3ad0f195d8fd34f1299e45f04793832a16fc

-- 
Bye, Peter Korsgaard
