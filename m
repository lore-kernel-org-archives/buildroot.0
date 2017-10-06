From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 22:20:54 +0200
Subject: [Buildroot] [PATCH v3 0/6] engicam: Add new boards and qt5
In-Reply-To: <1505302931-17387-1-git-send-email-jteki@openedev.com>
References: <1505302931-17387-1-git-send-email-jteki@openedev.com>
Message-ID: <15afb899-b767-611e-c169-226bfd581f3a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-17 13:42, Jagan Teki wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> This series add new boards from Engicam with qt5 support for each.
> 
> Jagan Teki (6):
>   engicam: imx6qdl_icore: Bump to latest Linux and uboot releases
>   board: icorem6: Add Qt5 configs for 800x480 LVDS display
>   engicam: icorem6: Add OF C.TOUCH 10.1 Kit
>   board: icorem6: Add Qt5 configs for 1280x800 LVDS display
>   engicam: icorem6: Add OF C.TOUCH 12 Kit
>   board: icorem6: Add Qt5 configs for 1280x480 LVDS display

 Series applied to master, with slight changes to readme.txt.

 I pushed an additional separate patch to readme.txt that makes an IMO nicer
distinction between the different boards - I found the list of DTB files a bit
confusing. Could you take a look at the result?

 It would have been nice to be able to merge more of this stuff with the sabre
configs, but as you mentioned they still have separate U-Boot configs so that
won't be possible, and the json files are also different. Pity.

 Regards,
 Arnout

> 
>  .gitlab-ci.yml                                     |  1 +
>  DEVELOPERS                                         |  1 +
>  board/engicam/icorem6/genimage.cfg                 |  4 +-
>  board/engicam/icorem6/linux_qt5.fragment           |  4 ++
>  board/engicam/icorem6/readme.txt                   | 24 +++++++
>  .../rootfs_overlay/root/imx6qdl-icore-ofcap10.json | 11 +++
>  .../rootfs_overlay/root/imx6qdl-icore-ofcap12.json | 11 +++
>  .../icorem6/rootfs_overlay/root/imx6qdl-icore.json | 11 +++
>  configs/engicam_imx6qdl_icore_defconfig            | 12 ++--
>  configs/engicam_imx6qdl_icore_qt5_defconfig        | 81 ++++++++++++++++++++++
>  10 files changed, 153 insertions(+), 7 deletions(-)
>  create mode 100644 board/engicam/icorem6/linux_qt5.fragment
>  create mode 100644 board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json
>  create mode 100644 board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap12.json
>  create mode 100644 board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json
>  create mode 100644 configs/engicam_imx6qdl_icore_qt5_defconfig
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
