From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Dec 2015 21:47:19 +0100
Subject: [Buildroot] [PATCH 1/2] libgudev: remove systemd dependency
In-Reply-To: <1449055626-4640-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Wed, 2 Dec 2015 12:27:05
 +0100")
References: <1449055626-4640-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <87io48mzvs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Since version 3.1.3 eudev doesn't provide internal libgudev,
 > so this package can now be used as an ordinary stand-alone
 > package.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 >  package/libgudev/Config.in | 2 --
 >  1 file changed, 2 deletions(-)

 > diff --git a/package/libgudev/Config.in b/package/libgudev/Config.in
 > index 9b64ffc..4596fa1 100644
 > --- a/package/libgudev/Config.in
 > +++ b/package/libgudev/Config.in
 > @@ -1,6 +1,5 @@
 >  config BR2_PACKAGE_LIBGUDEV
 >  	bool "libgudev"
 > -	depends on BR2_INIT_SYSTEMD

But is still needs udev, so it needs to depend on BR2_PACKAGE_HAS_UDEV,
and the toolchain comment needs to change.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
