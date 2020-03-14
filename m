From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:24:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/suricata: fix CVE-2019-18792
In-Reply-To: <20200229223947.4061978-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Feb 2020 23:39:47 +0100")
References: <20200229223947.4061978-1-fontaine.fabrice@gmail.com>
Message-ID: <875zf6ssl2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > An issue was discovered in Suricata 5.0.0. It is possible to
 > bypass/evade any tcp based signature by overlapping a TCP segment with a
 > fake FIN packet. The fake FIN packet is injected just before the PUSH
 > ACK packet we want to bypass. The PUSH ACK packet (containing the data)
 > will be ignored by Suricata because it overlaps the FIN packet (the
 > sequence and ack number are identical in the two packets). The client
 > will ignore the fake FIN packet because the ACK flag is not set. Both
 > linux and windows clients are ignoring the injected packet.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.11.x (not in 2019.02.x), thanks.

-- 
Bye, Peter Korsgaard
