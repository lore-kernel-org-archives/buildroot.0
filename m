From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 21:11:28 +0100
Subject: [Buildroot] [PATCH 3/3] armbian-firmware: fail build for
 missing file
In-Reply-To: <1515973281-3997-3-git-send-email-ricardo.martincoski@gmail.com>
 (Ricardo Martincoski's message of "Sun, 14 Jan 2018 21:41:21 -0200")
References: <1515973281-3997-1-git-send-email-ricardo.martincoski@gmail.com>
 <1515973281-3997-3-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <87k1wiubkf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > When a file is listed to be installed but is missing from the package
 > source currently the first tar command exits with error code but it is
 > ignored and the build succeeds.
 > This issue by itself is minor because those listed files that are
 > present in the package source get installed to the target.
 > But the code is currently error prone, e.g. to a typo in the file list.

 > Fix this by first creating a tarball in the build directory and then
 > installing it, instead of using a pipe between the two tar invocations.
 > Also use && between the commands, so the first command that exits with
 > error code fails the build.
 > Since the two tar invocations remain in use, the desired behavior
 > remains the same:
 >  - list of files can contain *;
 >  - list of files can contain file inside path, and the path is then
 >    replicated in the target;
 >  - symlinks are not followed but are installed.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Sergey Matyukevich <geomatsi@gmail.com>
 > ---
 > This package copied the install commands from linux-firmware.
 > So let's copy the fix and also the commit log.

Committed, thanks.

-- 
Bye, Peter Korsgaard
