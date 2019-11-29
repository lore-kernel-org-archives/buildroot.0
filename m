From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:13:05 +0100
Subject: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/wolfssl=3A_add_upstrea?=
 =?utf-8?q?m_security_fix_for_CVE-2019=E2=80=9318840?=
In-Reply-To: <20191128153718.30599-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 28 Nov 2019 16:37:18 +0100")
References: <20191128153718.30599-1-peter@korsgaard.com>
Message-ID: <87imn3cafy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerability:
 > - CVE-2019-18840: In wolfSSL 4.1.0 through 4.2.0c, there are missing sanity
 >   checks of memory accesses in parsing ASN.1 certificate data while
 >   handshaking.  Specifically, there is a one-byte heap-based buffer overflow
 >   inside the DecodedCert structure in GetName in wolfcrypt/src/asn.c because
 >   the domain name location index is mishandled.  Because a pointer is
 >   overwritten, there is an invalid free.

 > For details, see the writeup:
 > https://medium.com/@social_62682/heap-overflow-in-wolfssl-cve-2019-18840-185d233c27de

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
