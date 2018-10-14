From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Oct 2018 15:07:20 +0200
Subject: [Buildroot] [PATCH 4/5] core/download: add per-download timeout
In-Reply-To: <20180910225518.3ae7dfb3@windsurf>
References: <cover.1534972250.git.yann.morin.1998@free.fr>
 <ae42dac572665985954d708489bb5474ccae3edc.1534972250.git.yann.morin.1998@free.fr>
 <20180910225518.3ae7dfb3@windsurf>
Message-ID: <20181014130720.GH31509@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-09-10 22:55 +0200, Thomas Petazzoni spake thusly:
> On Wed, 22 Aug 2018 23:10:57 +0200, Yann E. MORIN wrote:
> > +    if [ -n "${timeout}" ]; then
> > +        # Timeout after the specified delay; additionaly, leave
> > +        # 30 more seconds for the backend to properly terminate
> > +        # (e.g. to cleanup behind itself), after which forcibly
> > +        # kill the backend.
> > +        timeout_cmd="timeout --kill-after=30s ${timeout}"
> 
> What happens if 30 seconds are not enough for the cleanup ? I suppose
> we already handle that (as we can already interrupt the build at any
> point), and the next build will already clean up whatever mess what left
> behind. If that's indeed the case, then the --kill-after=30s looks a
> bit useless, we should just abort the download and move on with the
> next step. Indeed, saying "30 seconds should be enough" sounds like
> saying "640 KB of memory should be enough" :-)

Yeah, I do understand what you mean. So, that's either that, or trust
the download backend will always finish upon receiving a SIGTERM.

I'm OK with dropping the kill-after option.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
