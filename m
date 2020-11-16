From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 19:54:35 +0100
Subject: [Buildroot] [PATCH] package/openntpd: needs host-bison
In-Reply-To: <20201116180745.GK771438@scaer> (Yann E. MORIN's message of "Mon, 
 16 Nov 2020 19:07:45 +0100")
References: <b1b574df250b1e34cd750b809a8409b9b182f51e.1605525509.git.baruch@tkos.co.il>
 <87a6vh5l6m.fsf@dell.be.48ers.dk> <878sb1qle4.fsf@tarshish>
 <20201116180745.GK771438@scaer>
Message-ID: <871rgt5dzo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> > Can we not use $(BR2_BISON_HOST_DEPENDENCY) instead?
 >> 
 >> We surly can. But for some reason no other package under package/ uses
 >> BR2_BISON_HOST_DEPENDENCY. Plain host-bison is used there instead. Only
 >> Barebox, U-Boot and the kernel use it. Why is that?
 >> 
 >> Commit b01100cc901a83 ("linux: kconfig may need host-{flex, bison} to
 >> build the configurators") mentions kconfig. Is that related?
 >> 
 >> I guess that BR2_BISON_HOST_DEPENDENCY is more susceptible to
 >> incompatibility due to different host installed bison versions (and same
 >> for flex).

 > The rule is that we can depend on $(BR2_BISON_HOST_DEPENDENCY) to build host
 > tools, but we really want to depend on host-bison when we generate code
 > that is built for the target.

 > Indeed, different versions of bison will generate different C code, and
 > thus the resulting binary will change. This is not very reproducible.
 > (Yes, I've already experienced that, and finding the root cause of the
 > delta cost me about two weeks full-time...)

 > AFAICS, the openntd code will be running on the target, so we do want
 > the host-bison dependency.

 > Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Ok, we should probably add a sensible note about that in
check-host-bison-flex.mk to make that clear.

Committed, thanks.

-- 
Bye, Peter Korsgaard
