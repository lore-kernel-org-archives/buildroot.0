From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Dec 2016 20:40:54 +0100
Subject: [Buildroot] [PATCH] Makefile: move SED definition into the main
	Makefile
In-Reply-To: <1480887444-19245-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 4 Dec 2016 22:37:24 +0100")
References: <1480887444-19245-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zik8j16h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Since commit f71a621d91ec27f175fc84012962f88b1107305f, we are using the
 > SED variable in the main Makefile. However, this variable is only
 > defined in package/Makefile.in, which gets included only when a
 > configuration is defined.

 > This means that, if you do:

 >  $ make menuconfig savedefconfig

 > without a configuration defined, it fails with:

 > /bin/bash: /BR2_DEFCONFIG=/d: No such file or directory
 > Makefile:898: recipe for target 'savedefconfig' failed
 > make[1]: *** [savedefconfig] Error 127

 > This issue affects users of the "buildroot-submodule" project, which
 > does menuconfig+savedefconfig automatically. They worked around this
 > issue in commit
 > https://github.com/Openwide-Ingenierie/buildroot-submodule/commit/d12676b608a58529c6b551aa176464166a200428,
 > but really "make menuconfig savedefconfig" should work out of the box.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
