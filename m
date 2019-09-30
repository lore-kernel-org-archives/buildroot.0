From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 18:36:21 +0200
Subject: [Buildroot] [PATCH v3] toolchain: generate check-headers
 program under $(BUILD_DIR)
In-Reply-To: <20190924114611.2863-1-unixmania@gmail.com> (unixmania's message
 of "Tue, 24 Sep 2019 08:46:11 -0300")
References: <20190924114611.2863-1-unixmania@gmail.com>
Message-ID: <875zl93fne.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > Some installations mount /tmp with the 'noexec' option, which prevents
 > running the program generated there to check the kernel headers.

 > Avoid the problem by generating the program under $(BUILD_DIR), passed
 > as the first argument to check-kernel-headers.sh.

 > We could globally export a TMPDIR environment variable with some path
 > under $(BUILD_DIR) but such solution would be too intrusive, depriving
 > the user from the freedom to set TMPDIR at his will (or needs).

 > Fixes: https://bugs.busybox.net/show_bug.cgi?id=12241

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>
 > ---
 > CC: Cerem Cem ASLAN <ceremcem@ceremcem.net>
 > CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > Changes v1->v2:
 > - Move the change that introduces a trap to remove the temporary file to
 >   a separate patch.
 > - Improve the commit message.
 > Changes v2->v3:
 > - Move the SOB line above the cut line.

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
