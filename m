From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 11:29:18 +0200
Subject: [Buildroot] [PATCH] package/mosquitto: security bump to version
 1.6.6
In-Reply-To: <20190918143840.19328-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 18 Sep 2019 16:38:39 +0200")
References: <20190918143840.19328-1-peter@korsgaard.com>
Message-ID: <87h84z76dt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes a security issue. From the annoncement:
 > A vulnerability exists in Mosquitto versions 1.5 to 1.6.5 inclusive.

 > If a client sends a SUBSCRIBE packet containing a topic that consists of
 > approximately 65400 or more '/' characters, i.e.  the topic hierarchy
 > separator, then a stack overflow will occur.

 > The issue is fixed in Mosquitto 1.6.6 and 1.5.9.  Patches for older versions
 > are available at https://mosquitto.org/files/cve/2019-hier

 > The fix addresses the problem by restricting the allowed number of topic
 > hierarchy levels to 200.  An alternative fix is to increase the size of the
 > stack by a small amount.

 > https://mosquitto.org/blog/2019/09/version-1-6-6-released/

 > Also notice that 1.6.5 silently fixed a security issue:

 > CVE-2019-11778

 > A vulnerability exists in Mosquitto version 1.6 to 1.6.4 inclusive, known as CVE-2019-11778

 > If an MQTT v5 client connects to Mosquitto, sets a last will and testament,
 > sets a will delay interval, sets a session expiry interval, and the will
 > delay interval is set longer than the session expiry interval, then a use
 > after free error occurs, which has the potential to cause a crash in some
 > situations.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
