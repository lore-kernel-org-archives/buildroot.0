From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2018 17:18:58 +0200
Subject: [Buildroot] [PATCH v2] core/legal-info: Add package
 dependencies with licenses to the manifest
In-Reply-To: <CANQCQpZs=342ftV_tVf7LxB9weMyhFxpqdB_QkX7Li1Le4v47A@mail.gmail.com>
References: <20180810140322.2748-1-sojkam1@fel.cvut.cz>
 <20180812142202.GF2402@scaer>
 <CANQCQpZs=342ftV_tVf7LxB9weMyhFxpqdB_QkX7Li1Le4v47A@mail.gmail.com>
Message-ID: <20180813151858.GB7915@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2018-08-13 08:40 -0500, Matthew Weber spake thusly:
> On Sun, Aug 12, 2018 at 9:22 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2018-08-10 16:03 +0200, sojkam1 at fel.cvut.cz spake thusly:
[--SNIP--]
> > > Changes against v1:
> > > * switched parameters of legal-manifest (added one is the last)
> > Actually, I disagree with that one: it is OK that new parameters be
> > added before the last, especially since the 'legal-manifest' macro
> > would be easier to review, see below...
> 
> If we change the format of the legal info csv, is there someway we
> could determine version of that file's syntax?  I assume worst case we
> can parse out the first line and see the additional dependencies
> entry?

So, I am not arguing that we should change the output at all.

What I am saying is that the _list_of_parameters_ can be reorganised,
while still keeping the output as before.

I.e. the 'legal-manifest' macro could be rewrittent from the current:

    define legal-manifest # pkg, version, license, license-files, source, url, {HOST|TARGET}
        echo '"$(1)","$(2)","$(3)","$(4)","$(5)","$(6)"' >>$(LEGAL_MANIFEST_CSV_$(7))
    endef

to this new one:

    define legal-manifest # {HOST|TARGET}, pkg, version, license, license-files, source, url, dependencies
        echo '"$(2)","$(3)","$(4)","$(5)","$(6)","$(7)","$(8)"' >>$(LEGAL_MANIFEST_CSV_$(1))
    endef

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
