From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:32:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/libssh2: fix CVE-2019-17498
In-Reply-To: <20200229113132.2590777-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Feb 2020 12:31:32 +0100")
References: <20200229113132.2590777-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2s2u9jd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > In libssh2 v1.9.0 and earlier versions, the SSH_MSG_DISCONNECT logic in
 > packet.c has an integer overflow in a bounds check, enabling an attacker
 > to specify an arbitrary (out-of-bounds) offset for a subsequent memory
 > read. A crafted SSH server may be able to disclose sensitive information
 > or cause a denial of service condition on the client system when a user
 > connects to the server.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
