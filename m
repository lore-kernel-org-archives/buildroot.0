From: William Pettersson <enigma@strudel-hound.com>
Date: Thu, 19 Jul 2007 14:35:15 +1000
Subject: [Buildroot] GCC - march=geode doesn't exist?
Message-ID: <469EEA03.2020304@strudel-hound.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, so I'm still working on this Soekris, using gcc-4.2.0.  4.2.0
doesn't support -march=geode or -mtune=geode, but BR2_GCC_TARGET_ARCH
and BR2_GCC_TARGET_TUNE are both set to "geode" if you select the geode.
 Now apparently gcc-4.3.0 has plans for a geode target, but as 4.3.0
isn't stable yet, I've attached a patch which makes the "geode" select
"i586" for BR2_GCC_TARGET_TUNE and BR2_GCC_TARGET_ARCH.

William

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: Config.in.gcc.patch
Url: http://busybox.net/lists/buildroot/attachments/20070719/abc7a1ee/attachment.diff 
