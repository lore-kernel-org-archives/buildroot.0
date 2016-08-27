From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Aug 2016 00:07:05 +0200
Subject: [Buildroot] [PATCH 05/16 v3] core: move rule to create basic
 directories
In-Reply-To: <20160827214126.05cf6760@free-electrons.com>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <35c825b427c5e89497aafde9b787986eeeac1ad7.1468750623.git.yann.morin.1998@free.fr>
 <20160827214126.05cf6760@free-electrons.com>
Message-ID: <20160827220705.GK5755@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-27 21:41 +0200, Thomas Petazzoni spake thusly:
> On Sun, 17 Jul 2016 12:34:25 +0200, Yann E. MORIN wrote:
> > Some of those directories will be needed even during configuration, like
> > BUILD_DIR, where we'll store the generated kconfig snippet.
> > 
> > So, move the rule to create them outside the HAVE_CONFIG block.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Peter Korsgaard <jacmet@uclibc.org>
> 
> I've applied this patch to next, after fixing the typo in the commit
> log noticed by Romain Naour. One question below, though.

Thanks! :-)

> > +################################################################################
> > +#
> > +# staging and target directories do NOT list these as
> > +# dependencies anywhere else
> > +#
> > +################################################################################
> 
> Do you understand what this comment means? It seems to date back from
> the "major rework" commit 08782ae7d8812933ad3f932132955ea1c0fb1e52 in
> 2002, and I don't really understand the meaning of this comment.

Neither do I... And as a once-colleague-of-mine said:

    When you don't know, don't touch!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
