From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 May 2012 23:21:06 +0200
Subject: [Buildroot] [PATCH v4 01/22] legal-info: infrastructure to
 collect legally-relevant material
In-Reply-To: <1337276001-26149-2-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
 <1337276001-26149-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <4FBAB1C2.3050809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/17/12 19:33, Luca Ceresoli wrote:
> This allows to automatically collect material that may be needed to comply with
> the license of packages that Buildroot prepares for the target device.
>
> The core of the implementation is made by the following parts:
>   - in package/pkg-utils.mk some helper functions are defined for common actions
>     such as generating a warning, producing info about a package etc;
>   - in package/pkg-gentargets.mk, within the GENTARGETS framework, a new
>     <PKG>-legal-info target produces all the info for a given package;
>   - Makefile implements the top-level targets:
>     - legal-info-prepare creates the output directory and produces legal info
>       about Buildroot itself and the toolchain, which mostly means just warning
>       the user that this is not implemented;
>     - legal-info, the only target that is supposed to be used directly, depends
>       on all of the above and finishes things by producing the README files from
>       the various pieces.
>
> Signed-off-by: Luca Ceresoli<luca@lucaceresoli.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
