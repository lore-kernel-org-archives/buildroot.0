From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Feb 2014 23:49:23 +0100
Subject: [Buildroot] [PATCH 04/10] toolchain/external: add choice to
 select 'AT_LEAST_XXX' header version
In-Reply-To: <20140217180440.GB3411@free.fr>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
 <74d76e7816e2de0eccb9a24acd0b768c22078dfa.1392571021.git.yann.morin.1998@free.fr>
 <8fdcf8b3-c275-4250-be9c-11bcf4feaa11@email.android.com>
 <20140216204721.GD3417@free.fr>
 <CAAXf6LVOiOQ1jwWX4wT-NjB3gnE=YrroKMhjwsn9Cxa4F=9o5Q@mail.gmail.com>
 <20140217113023.7e5a0845@skate> <20140217180440.GB3411@free.fr>
Message-ID: <20140217234923.3379fed1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 17 Feb 2014 19:04:40 +0100, Yann E. MORIN wrote:

> Yes, I already added such a check later after sending the series. It
> will be part of the next submission.
> 
> Basically, I check that the specified headers version is no more recent
> than the one actually used in the toolchain.

I think the specified headers version should match the one actually
used in the toolchain. Otherwise, the user may have messages such as
"package foo needs headers >= 3.3" even if he is using a toolchain with
kernel headers of kernel 3.6.

This behavior would also match what we currently do: if a toolchain has
thread support, but the user forgets to indicate in menuconfig that the
toolchain has thread support, then we abort with an error. Even if
technically speaking, we could simply continue, since building a
configuration with no thread support would work entirely fine with a
toolchain that has thread support.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
