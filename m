From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Apr 2016 23:12:56 +0200
Subject: [Buildroot] [PATCH] samba4: security bump to version 4.4.2
In-Reply-To: <1460493290-20164-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 12 Apr 2016 17:34:50 -0300")
References: <1460493290-20164-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878u0imsyv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-2118 - A man in the middle can intercept any DCERPC traffic
 > between a client and a server in order toimpersonate the client and get
 > the same privileges as the authenticated user account.

 > CVE-2016-2115 - The protection of DCERPC communication over ncacn_np
 > (which is the default for most the file server related protocols) is
 > inherited from the underlying SMB connection. Samba doesn't enforce SMB
 > signing for this kind of SMB connections by default, which makes man in
 > the middle attacks possible.

 > CVE-2016-2114 - Due to a bug Samba doesn't enforce required smb signing,
 > even if explicitly configured.

 > CVE-2016-2113 - Man in the middle attacks are possible for client
 > triggered LDAP connections (with ldaps://) and ncacn_http connections
 > (with https://).

 > CVE-2016-2112 - A man in the middle is able to downgrade LDAP
 > connections to no integrity protection. It's possible to attack client
 > and server with this.

 > CVE-2016-2111 - When Samba is configured as Domain Controller it allows
 > remote attackers to spoof the computer name of a secure channel's
 > endpoints, and obtain sensitive session information, by running a
 > crafted application and leveraging the ability to sniff network traffic.

 > CVE-2016-2110 - The feature negotiation of NTLMSSP is not downgrade
 > protected. A man in the middle is able to clear even required flags,
 > especially NTLMSSP_NEGOTIATE_SIGN and NTLMSSP_NEGOTIATE_SEAL.

 > CVE-2015-5370 - Errors in Samba DCE-RPC code can lead to denial of
 > service (crashes and high cpu consumption) and man in the middle
 > attacks.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
