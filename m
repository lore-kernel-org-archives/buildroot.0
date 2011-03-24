From: Luca Ceresoli <list@lucaceresoli.net>
Date: Thu, 24 Mar 2011 21:57:16 +0100
Subject: [Buildroot] [PATCH 1/1] qt: convert to the GENTARGETS
	infrastructure
In-Reply-To: <39ac37ec67acf7886777166a098039bbab39b691.1300630739.git.thomas.petazzoni@free-electrons.com>
References: <cover.1300630739.git.thomas.petazzoni@free-electrons.com>
	<39ac37ec67acf7886777166a098039bbab39b691.1300630739.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4D8BB02C.4070108@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> In addition to converting the qt package to the GENTARGETS
> infrastructure, this commit also does the following (related) things
> in the Qt package:
>
>   * Create a BR2_PACKAGE_QT_CONFIG_FILE option, which can be used to
>     pass a custom Qt configuration file, such as the ones found in
>     src/corelib/global/qconfig-*.h. This used to be possible, but
>     required changing qt.mk directly, which isn't really how we
>     configure things in Buildroot.
>
>   * Remove the BR2_PACKAGE_QT_EMB_PLATFORM option, the embedded
>     platform name is now computed directly in qt.mk.
>
>   * The QT_CONFIGURE variable, which hosted all ./configure options,
>     has been renamed to QT_CONFIGURE_OPTS, for consistency with what we
>     do in the AUTOTARGETS infrastructure.
>
>   * The QT_DEP_LIBS variable has been renamed to QT_DEPENDENCIES, so
>     that dependencies are properly handled by the GENTARGETS
>     infrastructures.
>
>   * The QT_QMAKE_SET macro (used to adjust the path/flags of the
>     compiler/linker) has been extended with an additional argument,
>     which allows to pass the source directory of Qt.
>
>   * All the installation procedure has been rewritten to fit within the
>     GENTARGETS mechanism.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> ---
>   package/qt/Config.in |   35 ++--
>   package/qt/qt.mk     |  623 +++++++++++++++++++++++---------------------------
>   2 files changed, 302 insertions(+), 356 deletions(-)
>

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Luca
