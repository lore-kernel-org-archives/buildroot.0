From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Apr 2013 23:01:26 +0200
Subject: [Buildroot] [PATCH v2 1/4] xkeyboard-config: make available
	outside of X.org, reduce dependencies
In-Reply-To: <1367267165-6873-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 29 Apr 2013 22:26:02 +0200")
References: <1367267165-6873-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1367267165-6873-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wqrl2grd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> xkeyboard-connfig was selectable only if X.org was enabled. However,
 Thomas> weston, the reference implementation of the Wayland protocol, also
 Thomas> needs xkeyboard-config, so we have to make this package available
 Thomas> outside of the if BR2_PACKAGE_XORG7 ... endif conditional.

 Thomas> In addition to this, the xkeyboard-config currently pulls in
 Thomas> xapp_xkbcomp as a runtime dependency, but this dependency is only
 Thomas> needed with X.org. And it also pulls in xlib_libX11 and xproto_proto
 Thomas> has build-time dependencies. But in fact those ones are runtime

s/has/as/

Otherwise it looks good - Committed, thanks.

-- 
Bye, Peter Korsgaard
