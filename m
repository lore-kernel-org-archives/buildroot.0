From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 4 Feb 2019 12:19:13 -0600
Subject: [Buildroot] [PATCH v5 02/10] testing/infra: split runtime test
 from BRTest
In-Reply-To: <3f24bc0c-1e66-b4e5-760b-6ff354092c9e@mind.be>
References: <20180512025833.22998-1-ricardo.martincoski@gmail.com>
 <20180512025833.22998-3-ricardo.martincoski@gmail.com>
 <3f24bc0c-1e66-b4e5-760b-6ff354092c9e@mind.be>
Message-ID: <CANQCQpZPiTucn8Bnynuaf1ND3--3=Qu6db6JxGwAguPX1SLp-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo,

On Mon, Feb 4, 2019 at 9:55 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 12/05/2018 04:58, Ricardo Martincoski wrote:
> > From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> >
> > Move the setup of emulator to a new class, RuntimeTestBase, that bahaves
> > exactly like BRTest currently does.
> > It will avoid duplicating code when adding a common class to test the
> > git download infra.
> >
> > Change all current test cases to use the new class.
> > Do this by first using automatic replace:
> > $ find support/testing/ -name '*.py' | \
> >   xargs grep -l BRTest | \
> >   xargs sed -i \
> >     -e 's,import infra.basetest,\0\nimport infra.runtimetest,g' \
> >     -e 's,infra.basetest.BRTest,infra.runtimetest.RuntimeTestBase,g'
> > and then manually add code to import runtimetest in test_external.py to
> > avoid this error:
> >  AttributeError: 'module' object has no attribute 'LoadTestsFailure'
> > This explicit import was not need before because run-tests imports
> > BRTest and this is the only test file that do not use the defconfig
> > fragments from basetest.py in its code.
> >
> > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > ---
> > WARNING: this patch changes all current test cases, so if a new test case was
> > applied after this patch was sent, 'git am' will apply this patch cleanly, yet
> > any testcase created in the meantime will be broken.
> > But I can refresh it if need. It will probably only need the automatic replace
> > from the commit log to be re-run.
>
>  This seems to be an optimisation rather than a requirement for the other
> patches, so I haven't applied this - it needs to be refreshed first.
>
>  If you do so before Wednesday, we might still apply it.
>

Let me know if you won't have a chance and I'll get it updated for tomorrow.

Matt
