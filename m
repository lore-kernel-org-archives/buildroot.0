From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Aug 2015 16:32:23 +0200
Subject: [Buildroot] Add missing config to RPM target package
In-Reply-To: <55DCC1F6.4060008@gmx.de>
References: <55D70AF3.3050604@gmx.de>
 <20150823200604.0c1e00cb@free-electrons.com>
 <55DCC1F6.4060008@gmx.de>
Message-ID: <20150831163223.67982cd3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Ehmanns,

On Tue, 25 Aug 2015 21:28:54 +0200, Andreas Ehmanns wrote:

> in my first try I had no pcre support, so rpm package was built with 
> --with-pcre=none
> Trying to install a binary rpm just containing one file on my target 
> system failed at the very beginning when rpm was checking package 
> dependencies. Setting --with-pcre=internal solved this problem. So it 
> seems to me that pcre is necessary to to dependency checks which is in 
> my opinion one of the main features or rpm. Isn't it?

If that's indeed the case, then pcre support is really mandatory for
RPM to be useful. Therefore, can you send a patch to make the pcre
dependency a mandatory one? Don't forget to add a comment explaining
why we're making it mandatory even if RPM makes it an optional
dependency.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
