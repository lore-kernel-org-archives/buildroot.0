From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Mar 2012 09:17:14 +0100
Subject: [Buildroot] add option to enable AI_ADDRCONFIG support
In-Reply-To: <1331159898-25350-1-git-send-email-s.neumann@raumfeld.com>
References: <1331159898-25350-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <20120308091714.5d60b715@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sven,

Le Wed,  7 Mar 2012 23:38:16 +0100,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> This patchset adds a buildroot option to enable AI_ADDRCONFIG support
> in uClibC. It also changes the mrouted package to select the new option
> instead of hinting the user in a comment that it depends on it.

I don't know if this question has been asked in the past, but do you
know what is the binary size impact of enabling AI_ADDRCONFIG in
uClibc? If the impact is rather minimal, then I'd rather have it
enabled in our default configuration instead of adding yet another
toolchain config knob.

Anyway some comments about your patches (but don't work on updating
them before we decide if a new option is really needed) :

 * Your PATCH 1/2 also needs to address the cases of external
   toolchains and crosstool-ng toolchains ;

 * Your PATCH 2/2 should use a depends on rather than a select. We use
   depends on for all the dependencies of packages on toolchain
   options, together with a comment displayed when the toolchain
   options isn't present, so that the user is aware that mrouted is
   available, but only if AI_ADDRCONFIG is enabled as a toolchain
   option.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
