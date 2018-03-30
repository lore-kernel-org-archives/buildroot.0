From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Mar 2018 20:18:40 +0200
Subject: [Buildroot] RFC: gst1-plugins-good 1.14: enable-qt config option
In-Reply-To: <484a4f60-327f-12a8-e90e-206c81d60253@ginzinger.com>
References: <484a4f60-327f-12a8-e90e-206c81d60253@ginzinger.com>
Message-ID: <9c4fb7d7-3c9a-4a80-9b96-fcf546e6b880@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-03-18 10:57, Martin Kepplinger wrote:
>         QPA_INCLUDE_PATH=`$PKG_CONFIG --variable=includedir Qt5Core`/QtGui/${QT_VERSION}/QtGui
>         AS_IF([test -f "$PKG_CONFIG_SYSROOT_DIR/$QPA_INCLUDE_PATH/qpa/qplatformnativeinterface.h"], [

 This seems wrong. The includedir variable should already contain
PKG_CONFIG_SYSROOT_DIR, so if you prepend it again, it will never work... I
think this needs to be patched upstream.

 Regards,
 Arnout

>           QT_CFLAGS="$QT_CFLAGS -I$PKG_CONFIG_SYSROOT_DIR/$QPA_INCLUDE_PATH"
>           HAVE_QT_QPA_HEADER="yes"
>         ], [AC_MSG_NOTICE([Cannot find QPA])])

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
