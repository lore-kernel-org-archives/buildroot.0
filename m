From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 21 Mar 2017 01:06:56 +0100
Subject: [Buildroot] [PATCH 00/16] Enable hash checking for git downloads
Message-ID: <20170321000712.26500-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since our git downloads are reproducible since a while now, we can
actually check the hash of git downloads. This does however still
require a number of fixes first.

Patch 1 fixes the case when tar is compiled to generated Posix format
tarballs.

Patch 2 is just a cleanup. This patch is optional.

Patch 3-5 fix incorrect hash files, which weren't noticed before
because hashes weren't checked.

Patch 6-8 adds a hash for packages that actually have a hash file but
set the hash type to 'none'. These patches are optional.

Patches 9-15 add exclusions for the different packages with CUSTOM_GIT
configuration.

Patch 16, finally, enables the hash check.

Regards,
Arnout

[PATCH 01/16] download/git: create GNU format tar files
[PATCH 02/16] aer-inject: remove redundant _SITE_METHOD
[PATCH 03/16] fmc: correct hash file
[PATCH 04/16] linux-firmware: correct hash
[PATCH 05/16] squashfs: correct hash
[PATCH 06/16] ubus: add hash
[PATCH 07/16] uhttpd: add hash
[PATCH 08/16] vboot-utils: add hash
[PATCH 09/16] linux: exclude from hash check except for latest
[PATCH 10/16] linux-headers: rework hash exclusion
[PATCH 11/16] uboot: exclude from hash check except for latest
[PATCH 12/16] barebox: exclude from hash check except for latest
[PATCH 13/16] at91bootstrap3: exclude from hash when downloading from
[PATCH 14/16] mxs-bootlets: exclude from hash when downloading from
[PATCH 15/16] arm-trusted-firmware: exclude from hash when
[PATCH 16/16] pkg-download: enable hash check for git downloads
