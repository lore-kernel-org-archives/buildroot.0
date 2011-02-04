From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Feb 2011 22:53:02 +0100
Subject: [Buildroot] [PATCH 2/2] Add orc package
In-Reply-To: <1296843913-22321-3-git-send-email-felipe.contreras@gmail.com>
	(Felipe Contreras's message of "Fri, 4 Feb 2011 20:25:13 +0200")
References: <1296843913-22321-1-git-send-email-felipe.contreras@gmail.com>
	<1296843913-22321-3-git-send-email-felipe.contreras@gmail.com>
Message-ID: <87y65vpiv5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:

 Felipe> And add GStreamer dependencies (although they are not strong).

If it isn't a hard dependency, then you shouldn't enforce it by
unconditionally adding it to *_DEPENDENCIES.

Instead, make sure it gets build before gst-plugins-* if it is
enabled. See how we handle E.G. optional openssl support in a bunch of
packages:

ifeq ($(BR2_PACKAGE_OPENSSL),y)
        HOSTAPD_DEPENDENCIES += openssl
..

-- 
Bye, Peter Korsgaard
