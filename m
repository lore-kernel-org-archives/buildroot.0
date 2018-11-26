From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 18:48:30 +0100
Subject: [Buildroot] [PATCH v2 1/1] linux: Make dtc install step more
 reliable
In-Reply-To: <20181113155016.24022-1-anaumann@ultratronik.de> (Andreas
 Naumann's message of "Tue, 13 Nov 2018 16:50:16 +0100")
References: <20181113155016.24022-1-anaumann@ultratronik.de>
Message-ID: <874lc3vifl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andreas" == Andreas Naumann <anaumann@ultratronik.de> writes:

 > Checking for the existence of the dtc binary built by the
 > non-dependent dtc package may cause instable behaviour when giving more
 > freedom on the order of how the packages are built (parallelization).

 > In addidion, when moving to per-package host/target method, the check
 > would always trigger in the isolated host, leading to linux-dtc always
 > being installed as dtc.
 > This in turn may lead to undesired overwriting of the real host-dtc binary
 > when finally assembling the global host dir.

 > Thus rework the linux-dtc install condition to be defined by configuration
 > rather than compile time order.

 > Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
 > ---
 > Changes v1 -> v2: 
 >   - simplified by direct usage of make conditional almost as suggested by
 >     Arnout (test revealed that an additinal comma was needed for correct logic)

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
