From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2015 20:35:12 +0200
Subject: [Buildroot] [PATCH v2 1/1] xserver_xorg-server: Change default
 to X.org modular server
In-Reply-To: <20150411201805.4bac425d@free-electrons.com>
References: <1428772436-16962-1-git-send-email-bernd.kuhls@t-online.de>
 <20150411195842.52a58aff@free-electrons.com>
 <20150411181330.GL4221@free.fr>
 <20150411201805.4bac425d@free-electrons.com>
Message-ID: <20150411183512.GM4221@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-11 20:18 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Sat, 11 Apr 2015 20:13:30 +0200, Yann E. MORIN wrote:
> 
> > I would not mind much doing the switch to the modular Xserver by
> > default. But that would mean proper dependency propagation (i.e. C++).
> 
> I don't understand what you mean here.

See below...

> > However, an alternative solution would be to remove the 'default' clause
> > altogether from the choice:
> > 
> >   - if C++ is available, the modular Xserver is enabled by default,
> >     being the first option in the choice;
> > 
> >   - if C++ is not enabled, then KDrive is enabled, being the only option
> >     in the choice.
> 
> Well, Bernd's patch is doing that in a perfectly fine way. If C++ is
> available, the default on modular will work. If C++ is not available,
> since the modular option will not be available, the only remaining
> option in the choice will be Kdrive, and it will be the selected option.
> 
> Am I missing something?

No, not really.

Even though 'default' in Kconfig is not authoritative, and that's not
even a warning to default to an option that has unmet dependencies, I
still find it odd to default to that option.

And since the default is defaulting to the first entry in the choice, it
is no longer needed at all.

At best, we could add a comment summarising the situation.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
