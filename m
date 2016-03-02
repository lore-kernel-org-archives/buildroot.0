From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Mar 2016 19:24:02 +0100
Subject: [Buildroot] [PATCH v3 2/2] chocolate-doom: add patch to fix
 static linking
In-Reply-To: <1456883894-25867-2-git-send-email-rprebello@gmail.com>
References: <1456883894-25867-1-git-send-email-rprebello@gmail.com>
 <1456883894-25867-2-git-send-email-rprebello@gmail.com>
Message-ID: <56D72FC2.800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/02/16 02:58, Rodrigo Rebello wrote:
> This commit adds a backported upstream patch which modifies the
> configure script so that it uses pkg-config to detect libraries and
> their static linking dependencies.
> 
> It also adds host-pkgconf as a dependency and removes the SDL static
> linking workaround from chocolate-doom.mk as it's no longer necessary.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/d98/d981499ad82121d58fb7584b55d09c484cb6aa49/
>   http://autobuild.buildroot.net/results/e41/e419f29e14edd28cbf48278bef725b696ae8ef70/
>   http://autobuild.buildroot.net/results/d8f/d8fe9b5bdb262e939d4150804ea34777c91d3c04/
>   ...
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
> Changes v1 -> v2:
>   - Add host-pkgconf to CHOCOLATE_DOOM_DEPENDENCIES (Thomas Petazzoni)
>   - Remove no longer needed SDL static linking workaround
> 
> Changes v2 -> v3:
>   - Fix typo in commit message (s/chocokate/chocolate/)
> ---
>  ...004-configure-Switch-to-pkg-config-macros.patch | 217 +++++++++++++++++++++
>  package/chocolate-doom/chocolate-doom.mk           |   8 +-
>  2 files changed, 218 insertions(+), 7 deletions(-)
>  create mode 100644 package/chocolate-doom/0004-configure-Switch-to-pkg-config-macros.patch


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
