From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 1 May 2012 23:51:02 +0000 (UTC)
Subject: [Buildroot] uemacs doesn't clear ixon termios flag?
References: <jn91fg$mt2$1@dough.gmane.org> <jn9ock$htn$1@dough.gmane.org>
 <87lilbzhan.fsf@macbook.be.48ers.dk>
Message-ID: <jnpst6$49t$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-05-01, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:
>
> Grant> This appears to be bug in uemacs that's been known about for
> Grant> several years.  The fix below is from the busybox mailing list 3
> Grant> years ago
> Grant> http://lists.busybox.net/pipermail/busybox/2009-February/068304.html:
[...]

> That's afaik the uemacs upstream we're using.

That's what I thought.  I haven't looked into why upstream has been
ignoring the bug fix, but it seemed to be rather widely known.

> Grant> If I submitted a patch and a modified uemacs.mk would it likely be
> Grant> accepted?
>
> Sure! Notice that I recently converted the uemacs package to gentargets,
> but it should be functionally equivalent.

Cool. I submitted the patch a few days ago:

  https://bugs.busybox.net/show_bug.cgi?id=5144

I think the patch should work both pre and post gentargets conversion.
All it does is create a new patch file in the package directory.  It
doesn't touch any existing files.  As long as the gentargets call
applies all of the *.patch files in alphabetical order it should "just
work".
  
I can stumble along with either vi or nano, but it requires too
much concentration...

-- 
Grant Edwards               grant.b.edwards        Yow! I joined scientology
                                  at               at a garage sale!!
                              gmail.com            
