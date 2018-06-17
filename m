From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:52:15 +0200
Subject: [Buildroot] [PATCH] libvncserver: add upstream security fix for
 CVE-2018-7225
In-Reply-To: <20180609160229.8741-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 9 Jun 2018 18:02:29 +0200")
References: <20180609160229.8741-1-peter@korsgaard.com>
Message-ID: <87bmc9pg0g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2018-7225 - An issue was discovered in LibVNCServer through
 > 0.9.11.  rfbProcessClientNormalMessage() in rfbserver.c does not sanitize
 > msg.cct.length, leading to access to uninitialized and potentially sensitive
 > data or possibly unspecified other impact (e.g., an integer overflow) via
 > specially crafted VNC packets.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
