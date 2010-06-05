From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Jun 2010 22:09:55 +0200
Subject: [Buildroot] [PATCH 3/4] gstreamer: drop BR2_USE_WCHAR
	dependency (already required by libglib2)
In-Reply-To: <1275767424.9566.30.camel@coalu.atr> (Lionel Landwerlin's message
	of "Sat, 05 Jun 2010 21:50:24 +0200")
References: <1275761030-20955-1-git-send-email-llandwerlin@gmail.com>
	<1275761030-20955-4-git-send-email-llandwerlin@gmail.com>
	<20100605213149.59aa8a5a@surf> <1275767424.9566.30.camel@coalu.atr>
Message-ID: <87mxv9nsvg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

Hi,

 >> > -	depends on BR2_USE_WCHAR # glib2
 >> 
 >> Why ? All packages that depend on libglib2 and therefore on gettext
 >> should depend on BR2_USE_WCHAR. See
 >> b730010c90a127746bada3d537eb0e204cba5988.
 >> 
 >> Is this dependency causing any problems ?
 >> 
 >> Thomas

 Lionel> Hi Thomas,

 Lionel> I don't understand why gstreamer should depend on BR2_USE_WCHAR and
 Lionel> BR2_PACKAGE_LIBGLIB2 if libglib2 already depends on BR2_USE_WCHAR.
 Lionel> It sounds like a repetition to me, isn't it ?

The problem is that gstreamer selects libglib2, it doesn't depend on it
- And select ignores dependencies (E.G. you can enable gstreamer in
menuconfig even if you haven't enabled wchar in the toolchain, because
kconfig doesn't check the dependencies of the things that gets
'select'-ed.

So nack.

-- 
Bye, Peter Korsgaard
