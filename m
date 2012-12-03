From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Dec 2012 23:21:41 -0800
Subject: [Buildroot] [PATCH 01/51] package/cURL: fix static link whith
	openSSL
In-Reply-To: <1354146890-27380-2-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 29 Nov 2012 00:54:00 +0100")
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
 <1354146890-27380-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87624jppmi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> When openSSL is selected, cURL is configured to use it.
 Yann> But in this case, the libcurl.pc file /forgets/ to require link
 Yann> against -ldl.

 Yann> This can happen, for example, when BR2_PREFER_STATIC_LIB is not set,
 Yann> but an executable wants to be linked statically (for various reasons
 Yann> which are irrelevant here).

 Yann> Fix that by appending a 'Requires: openssl' line to libcurl.pc.in,
 Yann> but only if openSSL is enabled.

 Yann> As suggested by Arnout, do it in a post-patch hook, rather as a
 Yann> post-install hook.

Committed, thanks.

-- 
Bye, Peter Korsgaard
