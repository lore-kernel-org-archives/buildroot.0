From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2014 16:10:56 +0100
Subject: [Buildroot] [PATCH 0/4] rt-tests: patches rename & versoin bump
 & support of non-NPTL tools
In-Reply-To: <1415718077.4122.19.camel@abrodkin-8560l.internal.synopsys.com>
References: <1415613549-2886-1-git-send-email-abrodkin@synopsys.com>
 <20141111154340.258edd64@free-electrons.com>
 <1415718077.4122.19.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <20141111161056.52d0cee7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 11 Nov 2014 15:01:17 +0000, Alexey Brodkin wrote:

> >  * You should never resend a new version of just one patch. Always send
> >    the complete series again, even if only one patch has changed. I was
> >    mistaken when looking at patchwork, and originally only applied the
> >    patch removing the NPTL dependency, because it was available
> >    standalone, outside of any series.
> 
> Indeed my bad, I was not sure if I may re-send only 1 patch so I asked
> if that's ok but never got an answer here
> http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/99171
> 
> Nevertheless I understand that that's my fault and I'll try to not do
> such silly things in the future, so thanks for this comment.

No problem! Everybody learns progressively how to do things :)

> >  * You should use 'git format-patch -M' to enable rename detection. It
> >    would have made patch 1 a lot smaller, and easier to review.
> 
> Hm, I didn't know about this actually.
> I did "git mv" and believed that there's nothing else I may do to
> simplify rename changes. Will do it this way next time.

I must confess that I don't actually don't know precisely how git
encodes renames. But basically, my understanding is that even if you do
"git mv", "git format-patch" will encode a rename as a complete removal
+ a complete addition, because that's the only way, in the traditional
patch format, to express a rename. However, by passing -M to git
format-patch, you tell git that it can generate a git patch, making the
assumption that it's git that will be used to apply the patch, and not
just the basic "patch" tool. In this case, it can encode the rename in
a smarter way.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
