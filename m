From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 19:14:45 +0100
Subject: [Buildroot] [PATCH next v6 01/10] Makefile: evaluate CCACHE and
 HOST{CC, CXX} at time of use
In-Reply-To: <20181123145815.13008-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 23 Nov 2018 15:58:06 +0100")
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-2-thomas.petazzoni@bootlin.com>
Message-ID: <875zwju2ne.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > As we are going to move to per-package SDK, the location of CCACHE and
 > therefore the definitions of HOSTCC and HOSTCXX need to be evaluated
 > at the time of use and not at the time of assignment. Indeed, the
 > value of HOST_DIR changes from one package to the other.

 > Therefore, we need to change from := to =.

 > In addition, while doing A := $(something) $(A) is possible, doing A =
 > $(something) $(A) is not legal. So, instead of defining HOSTCC in
 > terms of the current HOSTCC variable, we re-use HOSTCC_NOCCACHE
 > instead.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
