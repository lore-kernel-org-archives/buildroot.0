From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Nov 2020 10:21:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/opencv3: fix
 OPENCV3_CLEAN_INSTALL_{DOC, CMAKE}
In-Reply-To: <20201101111244.537209-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Nov 2020 12:12:44 +0100")
References: <20201101111244.537209-1-fontaine.fabrice@gmail.com>
Message-ID: <87mtzqx4vg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > opencv3 does not install anything in $(TARGET_DIR)/usr/share/OpenCV/doc
 > so drop OPENCV3_CLEAN_INSTALL_DOC

 > However it installs its licence files in
 > $(TARGET_DIR)/usr/share/licenses/opencv3 so add
 > OPENCV3_CLEAN_INSTALL_LICENSE

 > Moreover, the cmake hook does not catch all cmake files and missed the
 > valgrind files so update OPENCV3_CLEAN_INSTALL_CMAKE and add
 > OPENCV3_CLEAN_INSTALL_VALGRIND to delete those files:
 > OpenCVConfig.cmake  OpenCVConfig-version.cmake  OpenCVModules.cmake  OpenCVModules-release.cmake  valgrind_3rdparty.supp  valgrind.supp

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
