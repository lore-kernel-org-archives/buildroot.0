From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Apr 2019 20:51:50 +0200
Subject: [Buildroot] [PATCH 09/12 v2] core: introduce new global
 show-info
In-Reply-To: <c45d8e34-997b-0bfd-30be-4c7d9eb675cf@mind.be>
References: <cover.1555273025.git.yann.morin.1998@free.fr>
 <e0509e7ca0439176b7f483afb7436bb85c4fbed3.1555273025.git.yann.morin.1998@free.fr>
 <357abbd3-e69f-1756-2112-587e9e8c850e@mind.be>
 <20190415173457.GT2539@scaer>
 <c45d8e34-997b-0bfd-30be-4c7d9eb675cf@mind.be>
Message-ID: <20190415185150.GA14607@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-04-15 19:51 +0200, Arnout Vandecappelle spake thusly:
> On 15/04/2019 19:34, Yann E. MORIN wrote:
> [snip]
> >>> +	"$($(1)_NAME)": {
> >>> +		"type": "$($(1)_TYPE)",
> >>
> >>  I may be exaggerating here, but I am getting a bit confused between commas that
> >> are intrepreted by make and the JSON commas. Maybe we should consistently use
> >> $(comma) for the commas that go into the output, even if it is not needed like here?
> > 
> > This is a macro definition, not a macro call, so commas are not
> > interpreted.
> 
>  I know, of course. My point is that it is not immediately apparent. My mind is
> jumbling the JSON separators and the macro call separators together. My thought
> was: if we use $(comma) everywhere to mark the JSON separators, things might
> become more readable.
> 
>  In fact, in the part you snipped, one line lower there is a macro-separator:
> 
> 		"type": "$($(1)_TYPE)",
> 		$(if $(filter rootfs,$($(1)_TYPE)),
> 
>  You see where I'm coming from?

Yeah, I see now.

>  Now, I can imagine that sprinkling this code with $(comma)s is not going to
> help readability one bit. But I thought I'd just float the idea.

To be honest, I tried to use $(comma) in place of actual commas. But
seriously, that is totally unreadable... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
