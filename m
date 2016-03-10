From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Mar 2016 21:20:34 +0100
Subject: [Buildroot] [PATCH 0/8] core: allow for custom, local help;
 rearrange package-specific help (branch yem/help)
In-Reply-To: <20160310093115.6ff24ea6@free-electrons.com>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
 <56E0B327.70807@mind.be>
 <20160310093115.6ff24ea6@free-electrons.com>
Message-ID: <20160310202033.GA3424@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-10 09:31 +0100, Thomas Petazzoni spake thusly:
> On Thu, 10 Mar 2016 00:35:03 +0100, Arnout Vandecappelle wrote:
> 
> > > After the first patch implements this (which is really all that is
> > > needed to print custom help), we go further with providing a macro that
> > > pretty-prints the help for rules, so that the layout is all handled in a
> > > single location. This macro can also be used by the local help, too.
> > 
> >   This bit I really like!
> 
> Doesn't Yann proposal fails short if you want to pretty print something
> like this:
> 
> 	foobar - This is a really really long help message that spans
> 	         multiple lines, and would definitely be too long on
> 	         one single line.

Indeed, it was no longer possible with the patchset I posted (which was
just hacked around quickly), but it's fixed locally.

> IOW, I believe we should leave more freedom to what is appended to the
> help text, and simply leave it to the person writing the help text to
> format it properly.

Well, the first patch in my series is just that: expost a new hel prule
that the user is *entirely* free to implement on his own. The macro is
just an added bonus.

Basically, if all one wants is to display help for br2-external or other
such customisations, then the first patch in my series was entirely
sufficient. It is addressing my concenr about mixing our help with
custom help.

On the other hand, patches 2 onweard were addressing the second patch in
J?r?me's series, which was moving packages' specific help into the
corresponding packages. It has nothing to do with providing custom help,
althgouh custom help may (anmd it's only a 'may') use that macro, of
course.

> In my opinion, the very simple proposal from J?r?me has turned into a
> much more complicated solution, with no real benefit.

Well, I have two concerns about that series:
 1- the mixing of internal and custom help,
 2- the way it is implemented looks ugly to me.

And I doubt my own proposal is very complex. Sure, there are two trivial
shell expansions, that are even POSIX and not bashisms. Compared to
other dirty tricks we do in a lot of other places, those are hardly
black magic...

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
