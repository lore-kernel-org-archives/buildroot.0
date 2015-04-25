From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2015 19:52:03 +0200
Subject: [Buildroot] [PATCHv3 09/18] pkg-generic: remove the
 .stamp_rsync_sourced fake stamp file
In-Reply-To: <20150425194948.70ff9724@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-10-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150425173303.GJ4275@free.fr>
 <20150425194948.70ff9724@free-electrons.com>
Message-ID: <20150425175203.GN4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-25 19:49 +0200, Thomas Petazzoni spake thusly:
> On Sat, 25 Apr 2015 19:33:03 +0200, Yann E. MORIN wrote:
> 
> > > -$(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
> > > +$(1)-source:
> > 
> > The reason that line existed was to be able to define a dependency on
> > the stamp file. There is now no reason to keep this line at all; all you
> > have above is declaring a make goal without dependency or rule, so it
> > is entirely useless.
> 
> I don't think a target with no dependencies or rules is useless. It can
> be useful to not have an error when this target is triggered.
> 
> When you are going to do a 'make source', it will do a 'make
> $(1)-source' on all packages, including the ones that have
> <pkg>_OVERRIDE_SRCDIR. So there must be a $(1)-source target, even if
> it doesn't do anything.

Argh, indeed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
