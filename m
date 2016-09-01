From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Sep 2016 19:52:21 +0200
Subject: [Buildroot] [PATCH 06/16 v3] core: introduce a generated
	kconfig snippet
In-Reply-To: <87poosaa9d.fsf@dell.be.48ers.dk>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e4930f24c2ca2291b55d122df292702136feb91e.1468750623.git.yann.morin.1998@free.fr>
 <20160827161601.2fd0e8f5@free-electrons.com>
 <87poosaa9d.fsf@dell.be.48ers.dk>
Message-ID: <20160901175221.GA5841@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On 2016-08-28 22:50 +0200, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Hello,
>  > On Sun, 17 Jul 2016 12:34:26 +0200, Yann E. MORIN wrote:
> 
>  >> +.PHONY: $(BUILD_DIR)/.br2-external.in
> 
>  > Why is a real file that exists on the filesystem a phony target?
> 
>  >> +# Ensure the kconfig snippet is generated (for MANUAL_GEN_LISTS, below):
>  >> +MANUAL_DEPENDENCIES += prepare-kconfig
> 
>  > It's a bit crazy the complexity that we have just to allow our manual
>  > to have the list of all packages in Buildroot. I'm not even sure this
>  > section of the manual is that useful, to be honest. But oh well, that's
>  > supported today, so we have to continue support it.
> 
> Why do we _HAVE_ to continue to support it?

I was going to prepare a patchset to remove the list of packages from
the manual, when I stumbled on *one* reason parts of it is interesting
to have in the manual: the list of virtual packages, their symboles and
their providers.

I think this is worth having in the manual, if at least for packagers of
new packages that would need or provide such a virtual package.

However, I think the normal and deperacted packages should be removed,
and our script made much simpler (if at all possible).

So, what's the idea:
  - remove all packages (easy)
  - keep as-is  (even easier)
  - only keep virtual packages (not easy at all)

Insights? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
