From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Mar 2019 20:35:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/glm: bump to version 0.9.9.4
In-Reply-To: <20190327201030.5b02aae5@windsurf>
References: <20190327171103.32303-1-fontaine.fabrice@gmail.com>
 <20190327201030.5b02aae5@windsurf>
Message-ID: <CAPi7W83mrpkALzOFYFN5Y6q_EG3-1J63xq0Wy+B+0UQzhZEFuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le mer. 27 mars 2019 ? 20:10, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Wed, 27 Mar 2019 18:11:03 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > - Disable tests as they are enabled by default since version 0.9.9.1:
> >   https://github.com/g-truc/glm/commit/d307d390193f4027faec48ac79d7f74b2bec6e56
> > - Static and shared libraries are always built since version 0.9.9.1:
> >   https://github.com/g-truc/glm/commit/a23dd2f800185a5e233534fed82fc5c2840fbe5c
> >   So, disable them as GLM is header-only (it should be noted that
> >   upstream wants to keep those libraries as the commit to disable them
> >   has been reverted:
> >   https://github.com/g-truc/glm/commit/ca8372490eb8742d402878c9e930b891225982e6
> > - Add hash for license file (now in manual.md#section0)
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/3cf1fd3387bd4952470edcfcb93d44f58c9e7ff7
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/glm/glm.hash |  3 ++-
> >  package/glm/glm.mk   | 10 ++++++++--
> >  2 files changed, 10 insertions(+), 3 deletions(-)
>
> Applied to master, thanks. To be honest, I still don't understand what
> is this library that they are building but not really using. Do you
> understand better what it is ?
I don't understand either, I asked upstream about it here:
https://github.com/g-truc/glm/pull/871
But I didn't get any answer.

Then, I sent a patch to remove those libraries that was merged but
reverted a few hours later.
The only information that I found is the commit title on the commit
before the revert: "Allow to browse GLM source"
(https://github.com/g-truc/glm/commit/5a5a0a88b010892f678a01bd39156d346bc5e3f0).
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
