From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 18:03:52 +0100
Subject: [Buildroot] Incorrect kernel configuration produced from
 _defconfig file
In-Reply-To: <20160225165032.GG12073@piout.net>
References: <CAF_dkJAcuTbdu97oMi_-W7Bd6-4pGx633qE=+UaNHwb6Z_5wCg@mail.gmail.com>
 <20160225170443.2e6208f4@free-electrons.com>
 <20160225161451.GE12073@piout.net>
 <CAF_dkJDcPKAqb5sSoRinfBqo3L7zni8M9NTqEN-zyjpF_98ZGw@mail.gmail.com>
 <20160225165032.GG12073@piout.net>
Message-ID: <20160225180352.1d768c84@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexandre Belloni,

On Thu, 25 Feb 2016 17:50:32 +0100, Alexandre Belloni wrote:

> Personally, I'd drop the yes "" | part of it and use only make
> olddefconfig but the rules are also used for busybox et al. so you'd
> have to check that all have a recent enough kconfig

I think the reason we still use the yes "" trick is that we have a
generic kconfig infrastructure, and it should work for all kconfig
based packages. Including old kernel version (when was
olddefconfig introduced?) or Busybox (which has an horribly old copy of
the kconfig code).

So switching to olddefconfig might not be that easy. But maybe this is
something that can be made conditional in the pkg-kconfig
infrastructure. Like use olddefconfig if available, and if not fall
back to the yes "" | make oldconfig trick.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
