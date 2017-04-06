From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Apr 2017 17:55:54 +0200
Subject: [Buildroot] [PATCH 0/7 v4] support/test-pkg: fixes and
 enhancements
In-Reply-To: <573ed965-5286-80a8-b4b6-291998013137@mind.be>
References: <cover.1487195062.git.yann.morin.1998@free.fr>
 <b39f073b-f6fb-d0e4-9977-31dc8c4d51e1@mind.be>
 <20170405191610.GA3609@scaer>
 <573ed965-5286-80a8-b4b6-291998013137@mind.be>
Message-ID: <20170406155554.GB3538@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-04-06 10:48 +0200, Arnout Vandecappelle spake thusly:
> On 05-04-17 21:16, Yann E. MORIN wrote:
> > On 2017-04-05 16:37 +0200, Arnout Vandecappelle spake thusly:
> >>  I was going to modify test-pkg to use the toolchains from configs/toolchains,
> >> but then I noticed this series was still not committed. It obviously conflicts
> >> heavily with what I'm going to do, so I'm taking this over, OK?
> > The latest version (which I did not yet post, did I?) is available, as
> > usual, on my git tree:
> >     git://git.busybox.net/~ymorin/git/buildroot   yem/test-pkg
>  Argh, I should have checked for that before starting my work... Your commits
> don't have a version log, do you have any idea if anything changed except for
> the first patch?

Given that the first patch does have a changelog, but the others do not,
I guess nothing of great interest... :-/

> > Well, as long as I can specify a list of toolchains, that is not the
> > default, that's fine. If I just have to do a wget to have a local file,
> > I'm OK with that.
> > 
> > But I *want* to be able to use a custom list of toolchains.
> 
>  You don't need to get it from a URL, do you? I think having the list of
> toolchains passed as a BR2_EXTERNAL is much more appropriate. Basically, I now have
> 
> TOOLCHAINS_PATH=configs/toolchains

Please, make that an option to the script, not an environment variable!

    --toolchains-dir=/path/to/configs/toolchains

> which points to a directory containing toolchain configs. I can add an option
> that allows you to override that directory. I don't see much point in getting
> this from a URL, is there?

Well, if I can use a custom list of toolchians, I'm fine. Now, that I
need to pre-populate that directory by myself is acceptable. If I need
to store the toolchain configs remotely, it now behooves to me to
download them fiurst and feed local files to the script. That's OK.

> >>>       support/test-pkg: print number of toolchain and progress
> >>>       support/test-pkg: the list of toolchains really contains URLs
> >>  With the toolchain URLs gone, this is not true anymore.
> > Well, I am not sure what you meant: we can't have a list of remote
> > config files to use anymore? That is sad... :-(
>  Can you explain your use case for a list of *remote* config files?

It's just that my "tool_s_" are stored in their own repositor_ies_...

Regards,
Yann E. MORIN.

> > Please note that there is another patch on the series now:
> >     support/test-pkg: run legal-info
>  It was already there (see below).

/me rubs his eyes...
Ah, right...

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > 
> >     https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/test-pkg&id=8a9fec1b939caad8ad282a94e6049c748eff5336
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> >>
> >>  Regards,
> >>  Arnout
> >>
> >>>       support/test-pkg: run legal-info
> >>>
> >>>  docs/manual/adding-packages-tips.txt |  91 +++++++++++++++++++++++++++++++
> >>>  support/scripts/test-pkg             | 101 +++++++++++++++++++++++------------
> >>>  2 files changed, 159 insertions(+), 33 deletions(-)
> >>>
> >>
> >> -- 
> >> Arnout Vandecappelle                          arnout at mind be
> >> Senior Embedded Software Architect            +32-16-286500
> >> Essensium/Mind                                http://www.mind.be
> >> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> >> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> >> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
