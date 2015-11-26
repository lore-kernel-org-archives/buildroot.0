From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:37:01 +0100
Subject: [Buildroot] [PATCH] gstreamer: can optionally use libxml2
In-Reply-To: <1448024811-5447-1-git-send-email-gustavo.zacarias@free-electrons.com>
 (gustavo zacarias's message of "Fri, 20 Nov 2015 10:06:51 -0300")
References: <1448024811-5447-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <87egfctpc2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "gustavo" == gustavo zacarias <gustavo.zacarias@free-electrons.com> writes:

 > From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
 > gstreamer can optionally build against libxml2, so account for it in
 > the dependencies.
 > Functionality seems somewhat reduced without it, an example being
 > misdetecting subtitle (.srt) files as subrip mime type instead of
 > subtitle itself.

 > A failed scenario would be:

 > $ gst-typefind-0.10 some.srt
 > some.srt - application/x-subrip

 > When built with libxml2:

 > $ gst-typefind-0.10 some.srt
 > some.srt - application/x-subtitle

 > This doesn't affect gstreamer 1.x since it dropped any use of libxml2.

 > Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
