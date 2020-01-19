From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jan 2020 09:53:35 +0100
Subject: [Buildroot] [PATCH v8 15/20] package/kodi-screensaver-rsxs:
 bump version
In-Reply-To: <f8ecfgxnh9.ln2@ID-313208.user.individual.net>
References: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
 <20200118200620.3967240-16-bernd.kuhls@t-online.de>
 <20200118221442.GJ32369@scaer>
 <f8ecfgxnh9.ln2@ID-313208.user.individual.net>
Message-ID: <20200119085335.GM32369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-01-18 23:42 +0100, Bernd Kuhls spake thusly:
> Am Sat, 18 Jan 2020 23:14:42 +0100 schrieb Yann E. MORIN:
> > Note: I am fine with disabling entirely, but I'd prefer this is
> > explictly stated, like:
> > 
> >     Even though rsxs has a minimal bundled imagemagick, we simply
> >     disable drempels to avoid using a bundled library.
> ok, you can add this sentence to the commit log because this was my 
> intention.
> 
> > You're adding a few dependencies, some of whihch are not ovious, like
> > libtool.
> 
> They are all lined-up in CMakeLists.txt, including ltdl:
> https://github.com/xbmc/screensavers.rsxs/blob/Leia/CMakeLists.txt#L15
> 
> > Additionally, you're not propagating the dependency of glm (needs
> > libstdc++). That's OK because Kodi does need C++, and thus rsxs already
> > implicitly has that dependency, but I don;t like it much, though...
> 
> True, but there will never be a time when Kodi will not depend on c++ so 
> I did not add this dependency to all the subpackages of kodi.

Yeah, but seeing new 'select' for whjich the dependencies are not
propagated at least warrant a note in the commit log, if at all to show
the reviewers/committers that you accoutned for the deepndency in some
way (and that it is not just an oversight).

Thanks for the feedback. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
