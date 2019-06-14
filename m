From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Jun 2019 22:35:54 +0200
Subject: [Buildroot] [PATCH v3 3/3] autobuild-run: do reproducible
 builds tests if BR2_REPRODUCIBLE=y
In-Reply-To: <b7f3b46f-6be2-615a-108e-2197111460d3@mind.be>
References: <20190611123416.11533-1-itsatharva@gmail.com>
 <20190611123416.11533-3-itsatharva@gmail.com>
 <20190613202308.GM2647@scaer>
 <CABM+sgrKRi873Pu3PBpqP-m6JtkHhJRMgvNPus2p+0uEja8YFA@mail.gmail.com>
 <b7f3b46f-6be2-615a-108e-2197111460d3@mind.be>
Message-ID: <20190614203554.GP2647@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-06-14 10:47 +0200, Arnout Vandecappelle spake thusly:
> On 14/06/2019 10:46, Atharva Lele wrote:
> >> You need to do (basically):
> > 
> >>? ? with open(os.path.join(outputdir, ".config"), "r") as fconf:
> >>? ? ? ? reproducible = "BR2_REPRODUCIBLE=y\n" in fconf.read()
> >>? ? build = do_reproducible_build if reproducible else do_build
> >>? ? ret = build(**kwargs)
> > 
> > It would still work if I just unindent the if-else block too right? This is what
> > I actually intended to do
> > It's working for me in testing..
> > Like this:
> > 
> > ? ? with open(os.path.join(outputdir, ".config"), "r") as fconf:
> > ? ? ? ? reproducible = "BR2_REPRODUCIBLE=y\n" in fconf.read()
> > ? ? if reproducible:
> > ? ? ? ? ret = do_reproducible_build(**kwargs)
> > ? ? else:
> > ? ? ? ? ret = do_build(**kwargs)
> 
>  Yes, and I prefer that version. Yann considers the '... if ... else ...'
> construct more pythonese, but I kind of like explicit conditions :-)

Well, if we use a language, we should write with the idioms of that
language. Python is not C, so we should not write Python as we would C.

That notwithstanding, I'm no Python expert either, so I'm also OK with
the more "traditional and conventional" ways. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
