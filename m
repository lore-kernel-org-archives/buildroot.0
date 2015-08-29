From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 14:50:54 +0200
Subject: [Buildroot] [PATCH 1/1] python3: add patch to fix PEP 3147
 issue with automake built packages
In-Reply-To: <20150829140635.1495affc@trantor>
References: <1440773921-769-1-git-send-email-cvubrugier@fastmail.fm>
 <20150828193643.10876a0f@free-electrons.com>
 <20150829140635.1495affc@trantor>
Message-ID: <20150829145054.4aa2783c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christophe,

On Sat, 29 Aug 2015 14:06:35 +0200, Christophe Vu-Brugier wrote:

> > I'm pretty sure with your patch we can remove patch 016 (so your patch
> > could replace it). I'm not sure about patch 004, though.
> 
> Indeed, patch 016 for distutils / setuptools is no longer necessary.
> Moreover, patch 004 for the standard library can be dropped as well.
> Afer removing patches 004 and 016, I see no __pycache__ directory in the
> Python path and the interpreter behaves as expected (I tested by loading
> modules and running samples for readline, urwid, six, kmod or
> pyparsing).
> 
> I will respin my patch to drop 004 and 016 and update 005 which is
> impacted by the removal of 004.

Excellent, thanks for the additional investigation! It's definitely
great to replace 3 patches by just one.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
