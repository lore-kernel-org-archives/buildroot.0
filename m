From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2015 11:35:10 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/bwm-ng: fix build
 failures with gcc-5
In-Reply-To: <20150814144542.GC4017@free.fr>
References: <1439500078-22674-1-git-send-email-yann.morin.1998@free.fr>
 <20150814141516.GC25261@tarshish> <20150814144542.GC4017@free.fr>
Message-ID: <20150816093510.GA3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-08-14 16:45 +0200, Yann E. MORIN spake thusly:
> On 2015-08-14 17:15 +0300, Baruch Siach spake thusly:
> > On Thu, Aug 13, 2015 at 11:07:58PM +0200, Yann E. MORIN wrote:
> > > diff --git a/package/bwm-ng/bwm-ng.hash b/package/bwm-ng/bwm-ng.hash
> > > index 6bb8355..44272b1 100644
> > > --- a/package/bwm-ng/bwm-ng.hash
> > > +++ b/package/bwm-ng/bwm-ng.hash
> > > @@ -1,2 +1,2 @@
> > >  # Locally calculated
> > > -sha256  c1134358e268329d438b0996399003b0f0b966034fb4b5b138761c2f3c62ffdd  bwm-ng-0.6.tar.gz
> > > +sha1  9445885d05e2430ca174739e3aba343afce94076  bwm-ng-0.6.1.tar.gz
> > 
> > Why sha1?
> 
> Ah, I forgot to update the comment. The sha1 hash is from the SF.net
> download page, and it only lists sha1 and md5 (click on the (i) icon on
> the left of the download link to see the hashes):
> 
>     http://sourceforge.net/projects/bwmng/files/bwmng/0.6/
> 
> I'll fix the comment and resubmit. Thanks for noticing! :-)

Now that I think about it, we are no longer downloading from DF.net, but
directly from the new official location:
    http://www.gropp.org/?id=projects&sub=bwm-ng

And this new location does not provide a hash... :-(

But the file is also available on SF.net which provides this sha1.

So I wonder: should we point to the SF.net provided sha1, even though
we're not downloading from there?

I'll be waiting a bit for feedback before re-submitting...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
