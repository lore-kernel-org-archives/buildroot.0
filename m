From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:26:11 +0200
Subject: [Buildroot] [PATCH v2] support/download/file: fix file://
 protocol handling
In-Reply-To: <1525786111-6206-1-git-send-email-angelo@amarulasolutions.com>
References: <1525786111-6206-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180513222611.749c11ad@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 May 2018 15:28:31 +0200, Angelo Compagnucci wrote:
> When a file is used a source for download using the file:// protocol, a
> malformed url is passed to the file download script which then crashes.
> Following an example of a wrong path passed to the script:
> 
> eval cp -v ''\''file:///home/angelo/DEV/TOOLCHAINSarmv7-eabihf--glibc--bleeding-edge-2017.11-1.tar.bz2'\''' ''\''/home/angelo/DEV/BUILDROOT/br_qemu_arm/build/.armv7-eabihf--glibc--bleeding-edge-2017.11-1.tar.bz2.f403PT/output'\'''.
> 
> Path passed to cp lacks of a / between dir and file part of the url,
> moreover it presents a wrong file:// prefix.
> 
> Fixes:
> 
> cp: cannot stat
> 'file:///home/angelo/DEV/TOOLCHAINSarmv7-eabihf--glibc--bleeding-edge-2017.11-1.tar.bz2':
> No such file or directory
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  support/download/file | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master after reworking the commit log. Thanks Angelo!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
