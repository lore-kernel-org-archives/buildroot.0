From: Sam Voss <samuel.voss@rockwellcollins.com>
Date: Wed, 26 Oct 2016 10:45:21 -0500
Subject: [Buildroot] [PATCH] support/scripts: tool to create fragments
In-Reply-To: <20161026161752.0fa1a3da@free-electrons.com>
References: <1477425699-37971-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20161025220305.1cb73355@free-electrons.com>
 <CAH=K+6khOEyfhomv9HMbOnB7eNcgiX4V0Z_vALNLDAdL5QLVww@mail.gmail.com>
 <20161026161752.0fa1a3da@free-electrons.com>
Message-ID: <CAH=K+6kbTXmRoAXz-C+zEeOtTdCXUVTn0WYLvw9F=_DAWJ_p0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> OK, understood. So in fact, you have reimplemented the diffconfig tool
> available in the Linux kernel scripts/ directory.

Interesting, I didn't know this tool existed!

> However, calling it gen-config-fragment looks a bit wrong to me. What
> about diffconfig, like in the Linux kernel?

I agree with a name change, however might it be confused (in discussion)
with the other tool? If that is not a problem I would agree with the new name.

> No need to give so many examples, but just one example would be good.

Will update the patch to include one along with the changes Matt mentioned.

> In terms of implementation, should we re-use the diffconfig tool from
> the kernel, simply tweaked in terms of output format?

I actually don't think this would be a best course of action. As it is
written it will work
on busybox or kernel configs, however if we choose to reuse the output
of the diffconfig
tool either logic will have to be added to figure out what configs are
being generated or
another argument will have to specify it and I'm not sure if it is
worth that extra code.

Thanks,

Sam
