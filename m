From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 23:26:34 +0200
Subject: [Buildroot] [PATCH] package/civetweb: fix link failure due to
 missing OpenSSL dependency
In-Reply-To: <20190409211032.66320-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Tue, 9 Apr 2019 23:10:32 +0200")
References: <20190409211032.66320-1-giulio.benetti@micronovasrl.com>
Message-ID: <87muksffcl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > During linking one OpenSSL dependecy is missing(-latomic) on linking
 > library list.

 > - Substitute explicit library list with `pkg-config libssl` when
 > BR2_PACKAGE_OPENSSL is enabled. In such way all needed libraries will be
 > included in linking list.
 > - Add also `host-pkgconf` to CIVETWEB_DEPENDENCIES if
 > BR2_PACKAGE_OPENSSL is enabled to make it available for previous point.

 > Fixes:
 > http://autobuild.buildroot.net/results/b2e/b2e210bdefe84f4ec9cfda79a33d81788fb7e66c/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
