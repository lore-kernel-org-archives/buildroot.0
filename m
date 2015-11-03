From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 22:05:43 +0100
Subject: [Buildroot] [PATCH] boost: fix sparc64 compile,
 set the correct instruction-set
In-Reply-To: <20151103210313.GA25989@waldemar-brodkorb.de>
References: <20151103210313.GA25989@waldemar-brodkorb.de>
Message-ID: <20151103220543.06ed88e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 3 Nov 2015 22:03:14 +0100, Waldemar Brodkorb wrote:

> +ifeq ($(BR2_sparc64),y)
> +BOOST_OPTS += architecture=sparc instruction-set=ultrasparc
> +endif

We're not setting architecture= nor instruction-set= for any other
architecture. Should we do so ?

Should the instruction-set be set to BR2_GCC_TARGET_TUNE ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
