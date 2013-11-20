From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 20 Nov 2013 20:05:21 +0100
Subject: [Buildroot] [PATCH] libglib2: needs MMU support
In-Reply-To: <20131120184112.5fefc5d7@skate>
References: <8a49d754da4819064a09.1384968585@argentina>
 <20131120184112.5fefc5d7@skate>
Message-ID: <CAAXf6LVm_PdoKRdyDTBfb8L9TK1=WnmqomMkr-1AoZwd-f4ZFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Nov 20, 2013 at 6:41 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Wed, 20 Nov 2013 18:29:45 +0100, Thomas De Schampheleire wrote:
>> Fixes http://autobuild.buildroot.net/results/2e0/2e032c6e44e10f2912935715741c3680a19b9b51/
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Can you say what your plan is with regard to this in relation to the
> efforts from the Blackfin people to support !MMU in glib? I agree that
> their efforts haven't lead to any acceptable patch for the moment, so
> maybe your patch is a good temporary solution, until proper !MMU
> support in glib is merged.

My plan is to do absolutely nothing more :)

I wasn't aware of these glib MMU changes in the pipeline, but in
general this is my standpoint for a package needing MMU support:

- either someone needs this package on a non-MMU architecture, and:
  a. adds the support him/herself
  b. requests upstream to do it
  c. requests support on the buildroot mailing list

- or there is no explicit request for the package on non-MMU
architectures, and there is for example an autobuild failure. In this
case I think adding a dependency on BR2_HAS_MMU is enough.

In this particular glib2 case, I tend to feel we're in the second
situation. Even though it may happen that the Blackfin developers add
proper support for glib2 on their architecture, I think in the mean
time it can safely be blocked. There is no harm in doing that, on the
contrary: we make sure there are no build failures in such
configurations.

Best regards,
Thomas
