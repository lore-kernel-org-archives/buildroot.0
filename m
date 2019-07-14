From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 12:21:35 +0200
Subject: [Buildroot] [PATCH v3] fs/tar: explicitly set extended header
 values to ensure binary reproducibility
In-Reply-To: <20190706065501.3959-1-itsatharva@gmail.com> (Atharva Lele's
 message of "Sat, 6 Jul 2019 12:25:01 +0530")
References: <20190706065501.3959-1-itsatharva@gmail.com>
Message-ID: <87zhlg6hn4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Atharva" == Atharva Lele <itsatharva@gmail.com> writes:

 > Since we use --xattrs-include='*' to include all extended attributes,
 > tar creates a PAX formatted archive. The archive metadata captures atime
 > and ctime of files. To fix this, GNU recommends that we pass this added
 > argument to tar to create binary reproducible packages. Setting of mtime
 > is handled in fs/common.mk using touch on all files.

 > Diffoscope output pre-change: https://gitlab.com/snippets/1871111
 > Diffoscope output after change is blank i.e. binary reproducibile rootfs
 > is created.

 > GNU Recommendation: https://www.gnu.org/software/tar/manual/tar.html#SEC147

 > Signed-off-by: Atharva Lele <itsatharva@gmail.com>
 > Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
 > ---
 > Changes v2 -> v2:
 >   - Add comment (suggested by Peter)
 >   - Does not depend on BR2_REPRODUCIBLE since we don't need atime/ctime anyway

Committed, thanks.

-- 
Bye, Peter Korsgaard
