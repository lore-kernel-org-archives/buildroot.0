From: Hodgson, Simon <Simon.Hodgson@nortechonline.co.uk>
Date: Mon, 19 May 2008 08:02:39 +0100
Subject: [Buildroot] lockfile-progs 404 not found error
In-Reply-To: <6306c640805161610n5075970auf0abad5f37e6a501@mail.gmail.com>
References: <6306c640805161610n5075970auf0abad5f37e6a501@mail.gmail.com>
Message-ID: <B44D4D5BF344094DABB900C4E0F6E3530176347404@srv02.nortechonline.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I got round this problem by manually downloading this file:

http://ftp.debian.org/debian/pool/main/l/lockfile-progs/lockfile-progs_0.1.11-0.1.tar.gz

into my BUILDROOT_DL_DIR folder, then renaming lockfile-progs_0.1.11-0.1.tar.gz to lockfile-progs_0.1.11.tar.gz there's another problem that you're also likely to run into, you may need to make the following change, to buildroot/package/lockfile-progs/lockfile-progs.mk

Change the line
LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/sid
to
LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/lockfile-progs-0.1.11

Whilst doing a build for that chip, I also ran into problems with the SetSerial utils producing a 404, if you do, then try a manual download of:

http://security.ubuntu.com/ubuntu/pool/main/s/setserial/setserial_2.17-44.tar.gz

Regards


Simon

From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On Behalf Of Ram kumar
Sent: 17 May 2008 00:10
To: buildroot at uclibc.org
Subject: [Buildroot] lockfile-progs 404 not found error

hi,
       Iam trying to build a development environment using the buildroot for atmel chip AT91SAM9260.

The buildroot builds everything but it stops at a point lockfile-progs.It is trying to get connected  to http://ftp.debian.org and looks for the file progs_0.1.11.tar.gz.

But the file name in debian.org<http://debian.org> has been changed to progs_0.1.11-0.1.tar.gz.

Hers is the error message which iam seeing in the shell ?

wget --passive-ftp -nd  -P /buildroot/dl "http://ftp.debian.org"/debian/pool/main/l/lockfile-progs//lockfile-progs_0.1.11.tar.gz
--03:56:16--  http://ftp.debian.org/debian/pool/main/l/lockfile-progs//lockfile-progs_0.1.11.tar.gz<http://ftp.debian.org/debian/pool/main/l/lockfile-progs/lockfile-progs_0.1.11.tar.gz>
           => `/buildroot/dl/lockfile-progs_0.1.11.tar.gz'
Resolving ftp.debian.org... 128.101.240.212<http://128.101.240.212>
Connecting to ftp.debian.org<http://ftp.debian.org>|128.101.240.212<http://128.101.240.212>|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
03:56:17 ERROR 404: Not Found.

Then the build stops.Please guide me whether i have apply any patch for the error ?

Regards,
Ram

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080519/3b56a6a4/attachment.htm 
