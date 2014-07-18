From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 21:26:58 +0200
Subject: [Buildroot] [PATCH 2/2] ntp: prevent keyword-gen failure during
 ntp_keyword.h check
In-Reply-To: <1405655815-2025-2-git-send-email-danomimanchego123@gmail.com>
References: <1405655815-2025-1-git-send-email-danomimanchego123@gmail.com>
 <1405655815-2025-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140718212658.06acda90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Thu, 17 Jul 2014 23:56:54 -0400, Danomi Manchego wrote:
> During the first compile, the keyword-gen check is not run.  However,
> it gets run on the first rebuild.  Because we are cross-compiling, the
> keyword-gen can't run on the host.  Since this is only used to check if
> ntp_keyword.h is up to date, we simply drop the check altogether.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

I haven't applied this one, because I'm not entirely satisfied by the
explanation here. Why isn't the keyword-gen check executed on the first
run? I did some testing, and I indeed don't see the rule about
ntp_keyword.h being evaluated on the first build. Do you have more
details about what makes the difference between the first and
subsequent builds?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
