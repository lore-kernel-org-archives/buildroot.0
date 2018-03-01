From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 1 Mar 2018 06:30:00 -0600
Subject: [Buildroot] [next,
 v2 4/8] cpe-info: infra defines CPE_ID_* defaults
In-Reply-To: <20180301101709.409c59eb@windsurf.lan>
References: <1519881819-51445-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519881819-51445-5-git-send-email-matthew.weber@rockwellcollins.com>
 <20180301101709.409c59eb@windsurf.lan>
Message-ID: <CANQCQpYTt_P9WxOq=49pe_SEaJmtGRnS4J_=8qsD_=7VkyOKHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Mar 1, 2018 at 3:17 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 28 Feb 2018 23:23:35 -0600, Matt Weber wrote:
> > Default to using the package name for the vendor
> > and name as most CPE IDs seem to align with that
> > assumption. Also use the pkg version as the CPE IDs
> > initial version field.
>
> Nits:
>
>  - You're wrapping the lines too short. Funnily, the common mistake is
>    to not wrap, or wrap too long. But here, you wrap too short. 72
>    characters is the good length :)
>
>  - Missing SoB.

Noted.

>
> > v2
> > [Thomas P
> >  - Created patch per suggestion to use infra
> >    to cleanup common case in individual pkg
> >    CPE_ID definition.
>
> I'm surprised, because I thought the conclusion of our discussion was
> that it was not desirable to have such default, because then we
> couldn't make the difference between packages that have had their CPE
> ID explicitly added/verified by someone, and packages that have their
> CPE ID defined by default, and which may be incorrect.
>

I took your suggestion and made one change.  I use the _CPE_ID_VENDOR
as my criteria to note a CPE should be considered(default or custom)
for reporting.   So if it isn't explicit defined, I default to unknown
in my report.  This is clunky now but eventually we could go through
and remove all the _CPE_ID_VENDOR = $(pkg_NAME) entries.

I should have commented on it in the commit description and change
log.  I'll make note for v3.

Example of a basic target config.  Util-linux shows the double CPE, pv
is the nothing defined and the rest are a combination of vendor as
name and/or specified.  Should I add an example in the manual of the
output?  I need to look how detailed the manual is for legal
reporting.
https://pastebin.com/XuJrXRat

Matt
