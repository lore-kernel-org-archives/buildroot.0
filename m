From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Mar 2021 21:32:46 +0100
Subject: [Buildroot] [PATCH] package/wpa_supplicant: add upstream 2021-1
 security fix
In-Reply-To: <20210302215943.14131-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 2 Mar 2021 22:59:43 +0100")
References: <20210302215943.14131-1-peter@korsgaard.com>
Message-ID: <87ft0x328h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - wpa_supplicant P2P provision discovery processing vulnerability (no CVE
 >   yet)

 > A vulnerability was discovered in how wpa_supplicant processes P2P
 > (Wi-Fi Direct) provision discovery requests. Under a corner case
 > condition, an invalid Provision Discovery Request frame could end up
 > reaching a state where the oldest peer entry needs to be removed. With
 > a suitably constructed invalid frame, this could result in use
 > (read+write) of freed memory. This can result in an attacker within
 > radio range of the device running P2P discovery being able to cause
 > unexpected behavior, including termination of the wpa_supplicant process
 > and potentially code execution.

 > For more details, see the advisory:
 > https://w1.fi/security/2021-1/wpa_supplicant-p2p-provision-discovery-processing-vulnerability.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
