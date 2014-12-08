From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 08 Dec 2014 23:59:08 +0100
Subject: [Buildroot] [PATCHv2 08/12] gcc/arc-4.8-R3: add patch to warn
 about unsafe header paths
In-Reply-To: <1417470913-1280-9-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417470913-1280-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417470913-1280-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <54862D3C.8010401@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 01/12/2014 22:55, Thomas Petazzoni a ?crit :
> This commit adds a patch to gcc borrowed from CodeSourcery/Yocto that
> warns about unsafe include paths (i.e /usr/include,
> /usr/local/include, etc.). The patch was adapted to gcc arc-4.8-R3,
> and modified to support the BR_COMPILER_PARANOID_UNSAFE_PATH
> environment variable to error out instead of just warn when unsafe
> paths are used. Even though erroring out can be chosen by passing
> -Werror=poison-system-directories, we are not sure this option in
> CFLAGS will always be passed, so having an environment variable
> guarantees it will always be passed, and also allows to have an
> identical behavior to the external toolchain wrapper.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../910-gcc-poison-system-directories.patch        | 221 +++++++++++++++++++++
>  1 file changed, 221 insertions(+)
>  create mode 100644 package/gcc/arc-4.8-R3/910-gcc-poison-system-directories.patch
> 

Same here, the arc toolchain has been updated to arc-2014.08 by Alexey Brodkin.

Best regards,
-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel| 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
