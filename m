From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Oct 2018 20:19:28 +0200
Subject: [Buildroot] [PATCH 2/5] webkitgtk: add dependency on the woff2
 package
In-Reply-To: <20181010001714.GD10287@momiji> (Adrian Perez de Castro's message
 of "Wed, 10 Oct 2018 00:17:14 +0200")
References: <20180922235333.85642-1-aperez@igalia.com>
 <20180922235333.85642-3-aperez@igalia.com>
 <20180925225255.3fe01107@windsurf> <20180927124148.GB16720@momiji>
 <87tvmbw4qb.fsf@dell.be.48ers.dk> <20181010001714.GD10287@momiji>
Message-ID: <87efcw1h3j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

Hi,

 >> Correct. Now that we have updated kconfig we could even consider using
 >> the imply keyword to enable woff2 by default if it is really an option
 >> that most people should enable:
 >> 
 >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=237e3ad0f195d8fd34f1299e45f04793832a16fc

 > There's a small doubt I have here... How exactly would we prefer to have this?
 > I can think of two options. One would be the following, and would allow to
 > disable WOFF2 support in WebKitGTK+ even if the woff2 package is built:

 >   config BR2_PACKAGE_WEBKITGTK
 >       # ...
 > 	  imply BR2_PACKAGE_WEBKITGTK_WOFF2

 >   config BR2_PACKAGE_WEBKITGTK_WOFF2
 >       bool "woff2 support"
 > 	  depends on BR2_PACKAGE_WOFF2
 > 	  imply BR2_PACKAGE_WOFF2

 > The other, simpler option, always enables WOFF2 support in WebKitGTK+ if the
 > woff2 package can be built:

 >   config BR2_PACKAGE_WEBKITGTK
 >       # ...
 > 	  imply BR2_PACKAGE_WOFF2

I would go for the 2nd option. I cannot think of any sensible use cases
where we would want woff2 enabled but not use it in webkitgtk, and this
matches what we do elsewhere for E.G. openssl.

-- 
Bye, Peter Korsgaard
