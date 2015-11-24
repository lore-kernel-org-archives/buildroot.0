From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Nov 2015 10:02:30 -0300
Subject: [Buildroot] [PATCH] gmp: disable for MIPS R6
In-Reply-To: <1448368861-24776-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1448368861-24776-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <56545FE6.7060405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/11/15 09:41, Vicente Olivert Riera wrote:

> gmplib is not yet supported for MIPS R6, so disable it and also
> propagate that dependency recursively to all packages who select it.
>
> Fixes:
>
>    http://autobuild.buildroot.net/results/d06/d0686b3e7b8884f93034d4ea4b79fa8590ffa221/

Hi.
How about in package/gmp.mk:

ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
GMP_CONF_OPTS += --disable-assembly
endif

(assuming it's the same for 64r6).
Sounds happier no? ;)
Regards.
