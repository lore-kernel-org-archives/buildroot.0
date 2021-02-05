From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Feb 2021 14:09:50 +0100
Subject: [Buildroot] [PATCH] package/wpa_supplicant: add upstream 2020-2
 security fix
In-Reply-To: <20210205124530.GT2384@scaer> (Yann E. MORIN's message of "Fri, 5
 Feb 2021 13:45:30 +0100")
References: <20210205121329.31131-1-peter@korsgaard.com>
 <20210205124530.GT2384@scaer>
Message-ID: <87sg6a7ja9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2021-02-05 13:13 +0100, Peter Korsgaard spake thusly:
 >> Fixes the following security issue:
 >> 
 >> - wpa_supplicant P2P group information processing vulnerability (no CVE yet)
 >> 
 >> A vulnerability was discovered in how wpa_supplicant processing P2P
 >> (Wi-Fi Direct) group information from active group owners.  The actual
 >> parsing of that information validates field lengths appropriately, but
 >> processing of the parsed information misses a length check when storing a
 >> copy of the secondary device types.  This can result in writing attacker
 >> controlled data into the peer entry after the area assigned for the
 >> secondary device type.  The overflow can result in corrupting pointers
 >> for heap allocations.  This can result in an attacker within radio range
 >> of the device running P2P discovery being able to cause unexpected
 >> behavior, including termination of the wpa_supplicant process and
 >> potentially arbitrary code execution.
 >> 
 >> For more details, see the advisory:
 >> https://w1.fi/security/2020-2/wpa_supplicant-p2p-group-info-processing-vulnerability.txt
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Applied to master, thanks.

Thanks.

 > (I just moved the _PATCH near _VERSION and _SITE to keep similar things
 > together)

Fine. I did it like this for consistency with hostapd.

-- 
Bye, Peter Korsgaard
