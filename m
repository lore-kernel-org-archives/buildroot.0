From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Nov 2017 16:01:44 +0100
Subject: [Buildroot] Cannot rebuild autobuild
In-Reply-To: <20171121201605.tzmasudql66iruxa@dell5510>
References: <20171113144231.gddccsqlelrhrokw@dell5510>
 <20171114234409.114f002f@gmx.net>
 <20171115125857.dcy6j7qvjt32ww43@dell5510>
 <61134b08-bb0a-4665-4b68-3ea2e4063563@mind.be>
 <20171116001919.67e98b4b@gmx.net>
 <58b8ef53-75b6-fc8b-8d37-e21570ae4e3b@mind.be>
 <20171116072948.smctbcvxwkxgqoah@x230>
 <d13312cf-ae70-92fd-8819-a86c79d1723b@mind.be>
 <20171118223206.069b771a@gmx.net>
 <20171121201605.tzmasudql66iruxa@dell5510>
Message-ID: <20171125150144.GC2798@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2017-11-21 21:16 +0100, Petr Vorel spake thusly:
> > >  If the *.mk is expanded in alphabetical order, pkg-toolchain-external.mk will
> > > always come before toolchain-external.mk. Otherwise it is possible (depending on
> > > the state of hash tables or inode numbers or whatever) that
> > > toolchain-external-custom.mk gets included first.
[--SNIP--]
> I found by bisecting that our bug is caused by this change in make:
> 4fd5672 ("Use Jenkins hash.")
> https://git.savannah.gnu.org/cgit/make.git/commit/?id=4fd56724ad281498d3c8b27a4b25b4070f6e4e65

Good work at bisecting it! :-)

> It's a version after last release (4.2.1).
> I wonder whether it's a bug in make (I guess so) and whether we should report it
> (probably).

This is indeed a change in behaviour. However, as make ever documented
a guranteed/non-guaranteed ordering of wildcards to begin with?

The manual for the current make version says nothing about the ordering,
and neither do the manual for older versions (I've checked only a few of
them).

So, this is a change in behaviour, and should be reported upstream as a
bug. Will you do so?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
