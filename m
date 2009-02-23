From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 23 Feb 2009 09:14:29 +0000
Subject: [Buildroot] broken alsa-lib
In-Reply-To: <20090222224350.GG5893@buzzloop.caiaq.de>
References: <20090222224350.GG5893@buzzloop.caiaq.de>
Message-ID: <49A268F5.5030300@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniel Mack wrote:
> Hi,
> 
> as pointed out in two threads on the alsa-dev ML, there seems to be
> general problem with ALSA libraries built by buildroot:
> 
> 	http://mailman.alsa-project.org/pipermail/alsa-devel/2009-February/014999.html
> 	http://mailman.alsa-project.org/pipermail/alsa-devel/2009-February/015005.html
> 
> Any hints, anyone?

Not sure if this is the same as a problem I was seeing with alsa-lib. It was a while ago 
so not entirely sure. However I found my problem was to do with the complicated alsa 
versioning API meaning that the wrong version of the function was called. I fixed it by 
adding --with-versioned="no" to the alsa-lib configure (I also moved to 1.0.19 as that had 
a number of bug fixes for other things I needed).

Hope that helps,

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
