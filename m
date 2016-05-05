From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 May 2016 20:40:42 +0200
Subject: [Buildroot] Xorg crash
In-Reply-To: <572B84E6.1000503@zacarias.com.ar> (Gustavo Zacarias's message of
 "Thu, 5 May 2016 14:37:42 -0300")
References: <1274ad69-0abb-26b0-b623-67de78c0274f@brickedbrain.com>
 <572B59A9.2070602@zacarias.com.ar>
 <20160505193148.721ba349@free-electrons.com>
 <572B84E6.1000503@zacarias.com.ar>
Message-ID: <87vb2smjpx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > On 05/05/16 14:31, Thomas Petazzoni wrote:
 >> Hello,
 >> 
 >> On Thu, 5 May 2016 11:33:13 -0300, Gustavo Zacarias wrote:
 >> 
 >>> Try using BR2_OPTIMIZE_2=y and rebuild everything - the X server is
 >>> notoriously fragile when optimizing for size with certain toolchain
 >>> combinations/architectures.
 >> 
 >> Should we:
 >> 
 >> (1) Switch to -O2 as the default optimization level ?
 >> 
 >> (2) Force -O2 for the X.org server ?
 >> 
 >> Thomas

 > Hi.
 > From the little testing i've done it seems that switching the xorg
 > server alone to -O2 is enough.
 > I'm not a fan of "dark magic" scenarios, however it seems to be a
 > recurring problem, at least for ARM & MIPS, doesn't seem to be the
 > case for x86_64.
 > I could make a couple test configs to see on which combinations it's
 > failing by extending the Qemu ones, but it's probably more hassle than
 > anything since there seems to be a wide spectrum of gcc versions
 > affected.
 > Going for -O2 might be the quickest solution, at least for xorg-server
 > itself.

Yes, I agree. Simply forcing -O2 for xorg-server (with a sensible
comment explaining why) is good enough. People including Xorg are most
likely not as tight on space that -Os / -O2 matters much.

-- 
Venlig hilsen,
Peter Korsgaard 
