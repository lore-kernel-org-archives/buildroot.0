From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Mar 2016 22:54:14 +0100
Subject: [Buildroot] [PATCH] quagga: fix build when ospfd is disabled
In-Reply-To: <036588a526c3c3462653f00dbcccf17ea31a82c4.1458151630.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 16 Mar 2016 20:07:10 +0200")
References: <036588a526c3c3462653f00dbcccf17ea31a82c4.1458151630.git.baruch@tkos.co.il>
Message-ID: <87bn6e84xl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > ospfclient and ospfapi that build by default depend on libospf. But libospf
 > doesn't build when ospfd is disabled. Disable ospfapi in this case.

This sounds a bit confusing to me. I've changed it to:

ospfclient and ospfapi that gets build by default need libospf, but
libospf doesn't get built when ospfd is disabled. Disable ospfapi in
this case.

Committed with that changed, thanks.

-- 
Bye, Peter Korsgaard
