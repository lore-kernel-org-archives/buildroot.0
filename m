From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 08 Dec 2014 23:58:10 +0100
Subject: [Buildroot] [PATCHv2 05/12] binutils/arc-4.8-R3: add patch to
 warn about unsafe library paths
In-Reply-To: <1417470913-1280-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417470913-1280-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417470913-1280-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <54862D02.7050607@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 01/12/2014 22:55, Thomas Petazzoni a ?crit :
> This commit adds a patch to binutils borrowed from CodeSourcery/Yocto
> that warns about unsafe library paths (i.e /usr/lib, /usr/local/lib,
> etc.). The patch was adapted to binutils arc-4.8-R3, and modified to
> support the BR_COMPILER_PARANOID_UNSAFE_PATH environment variable to
> error out instead of just warn when unsafe paths are used. Even though
> erroring out can be chosen by passing
> --error-poison-system-directories, we are not sure this option in
> LDFLAGS will always be passed, so having an environment variable
> guarantees it will always be passed, and also allows to have an
> identical behavior to the external toolchain wrapper.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../arc-4.8-R3/600-poison-system-directories.patch | 279 +++++++++++++++++++++
>  1 file changed, 279 insertions(+)
>  create mode 100644 package/binutils/arc-4.8-R3/600-poison-system-directories.patch

NAK.
The arc toolchain has been updated to arc-2014.08 by Alexey Brodkin.

Best regards,
-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel| 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
