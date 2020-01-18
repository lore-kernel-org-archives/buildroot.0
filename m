From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Jan 2020 23:42:55 +0100
Subject: [Buildroot] [PATCH v8 15/20] package/kodi-screensaver-rsxs:
 bump version
References: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
 <20200118200620.3967240-16-bernd.kuhls@t-online.de>
 <20200118221442.GJ32369@scaer>
Message-ID: <f8ecfgxnh9.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Am Sat, 18 Jan 2020 23:14:42 +0100 schrieb Yann E. MORIN:

> Note: I am fine with disabling entirely, but I'd prefer this is
> explictly stated, like:
> 
>     Even though rsxs has a minimal bundled imagemagick, we simply
>     disable drempels to avoid using a bundled library.

ok, you can add this sentence to the commit log because this was my 
intention.

> You're adding a few dependencies, some of whihch are not ovious, like
> libtool.

They are all lined-up in CMakeLists.txt, including ltdl:
https://github.com/xbmc/screensavers.rsxs/blob/Leia/CMakeLists.txt#L15

> Additionally, you're not propagating the dependency of glm (needs
> libstdc++). That's OK because Kodi does need C++, and thus rsxs already
> implicitly has that dependency, but I don;t like it much, though...

True, but there will never be a time when Kodi will not depend on c++ so 
I did not add this dependency to all the subpackages of kodi.

> Again, if all it takes are a few sentences or bullet points to be added
> to the commit log, no need to respin: I can add them locally before
> applying.

If you consider my explanations sufficient you are free to add them to 
the commit log ;)

> Regards,
> Yann E. MORIN.

Regards, Bernd

PS: Please note that you will not receive emails from me because your 
provider blocks my provider for several years now:
<yann.morin.1998@free.fr>: delivery temporarily suspended: host
 mx2.free.fr[212.27.42.59] refused to talk to me: 421 Too many errors from
    your IP (194.25.134.85), please visit http://postmaster.free.fr/
