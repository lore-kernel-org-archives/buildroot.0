From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 7 Jan 2015 16:51:50 -0600
Subject: [Buildroot] [PATCH v2] linux: make custom versions and patches
	exclusive
In-Reply-To: <CANxTyt4HAht4DG6aac65+NQPftC+9w5Qm+4YRZX3cMw-BXdzLw@mail.gmail.com>
References: <1420583119-30111-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <CANxTyt4spLPozy+88j5rgcA_JKjL7W2gmD8UOC6pLj3f80SJjw@mail.gmail.com>
 <20150107183515.GA4249@free.fr>
 <CANxTyt4HAht4DG6aac65+NQPftC+9w5Qm+4YRZX3cMw-BXdzLw@mail.gmail.com>
Message-ID: <CAMQcK5JyKyFn2N-RB80-rs5w8ST7SSN-Zp2-BHgbMM_EWiq4Ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi and Yann,

On Wed, Jan 7, 2015 at 12:53 PM, Danomi Manchego
<danomimanchego123@gmail.com> wrote:
> Yann,
>
> On Wed, Jan 7, 2015 at 1:35 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Danomi, All,
>>
>> Well, using a patch to a custom kernel does not really make sense.
>>
>> I'll try to summraise the discussion we had with Vivien on IRC
>> yesterday, which ended up with this patch (sorry, it is a bit long..)
>>
>> See, using a local tree or a custom git or mercurial tree, is really a
>> case of telling Buildroot: "look, I have my custom kernel, which has my
>> very customisation with what I need".
>
> I certainly understand that to be the case for the local tree (which,
> again, I _think_ is the only one engaging the _OVERRIDE_SRCDIR
> mechanism).  But you don't think that there would be valid cases of
> acquiring a kernel via git that is not customized to the project?  For
> example, at work, we use a TI part, which keeps its 2.6.37+ kernel at
> arago-project.org.  So I get it by setting
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL to
> "git://arago-project.org/git/projects/linux-omap3.git", and then apply
> my project's patches to it.  Sure - I guess it _a_ custom kernel in
> that its modified by TI, but it does not have all the mods _I_ need
> for my specific project.  Not a valid use case?

This should be a valid use case since I do something similar using the
Freescale's custom git repo that supports the QorIQ series of
processors. We carry a few minor patches that are on top of this git
repository that implement a few customization we need in the kernel.
It didn't really make much sense to maintain our own custom repository
since the changes done are very minimal.

I think there is a needs to be ablity to take a custom GIT repo that
comes from somewhere on the other than official mainline kernels as
there maybe features available in these kernels that haven't made it
into the mainline kernel. Other examples that I can think of would be
Xilinx's Zynq and Altera's SoCFPGA architectures in which there isn't
full featured support for these architectures yet in the mainline
kernel but are available from the vendor maintain git repositories.

Moral of the story - I disagree with this change.

Just thought of this - you would still be able to use
BR2_GLOBAL_PATCH_DIRS in order to patch the kernel when using any of
the other methods so I don't know why you wouldn't want to all this
option. I believe, it was discussed some time ago about completely
removing this option and only allow the use of BR2_GLOBAL_PATCH_DIRS.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
