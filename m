From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 26 Apr 2013 09:33:36 +0200 (CEST)
Subject: [Buildroot] Adding local file system overlay
In-Reply-To: <6119D107D82B0940B389FAED3F2DDE6616222D57@Ansuz.hms.se>
Message-ID: <1768202256.1976834.1366961616672.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


----- Mail original -----
> Hi Buildroot mailinglist!
> 
> During development of a new platform I sometimes find it useful to
> bundle my test builds with my own script/configuration files.
> Example: SSH keys
> 
> This is not something that we want to include in default
> configuration for a board or by any way get in a final build so
> instead I added a second step to local file system overlay checking
> a local variable and if it is set us it as a roofs overlay.
> 
> Is this something that is of interests for the upstream project?
> 
> Example:
> export  LOCAL_ROOTFS_OVERLAY=/local-rootfs-overlay
> make
> 


doesn't buildroot already do that ?

system configuration => overlay directory

or is your patch doing something different

on a semi-related note, I run the following post-build script for 
ssh keys :

#!/bin/sh
mkdir -p $1/root/.ssh/
chmod 0700 $1/root/.ssh/
chmod 0700 $1/root
cp -p ~/.ssh/id_rsa.pub $1/root/.ssh/authorized_keys
chmod 0600 $1/root/.ssh/authorized_keys


that will copy my public key as an authorized key on the built system
