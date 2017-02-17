From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Feb 2017 19:54:34 +0100
Subject: [Buildroot] [PATCH v3 01/38] package/libdvdcss: add
 Kodi-specific patches
In-Reply-To: <XnsA71FC7BAC87A6ID313208userindividu@bernd-kuhls.de>
References: <20170204114451.20935-2-bernd.kuhls@t-online.de>
 <20170204230821.GA3805@free.fr>
 <XnsA7135B7CF93B2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20170205212408.GC3562@free.fr>
 <i6vmmdxipi.ln2@ID-313208.user.individual.net>
 <rk5nmdxipi.ln2@ID-313208.user.individual.net>
 <20170209232937.2a071f11@free-electrons.com>
 <XnsA719AD8F76801ID313208userindividu@bernd-kuhls.de>
 <20170212135110.61e55c66@free-electrons.com>
 <XnsA71FC7BAC87A6ID313208userindividu@bernd-kuhls.de>
Message-ID: <20170217185434.GB3470@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Thomas, All,

On 2017-02-17 19:38 +0100, Bernd Kuhls spake thusly:
> Thomas Petazzoni <thomas.petazzoni-
> wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8 at public.gmane.org> wrote in 
> news:20170212135110.61e55c66 at free-electrons.com:
> 
> > Except that we definitely don't want this thing. Kodi should use the
> > libdvd* libraries built by Buildroot. Not download/build its own.
> 
> in this case we need to
> - apply the Kodi-specific patches, or
> - switch libdvd* upstream to the Kodi repos

Or:

  - add new pacakges, kodi-libdvdnav, kodi-libdvdread, kodi-libdvdcss

Not that it is much better than having them managed by Kodi.

Except that those managed by Kodi would be downloaded at configure or
build time, not when doing 'make source', so we could not do an off-line
build. That alone would warrant they be separate packages, IMHO.

Of course, this then raises the questions:

 1- can they replace the existing ones for other applications?
 2- would they conflict (filenames) with the pristine versions?

     1 | 2 | Solution
    ---+---+--------------------------------------------
     N | N | separate, unrelated packages with no "depends on !the-others"
     N | Y | dunno...
     Y | N | virtual packages for each, like libjpeg?
     Y | Y | official ones "depends on !the-others"

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
