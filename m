From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Dec 2013 13:29:48 +0100
Subject: [Buildroot] [buildroot] libevas build failure analysis
In-Reply-To: <CAKAx1chcpQCp_y8bWGvdMJB03G3JXRdFnON4s6cyoAT-=5MXnQ@mail.gmail.com>
References: <CACjG4B+qJvuzX=dZz5F7jNyc_m796_j2m9NZ91fpsoy52SX8VQ@mail.gmail.com>
 <CAKAx1cgki9JiRqU=zJJ0P8g5XpG7NEZN9WcBuYMa4mNyv2C-RA@mail.gmail.com>
 <CACjG4B+AJ0F4BmrSVrfzMidVgUFGwWt7sBoxUD3QZyp0x6+EAw@mail.gmail.com>
 <CACjG4BLqXqufuzSHYWghXcZuWMpBPjbFUU7xGzLhSjQQrghK8A@mail.gmail.com>
 <CAKAx1ciXsAPtG-uegQC5CPO8yJFPG4gn7CvuzVZ2JQh_T0FrAA@mail.gmail.com>
 <20131204102753.419a9057@skate>
 <CAKAx1chcpQCp_y8bWGvdMJB03G3JXRdFnON4s6cyoAT-=5MXnQ@mail.gmail.com>
Message-ID: <20131204132948.38af387c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lionel Orry,

On Wed, 4 Dec 2013 11:24:58 +0100, Lionel Orry wrote:

> That is true, I did not explain clearly the status. But I suppose I
> can then convince you that a LOT of API changes occured by looking at
> the NEWS file: https://git.enlightenment.org/core/efl.git/plain/NEWS?id=v1.8.1

I have just glanced through this file, but I only see a number of API
additions (so not something that breaks compatibility), a few
deprecations (but not removal). The only removal that I see are support
for some backends (such as the DirectFB backend).

Or do you have specific examples of API breakage between 1.7 and 1.8 ?

> Among other things, EFL 1.8 now has a mandatory dependency on bullet
> library, which makes it much less suitable on light embedded systems ;
> for example, I think bullet is not part of buildroot packages yet.

That's not a reason to keep an old version of EFL that is unmaintained
upstream. Let me explain why: Buildroot is here to package what
upstream provides. If in newer versions of a given upstream components
the choices that are made are not appropriate for embedded systems, or
to the taste of embedded Linux developers, then those developers should
work with upstream to resolve those issues, or fork the project to
create a new one. I don't think Buildroot should be keeping old
version of a given package, just because the new version has
new dependencies. If you don't like the new dependency on bullet, then
work with upstream to make it optional.

... some time looking at EFL 1.8.1 sources ...

In fact, my reading for EFL configure.ac is that the bullet library
dependency is only needed for the Ephysics component, which is a new
library in 1.8.x. Therefore, if you have an EFL 1.7 application, it
doesn't use Ephysics (because it didn't exist), and you can build EFL
1.8.x without Ephysics, and without the bullet dependency.

(Of course all those claims are completely untested, and only made on a
very quick reading of the EFL configure.ac script. Do not hesitate to
prove me wrong, or give more details.)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
