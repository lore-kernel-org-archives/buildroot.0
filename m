From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 19:54:37 +0100
Subject: [Buildroot] [PATCH] package/wpa_supplicant: add upstream 2020-2
 security fix
In-Reply-To: <20210205121329.31131-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 5 Feb 2021 13:13:29 +0100")
References: <20210205121329.31131-1-peter@korsgaard.com>
Message-ID: <87lfbvn47m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 >  - wpa_supplicant P2P group information processing vulnerability (no CVE yet)

 >    A vulnerability was discovered in how wpa_supplicant processing P2P
 >    (Wi-Fi Direct) group information from active group owners.  The actual
 >    parsing of that information validates field lengths appropriately, but
 >    processing of the parsed information misses a length check when storing a
 >    copy of the secondary device types.  This can result in writing attacker
 >    controlled data into the peer entry after the area assigned for the
 >    secondary device type.  The overflow can result in corrupting pointers
 >    for heap allocations.  This can result in an attacker within radio range
 >    of the device running P2P discovery being able to cause unexpected
 >    behavior, including termination of the wpa_supplicant process and
 >    potentially arbitrary code execution.

 > For more details, see the advisory:
 > https://w1.fi/security/2020-2/wpa_supplicant-p2p-group-info-processing-vulnerability.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
