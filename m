From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Jan 2013 18:05:34 +0100
Subject: [Buildroot] [PATCH 2/3] python3: Port python2 patches to reduce
 the interpreter size
In-Reply-To: <1358517974-30956-2-git-send-email-maxime.ripard@free-electrons.com>
References: <1358517974-30956-1-git-send-email-maxime.ripard@free-electrons.com>
 <1358517974-30956-2-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <50FAD25E.4010608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/01/13 15:06, Maxime Ripard wrote:
> Some of the python2 patches were left behind when doing the python3
> package. This was because the python build system can now autodetect
> what packages can be built in the system.
>
> However, some of these patches are actually useful to reduce drastically
> the size of the interpreter.
>
> This patch ports the relevant patches to the python3 package, and adds a
> new patch to remove the idle3 IDE as well from the interpreter.
>
> Fixes #5696
>
> Signed-off-by: Maxime Ripard<maxime.ripard@free-electrons.com>
> ---
>   package/python3/Config.in                          |   11 ++
>   .../python3-3.3-012-disable-extensions.patch       |   98 +++++++++++++++++

  You should remove the -3.3- from the patch names. I know they're there 
in the old package, but this is a good opportunity to get rid of that legacy.

  BTW, do these patches have a chance of getting upstreamed?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
