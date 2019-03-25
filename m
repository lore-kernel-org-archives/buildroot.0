From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon, 25 Mar 2019 23:31:55 +0100
Subject: [Buildroot] [PATCH v5] package/optee-client: fix build warnings
 from 3.4.0
In-Reply-To: <20190325180955.179bcc55@windsurf>
References: <20190325105251.5914-1-etienne.carriere@linaro.org>
 <20190325180955.179bcc55@windsurf>
Message-ID: <CAN5uoS9Jgmn1KuAGyjeMge=qHXu8J_28GO=CChCnJ3sO_fwYqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 25 Mar 2019 at 18:10, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Etienne,
>
>
> Thanks for working on this. However, sorry for being picky, but there
> are still a few things that could be done better.

Please do so.
And thanks for the feedback and details.

>
> First of all the pull request
> https://github.com/OP-TEE/optee_client/pull/146 has been superseded by
> https://github.com/OP-TEE/optee_client/pull/150, which has been merged
> in commit
> https://github.com/OP-TEE/optee_client/commit/9dbc61b3767ab1c3dfd0a19af02926b92ae09247
>
> Your second pull request has been merged in commit
> https://github.com/OP-TEE/optee_client/commit/16c8f548786c70df04d3a1e61bf89abce9b92389.
>
> So referencing the pull requests is not really appropriate, referencing
> the commits is much better.
>
> Then, you squashed both changes in a single patch, this is not great.
> We really prefer to have the upstream commits as-is, it makes things a
> lot easier/clearer when bumping the package version.
>
> Basically, to generate the patches, you should ideally do:
>
>         git checkout v3.4.0
>         git cherry-pick 9dbc61b3767ab1c3dfd0a19af02926b92ae09247
>         git cherry-pick 16c8f548786c70df04d3a1e61bf89abce9b92389
>         git format-patch -N HEAD~2
>
> And use the two patches that have been generated.

Ok, I see how you prefer patches to be handled.
I'll update.

>
> However, I am a bit skeptical about the second commit: the commit log
> says it fixes build issues with Clang, but Buildroot doesn't support
> using Clang as a compiler, so why do we care ? Of course, the patch is
> small, so it's not a big deal, but what is the reason for having this
> patch ?

The 2nd commit make the first fix stronger. Maybe gcc will complain
for this in a near future.
This change fixes an issue that is found in recent GCCs that is not
reported by not so old GCCs.
I should have even made the initial fix integrating the 2nd change.

etienne

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
