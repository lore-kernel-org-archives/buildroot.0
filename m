From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 5 Dec 2017 21:37:56 -0600
Subject: [Buildroot] RFC: kvm-unit-tests use of RDSEED
In-Reply-To: <CANQCQpYCXAU4+gWde5G-WuGQaYn2LhHcEeRgYW2hFAF+QS4VJA@mail.gmail.com>
References: <CANQCQpYCXAU4+gWde5G-WuGQaYn2LhHcEeRgYW2hFAF+QS4VJA@mail.gmail.com>
Message-ID: <CANQCQpZtsbf6BN4-P_JQPAQ_4ZiHy3eVvA36NB55-W5g7Sfrvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

+ Peter

On Tue, Dec 5, 2017 at 9:37 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Got the following failure today where the host compiler is getting
> invoked during a x86_64 build on GCC20(x86_64 Xeon machine) for a
> 32bit build.
> http://autobuild.buildroot.net/results/c39/c3987a3cbd2960b0ff50f872636bdfd8d1a9c820/
>
> kvm-unit-tests package looks like they added the use of the rdseed
> instruction which was introduced in mid 2.22.x binutils.  I'm thinking
> about sending a patch reverting that commit as it's just a test case.
> Other option would be a "AT_LEAST" check but we don't have that for
> binutils, right?
>
> Peter, I though of confirming the binutils version on GCC20 ( just to
> be sure that is what's causing it.)
>
> Matt



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
