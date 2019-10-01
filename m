From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Oct 2019 17:33:19 +0200
Subject: [Buildroot] [PATCH] package/libkrb5: Bumb to 1.17
In-Reply-To: <951ab4ba-69ba-bd1c-d324-f110f8dd94ac@mind.be>
References: <20190930113931.9654-1-nerv@dawncrow.de>
 <20190930221815.6d06ffcb@windsurf.home>
 <20190930202813.GA10860@scaer>
 <951ab4ba-69ba-bd1c-d324-f110f8dd94ac@mind.be>
Message-ID: <20191001153319.GB10860@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-10-01 00:13 +0200, Arnout Vandecappelle spake thusly:
> On 30/09/2019 22:28, Yann E. MORIN wrote:
> > Thomas, All,
> > 
> > On 2019-09-30 22:18 +0200, Thomas Petazzoni spake thusly:
> >> On Mon, 30 Sep 2019 13:39:31 +0200
> >> Andr? Hentschel <nerv@dawncrow.de> wrote:
> >>> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> > [--SNIP--]
> >> However, I think this package license information may not be totally
> >> correct, independently of this version bump. Indeed, our libkrb5.mk
> >> says the license is MIT, but the NOTICE file shows a bunch of parts
> >> under BSD-2-Clause for example.
> >>
> >> Arnout, Yann, what do you think about this? It's one of those packages
> >> with lots of code re-used from different projects, all under
> >> MIT/BSD-2-Clause style licenses. I'd be interested to hear your opinion
> >> on the matter.
> > 
> > Looking at the haorball the NOTICE file is, I would be tempted to just
> > state:
> >     LIBKRB5_LICENSE = Kerberos license
> > 
> > and be done with it. Let the user sort the mess on their side...
> 
>  IMO it's not *that* difficult to be complete. Licensecheck reports the
> following (after pruning a bunch of irrelevant or wrong hits):

But how exactly did you conclude those bits are irrelevant or wrong?
That's an issue I think, that we inject our own interpretation of the
licenses list and conclude of a resulting state.

I don't think that is correct, because some other people may or may not
have a different interpretation of irrelevance or wrongness.

> LIBKRB5_LICENSE = MIT, NTP, MIT-CMU, BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, ISC
> 
>  BTW, for some reason licensecheck seems to identify MIT as "Expat licence"...

Which is all the more a reason not to trust its output.

As such, I'd just let the user do their own interpretation of this.

BTW, that prompted me to resurect a small patch of mine I've had stashed
for eons here (I'll do a proper submission later:)

    diff --git a/support/legal-info/README.header b/support/legal-info/README.header
    index d3bdf71bcf..ef8aff0c1a 100644
    --- a/support/legal-info/README.header
    +++ b/support/legal-info/README.header
    @@ -29,3 +29,7 @@ This material is composed of the following items.
      * The license text of the packages; they have been saved in the
      * licenses/
        subdirectory.
     
    +Note that the Buildroot developers provide no guarantee as to whether the
    +information contained in the material thus collected, is correct or
    +exhaustive, or both. It is your responsibility, as part of your compliance
    +process, to verify the correctness and exhaustivity of that information.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
