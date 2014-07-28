From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jul 2014 23:13:44 +0200
Subject: [Buildroot] [PATCH] flickcurl: new package
In-Reply-To: <20140728204105.GB4224@free.fr> (Yann E. MORIN's message of "Mon, 
 28 Jul 2014 22:41:05 +0200")
References: <1406545017-29163-1-git-send-email-peter@korsgaard.com>
 <20140728204105.GB4224@free.fr>
Message-ID: <87d2cp9ofr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2014-07-28 12:56 +0200, Peter Korsgaard spake thusly:
 >> We need two patches from upstream git as flickr now requires https access.
 >> It hardcodes openssl for https support in libcurl as Kconfig complains about
 >> circular dependencies if we use logic like:
 >> 
 >> select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_LIBNSS)

 > That's becasue lftp does the opposite select:
 >     package/lftp/Config.in: select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_OPENSSL

 > We must do the select always in the same direction.

Ahh, thanks!

As discussed on IRC, with openssl being the "standard" SSL library, I
think it makes sense to select openssl by default as people are more
likely to need it for other stuff.

-- 
Bye, Peter Korsgaard 
