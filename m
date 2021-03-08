From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Mar 2021 19:14:46 +0100
Subject: [Buildroot] [PATCH] package/frotz: Update to version 2.53
In-Reply-To: <20210308051551.3dace767@tuxfamily.org>
References: <20210307152147.514774-1-huth@tuxfamily.org>
 <20210307214115.GG2275@scaer>
 <20210308051551.3dace767@tuxfamily.org>
Message-ID: <20210308181446.GA2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-03-08 05:15 +0100, Thomas Huth spake thusly:
> Am Sun, 7 Mar 2021 22:41:15 +0100
> schrieb "Yann E. MORIN" <yann.morin.1998@free.fr>:
> > On 2021-03-07 16:21 +0100, Thomas Huth spake thusly:
> > > +	  other Z-code games. Note that frotz cannot be run as
> > > root.  
> > Out of curiosity: what is the technical reason this is not possible?
> I don't know for sure, but I think it's because Frotz is running
> untrusted byte code - so if there's a bug in the interpreter, some
> malicious byte code could get root access to the system.

Ok, that is indeed not a technical limitation, but rathetr an attempt at
not causing too much trouble... But in practice, that does not protect
from much, and there night be cases where running as root is actually
required. But oh well, this is a game emualtor, so I am not too
concerned about it. ;-)

Thanks for the explanations.

> > >  	  You must add a normal user to your buildroot
> > > configuration to be able to use it.  
> > Why don't we then define one, like:
> >     define FROTS_USERS
> >         frotz -1 frotz -1 - - - -
> >     endef
> Not sure whether it makes sense to hard-code a user without password
> here...? IMHO it makes more sense to leave that decision (how should
> the user be called? should the account get a password or not?) to the
> person who creates the buildroot image.

I am a bit torn between the "make things work by default" mantra, and
the "let the user customise as they see fit" attitude...

I guess we can leave ats it is now, then...

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
