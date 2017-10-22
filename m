From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Oct 2017 00:50:46 +0200
Subject: [Buildroot] [git commit] libffi: add patch to fix MIPS support
In-Reply-To: <20171022134900.3FE8080467@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 22 Oct 2017 15:56:20 +0200")
References: <20171022134900.3FE8080467@busybox.osuosl.org>
Message-ID: <87zi8i7q61.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=4852f05907cd365825f37c283a415a77ba1fcba9
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Building Python 3.x on MIPS with musl fails because the libffi code
 > uses a "#ifdef linux" test to decide if we're building on Linux or
 > not. When building with -std=c99, "linux" is not defined, so instead
 > of including <asm/sgidefs.h>, libffi's code tries to include
 > <sgidefs.h>, which doesn't exist on musl.

 > The right fix is to use __linux__, which is POSIX compliant, and
 > therefore defined even when -std=c99 is used.

 > Note that glibc and uClibc were not affected because they do provide a
 > <sgidefs.h> header in addition to the <asm/sgidefs.h> one.

 > Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
 > [Thomas: reformat patch with Git, add a better commit log and description.]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
