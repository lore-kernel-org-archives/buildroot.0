From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Aug 2018 18:47:19 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/rtorrent: bump version to
 0.9.7
References: <20180821213949.32148-1-bernd.kuhls@t-online.de>
 <20180822153649.06549ff0@windsurf>
Message-ID: <nlg05fxp2v.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Wed, 22 Aug 2018 15:36:49 +0200 schrieb Thomas Petazzoni:

> Why is this for next only ?

because when bumping libtorrent to an openssl-1.1-compatible version I 
did not notice that librtorrent and rtorrent are bound to each other, 
this is visible on their github release page:

https://github.com/rakshasa/rtorrent/releases

Rtorrent has no direct dependency to openssl, due to lack of time I do 
not build-test all reverse dependencies of the many packages needed to be 
updated directly for compatability with openssl-1.1.

From my pov build errors like these are expected behaviour, I just let 
the autobuilders do their job ;) That's the reason I waited for the rc-
phase to flood the next branch with patches to prepare the version bumps 
to ffmpeg-4.0.2 and openssl-1.1.0i. Doing so we should have enough time 
until the 2018.11 release to fix all bugs related to these rather 
intrusive bumps.

> What causes the build failure that makes it next-specific ?

https://git.buildroot.net/buildroot/commit/?
h=next&id=07673dd6eb2565468abb5730fa3ca9334df683fc

Regards, Bernd
