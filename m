From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 09:29:38 +0100
Subject: [Buildroot] [PATCH-2018.02] package/libopenssl: security bump
 to version 1.0.2r
In-Reply-To: <20190321210725.25632-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 21 Mar 2019 22:07:25 +0100")
References: <20190321210725.25632-1-peter@korsgaard.com>
Message-ID: <87k1goad59.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > 0-byte record padding oracle (CVE-2019-1559)

 > If an application encounters a fatal protocol error and then calls
 > SSL_shutdown() twice (once to send a close_notify, and once to receive one)
 > then OpenSSL can respond differently to the calling application if a 0 byte
 > record is received with invalid padding compared to if a 0 byte record is
 > received with an invalid MAC.  If the application then behaves differently
 > based on that in a way that is detectable to the remote peer, then this
 > amounts to a padding oracle that could be used to decrypt data.

 > For more details, see the advisory:

 > https://mta.openssl.org/pipermail/openssl-announce/2019-February/000148.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
