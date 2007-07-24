From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Tue, 24 Jul 2007 20:27:33 +0300
Subject: [Buildroot] config update
In-Reply-To: <20070724123433.GA18856@aon.at>
References: <469C604E.5060703@cs.helsinki.fi> <20070724123433.GA18856@aon.at>
Message-ID: <46A63685.5060806@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer kirjoitti:
> On Tue, Jul 17, 2007 at 09:23:10AM +0300, Heikki Lindholm wrote:
> 
>>Hello,
>>
>>I just updated my OS X buildroot and, recent changes breaking it, I have 
> 
> 
> Can you please be more specific as to how it broke?

Well, basically, it was easier to fix than thought, and I posted a patch 
already:
http://buildroot.uclibc.org/lists/buildroot/2007-July/003659.html

The two culprits for the breakage are:
(1) foo.h includes features.h, which doesn't exist on OS X. Referring to 
my above patch, this could also be fixed in the Makefile by not 
including foo.h on OS X, but IMHO that's trickier (uname).
(2) The linking was changed so, that ncurses wasn't linked in on OS X 
anymore

BUT I also noted another breakage, which I'm clueless about:
http://buildroot.uclibc.org/lists/buildroot/2007-July/003658.html
I'm using the same config I was with an older version (for example, rev 
18688 worked).

> 
> 
>>to ask, why was packages/config updated? It worked just fine - even on 
>>OS X - before the bump to linux 2.6.21* config system. Were there 
>>features missing from the old version or something?
> 
> 
> The i18n support was basically not working right. Apart from better
> colour-handling (vie the respective env vars, see source) this was about
> the only reason for the update. As to the libintl breakage, please refer
> to several bug-reports in the bugtracker.

Fair enough. I did skim through the libintl reports, but those didn't 
apply on OS X -- or my installation, at least.

-- Heikki Lindholm
