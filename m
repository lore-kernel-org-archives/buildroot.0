From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Feb 2014 19:04:40 +0100
Subject: [Buildroot] [PATCH 04/10] toolchain/external: add choice to
 select 'AT_LEAST_XXX' header version
In-Reply-To: <20140217113023.7e5a0845@skate>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
 <74d76e7816e2de0eccb9a24acd0b768c22078dfa.1392571021.git.yann.morin.1998@free.fr>
 <8fdcf8b3-c275-4250-be9c-11bcf4feaa11@email.android.com>
 <20140216204721.GD3417@free.fr>
 <CAAXf6LVOiOQ1jwWX4wT-NjB3gnE=YrroKMhjwsn9Cxa4F=9o5Q@mail.gmail.com>
 <20140217113023.7e5a0845@skate>
Message-ID: <20140217180440.GB3411@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas P, All,

On 2014-02-17 11:30 +0100, Thomas Petazzoni spake thusly:
> On Mon, 17 Feb 2014 09:07:29 +0100, Thomas De Schampheleire wrote:
> 
> > > I'm not sure I entirely grok your comment. This choice is only visible
> > > for external toolchains, not for the internal backend, so there is not
> > > two choices to set the kernel headers version.
> > 
> > True, but suppose the user did make the externel toolchain himself,
> > for example with crosstool-ng. While creating the toolchain, he did
> > get the question of which headers to use already, so he/she may think
> > 'Huh? Why do I have to choose it again, and what will happen if I
> > select a newer version here?"
[--SNIP--]
> > Maybe you could also add that if the user is unsure about the exact
> > version, it's 'safer' to specify an older version than a newer one.
> > And maybe a way of determining the header version used in a toolchain,
> > in case the user does not know it.
> 
> We should simply have a check that ensures the selection is correct.

Yes, I already added such a check later after sending the series. It
will be part of the next submission.

Basically, I check that the specified headers version is no more recent
than the one actually used in the toolchain.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
