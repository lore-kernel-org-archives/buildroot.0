From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 10:38:58 +0200
Subject: [Buildroot] [PATCH 2/2] ntp: prevent keyword-gen failure during
 ntp_keyword.h check
In-Reply-To: <CANxTyt41syqHG2BGF9mHMd9C_f8ztmNwtADFmDE9N7ZBiNF_OA@mail.gmail.com>
References: <1405655815-2025-1-git-send-email-danomimanchego123@gmail.com>
 <1405655815-2025-2-git-send-email-danomimanchego123@gmail.com>
 <20140718212658.06acda90@free-electrons.com>
 <CANxTyt41syqHG2BGF9mHMd9C_f8ztmNwtADFmDE9N7ZBiNF_OA@mail.gmail.com>
Message-ID: <20140719103858.43d6540d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Fri, 18 Jul 2014 20:52:18 -0400, Danomi Manchego wrote:

> > I haven't applied this one, because I'm not entirely satisfied by the
> > explanation here. Why isn't the keyword-gen check executed on the first
> > run? I did some testing, and I indeed don't see the rule about
> > ntp_keyword.h being evaluated on the first build. Do you have more
> > details about what makes the difference between the first and
> > subsequent builds?
> 
> No.  Stranger yet, when the patch is applied, I found that the
> keyword-gen check is only run on the *first* ntp-rebuild.  Further
> ntp-rebuilds do not cause the check to re-occur.
> 
> But anyway, I didn't notice any indication that the keyword-gen would
> be compiled with a HOSTCC, so I reasoned that if it's cross-compiled,
> then it shouldn't be run on the build machine in any circumstance.  So
> I didn't investigate further.

Right, but the ntp source code comes with a pre-generated result of
this keyword-gen program, which allows the first build to work
properly. So it'd be good to understand why this logic used for the
first build doesn't work for the subsequent builds.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
