From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 19:06:12 +0200
Subject: [Buildroot] [PATCH 5/7] configs: fix build of
	calao_usb_a9g20_lpw_defconfig
In-Reply-To: <1443901457-7914-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 3 Oct 2015 20:44:15 +0100")
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1443901457-7914-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87twq6k1h7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Both the Barebox and AT91Bootstrap patches for the Calao USB A9G20
 > board are located in the same directory, board/calao/usb-a9g20-lpw/,
 > with only a prefix making a difference between whether they apply to
 > Barebox or AT91Bootstrap.

 > Unfortunately, since commit 0eba4759fab9d093afacac77a0ac31f1f0b3cceb
 > ("packages: apply custom patches using *.patch instead of
 > <pkg>-*.patch"), the logic to apply custom patches in Barebox and
 > AT91Bootstrap has been changed from applying <package>-*.patch to
 > applying *.patch (in order to be consistent with what we do for all
 > packages in Buildroot).

 > However, this had the effect of trying to apply both the AT91Bootstrap
 > and Barebox patches on both packages, which obviously cannot work.

 > This commit fixes that by moving patches around, and switching to use
 > BR2_GLOBAL_PATCH_DIR.

 > Cc: Gregory Hermant <gregory.hermant@calao-systems.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
