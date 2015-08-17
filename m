From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Aug 2015 23:04:25 +0200
Subject: [Buildroot] [PATCHv2] [autobuild] package/bwm-ng: fix build
 failures with gcc-5
In-Reply-To: <20150817223418.6f75a2e6@free-electrons.com>
References: <1439736791-28748-1-git-send-email-yann.morin.1998@free.fr>
 <20150817223418.6f75a2e6@free-electrons.com>
Message-ID: <20150817210425.GB3988@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-08-17 22:34 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Sun, 16 Aug 2015 16:53:11 +0200, Yann E. MORIN wrote:
> 
> > diff --git a/package/bwm-ng/bwm-ng.hash b/package/bwm-ng/bwm-ng.hash
> > index 6bb8355..85f436f 100644
> > --- a/package/bwm-ng/bwm-ng.hash
> > +++ b/package/bwm-ng/bwm-ng.hash
> > @@ -1,2 +1,4 @@
> > -# Locally calculated
> > -sha256  c1134358e268329d438b0996399003b0f0b966034fb4b5b138761c2f3c62ffdd  bwm-ng-0.6.tar.gz
> > +# From: http://sourceforge.net/projects/bwmng/files/bwmng/0.6/
> > +# sha1  9445885d05e2430ca174739e3aba343afce94076  bwm-ng-0.6.1.tar.gz
> > +# Because we do not trust SF.net, locally computed sha256:
> > +sha256  027cf3c960cd96fc9ffacdf7713df62d0fc55eeef4a1388289f8a62ae5e50df0  bwm-ng-0.6.1.tar.gz
> 
> I think this is silly. We should use both the sha1 provided by
> sourceforge and a locally calculated sha256 hash.

See the discussion that got us toward this situation:
    http://lists.busybox.net/pipermail/buildroot/2015-August/137445.html
    http://lists.busybox.net/pipermail/buildroot/2015-August/137447.html

Basically:
  - we no longer download from SF.net
  - so, how relevant is it to use a SF-provided hash?

Of course, since the hash does match as of today, we can keep it if you
really want it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
