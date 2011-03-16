From: Richard Guy Briggs <rgb@tricolour.net>
Date: Wed, 16 Mar 2011 09:44:25 -0400
Subject: [Buildroot] [PATCH 0 of 3] Add support for local package
 downloads (file://)
In-Reply-To: <AANLkTi=iuQkoU5u=ZzW1n=x3zCsAgWD1D-34aan7OYSn@mail.gmail.com>
References: <patchbomb.1300174025@localhost6.localdomain6>
	<20110315142624.GW7248@embryo.tricolour.net>
	<AANLkTi=iuQkoU5u=ZzW1n=x3zCsAgWD1D-34aan7OYSn@mail.gmail.com>
Message-ID: <20110316134425.GA30578@embryo.tricolour.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 16, 2011 at 09:20:49AM +0100, Thomas De Schampheleire wrote:
> Hi Richard,
> 
> On Tue, Mar 15, 2011 at 3:26 PM, Richard Guy Briggs <rgb@tricolour.net> wrote:
> [...]
> > This looks like a more thorough implementation of what I started and
> > attached to bug 3343.
> 
> I wasn't aware of this bug before, but I'm glad that I'm not the only
> one with this feature request.

Maybe it makes sense to accept yours first just for the file:// protocol
and then work on a seperate patch at least for scp and rsync, if not a
new bug (enhancement) number altogether.

> > I'd recommend taking Thomas' patches over mine!
> >
> > Mine also had starting points for scp and rsync as well.
> 
> Thanks. I like the fact that you envisioned support for extra
> protocols like scp and rsync. Preferably we'd merge these changes with
> mine, don't you think? (but we should fix your laziness ;-) )

I threw my patch out there mainly for discussion purposes. 

The file/cp part worked fine for our needs, but the documentation hadn't
been done yet.

The scp and rsync bits I had a couple of issues, one being how to verify
the existence of the object sought, and how to deal with the multiple
potential types of objects those two protocols can manage.  It would
probably be reasonable to restrict the types of objects they could fetch
based on overlap with other protocols such as file:// above.  Which is
to say, no point in using scp or rsync to get a local file when cp will
do so more efficiently with a less complicated procedure.

> Best regards,
> Thomas

	slainte mhath, RGB

--
Richard Guy Briggs               --  ~\    -- ~\            <hpv.tricolour.net>
<www.TriColour.net>                --  \___   o \@       @       Ride yer bike!
Ottawa, ON, CANADA                  --  Lo_>__M__\\/\%__\\/\%
Vote! -- <greenparty.ca>_____GTVS6#790__(*)__(*)________(*)(*)_________________
