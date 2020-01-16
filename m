From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 16 Jan 2020 10:56:53 +0100
Subject: [Buildroot] [PATCH] infra: add the transient download mechanism
In-Reply-To: <20200116103120.7b41295a@windsurf>
References: <20200115203753.12110-1-yann.morin.1998@free.fr>
 <534f269547ead6d86e7a571978b54d79cd24cd0d.camel@orolia.com>
 <20200116103120.7b41295a@windsurf>
Message-ID: <CAOf5uwmX0vdPFW9s9fC64Q7DFvQGCWdSqZy4GjEPrryy8Sa9ZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Thu, Jan 16, 2020 at 10:31 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Thu, 16 Jan 2020 09:11:32 +0000
> Nicolas Carrier <nicolas.carrier@orolia.com> wrote:
>
> > One small remark, to be able to reproduce the build, on top of this
> > mechanism, there should be:
> > * a way to store the actual VCS revision used for the build (to at
> > least know what was just built!)
>
> That seems quite easy to do.
>
> > * a way to force the build to re-use a particular set of revisions
>
> I don't see how that can be done however, and how that would work from
> a user interface point of view. Sure the first build could store the
> exact Git commit used for building each transient package, and store
> that "somewhere", and then re-use that for the next build. But how does
> the user decide whether what he wants is to re-do the build with the
> same commits or not ? Where is that "somewhere" ?
>
> > That's part of why I don't think that this kind of feature is a good
> > thing to integrate into buildroot. I prefer to delegate it to tools
> > meant for that (using a mix of local packages and OVERRIDE).
>
> Different people/companies have different work flows. We have people
> telling us that using local packages and OVERRIDE for their CI is not
> very convenient/practical.

We are using a similar setup of Nicolas. Right now we have
CI and reproducible build using external tools. What I would like to solve
with buildroot is:

- make the build reproducible
- implement topic build on custom patch using CI
- make tagging and branching easy

All of this I have already with repo + buildroot

Michael

>
> > And like said before, I think it's preferable to have a optional
> > feature to prevent branches from being used, making the build fail.
>
> The feature proposed by Yann *is* optional, as it's conditional on
> having a specific variable set in the package .mk file.
>
> However, one question that is raised by Yann's patch is whether we want
> to forbid using branches when TRANSIENT_DOWNLOAD is NO.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
