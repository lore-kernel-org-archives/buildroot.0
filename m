From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 19:06:31 +0200
Subject: [Buildroot] [PATCH 6/7] configs: fix build of
	calao_qil_a9260_defconfig
In-Reply-To: <1443901457-7914-7-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 3 Oct 2015 20:44:16 +0100")
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1443901457-7914-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87pp0uk1go.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The Barebox, AT91Bootstrap and Linux patches for the Calao QIL A9260
 > board are all located in the same directory, board/calao/qil-a9260/,
 > with only a prefix to indicate to which component they apply.

 > Unfortunately, since commit 0eba4759fab9d093afacac77a0ac31f1f0b3cceb
 > ("packages: apply custom patches using *.patch instead of
 > <pkg>-*.patch"), the logic to apply custom patches in Barebox and
 > AT91Bootstrap has been changed from applying <package>-*.patch to
 > applying *.patch (in order to be consistent with what we do for all
 > packages in Buildroot).

 > However, this had the effect of trying to apply both the AT91Bootstrap
 > and Barebox patches on both packages, which obviously cannot work.

 > This commit fixes that by moving patches around, and switching to use
 > BR2_GLOBAL_PATCH_DIR for all of Barebox, AT91Bootstrap and Linux
 > patches.

 > In addition, the defconfig was not specifying explicitly which Barebox
 > version to use, so right now it's trying to use Barebox 2015.09, on
 > which the board-specific patch does not apply. So we've forced to use
 > Barebox 2012.08, which was the lastest release available at the time
 > the defconfig was initially contributed.

 > Cc: Gregory Hermant <gregory.hermant@calao-systems.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
