From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 13 Apr 2015 17:18:39 -0500
Subject: [Buildroot] [PATCHv2 10/21] Makefile: move source-check outside
 of noconfig_targets
In-Reply-To: <20150413215831.GQ29025@free.fr>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150413204916.GJ29025@free.fr>
 <20150413230640.10513197@free-electrons.com>
 <20150413215831.GQ29025@free.fr>
Message-ID: <CAMQcK5+3TaZ+X7=BLC8TCDDzZ=RPAgeE5hDWOujmv_ivvzn=Xw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, Apr 13, 2015 at 4:58 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

[...]

> Well, I have a slightly different opinion.
>
> First, I agree that for Buildroot maintenance, we only care about
> upstream, not even primary or backup sites. We do not even have a
> primary.
>
> Second, for a user that wants to be serious, the only thing that would
> really matter in the end is the existence of the package on the primary
> site.
>
> Let me explain...
>
> In an enterprise-grade project, one can not rely on external resources
> to be always available; one can only rely on internal resources. Thus,
> in that case, source-check should only look at the primary.

I agree with this statement and would also like to add that they are
probably also sitting being a firewall so having the primary site be
the only source of downloads helps avoid errors and confusion.

> However, that primary has to filled in to begin with, and that is often
> done by just running "make source" and then copying those sources to the
> primary. If an upstream source is missing, it is the moment one wants to
> be notified. There's no reason to run a source-check onto upstream, even
> less so on the mirror.
>
> So, in my opinion, source-check should behave as such:
>
>   - if primary is set, only check on primary
>   - if primary is not set, only check upstream
>   - never check on the mirror

The only reason I could see someone in large enterprise needing to be
able to reach the mirror is if there are behind a firewall where
getting an opening to the mirror (sources.b.o) is easier for them to
get access to than others. However, I as I typed the above sentence, I
thought it would then make more sense for them to just mirror
sources.b.o themselves outside of buildroot for a them to create
primary site internally.

Anyway that is my two-cents on your comments and I don't really have a
preference whatever direction this goes.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
