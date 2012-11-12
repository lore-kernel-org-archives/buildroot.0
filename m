From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 12 Nov 2012 11:56:50 +0000
Subject: [Buildroot] mesa3d:  "ImportError: No module named libxml2"
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB6703AA459A@wetmex10>
References: <1531E53627F1F749B4FE809BF2A4EB6703A24FFD@wetmex10>
 <509DB31C.90903@mind.be> <1531E53627F1F749B4FE809BF2A4EB6703AA459A@wetmex10>
Message-ID: <50A0E402.1050805@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/11/2012 11:39, Vellemans, Noel wrote:

>>> The problem is that libxml2 python bindings are part of libxml2.  If
> we want to build them, we would have to make host-libxml2 depend on
>>> host-python...
>>> And that's certainly something we don't want.
>
> NOTE: At this time I did experiment a little with the libxml-2/python
> (in the latest-git-buildroot), in order to get mesa3d working, but I'm
> not 100% happy with it (as Maxime and Thomas an now you told me, and yes
> I do agree, it is not something that looks good, to make host-libxml2
> depend on host-python.)
>
>
>>>    BTW, Thomas already told you this on October 12 (though his
> explanation was a bit shorter :-).
>
>

I ported newer X11 to buildroot a while back a posted a link to the 
repository. At the time the only comment I got was from Thomas about the 
requirement for python/libxml2 which he hated then as well :)

I patched it so that it conditionally build host-libxml2 with the 
reuqired support if mesa3d was selected. My patch for this is at 
https://gitorious.org/willw-buildroot/willw-buildroot/commit/421b4fd572869b22de11a0f0fad161e284c41bcc

If we want newer mesa3d support I think we are going to have to come up 
with some suitable solution for this.

Regards
Will


-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
