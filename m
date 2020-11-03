From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 23:44:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/opencv3: fix
 OPENCV3_CLEAN_INSTALL_{DOC, CMAKE}
In-Reply-To: <20201101111244.537209-1-fontaine.fabrice@gmail.com>
References: <20201101111244.537209-1-fontaine.fabrice@gmail.com>
Message-ID: <20201103234450.5a1da4e0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  1 Nov 2020 12:12:44 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> opencv3 does not install anything in $(TARGET_DIR)/usr/share/OpenCV/doc
> so drop OPENCV3_CLEAN_INSTALL_DOC
> 
> However it installs its licence files in
> $(TARGET_DIR)/usr/share/licenses/opencv3 so add
> OPENCV3_CLEAN_INSTALL_LICENSE
> 
> Moreover, the cmake hook does not catch all cmake files and missed the
> valgrind files so update OPENCV3_CLEAN_INSTALL_CMAKE and add
> OPENCV3_CLEAN_INSTALL_VALGRIND to delete those files:
> OpenCVConfig.cmake  OpenCVConfig-version.cmake  OpenCVModules.cmake  OpenCVModules-release.cmake  valgrind_3rdparty.supp  valgrind.supp
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/opencv3/opencv3.mk | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
