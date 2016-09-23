From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 23 Sep 2016 09:38:22 +0000
Subject: [Buildroot] [PATCH] qt5: Disable pkg-config usage for
 cross-building
In-Reply-To: <1474615682.2562.11.camel@synopsys.com>
References: <1474573700-22730-1-git-send-email-abrodkin@synopsys.com>
 <20160922205817.GC3179@free.fr>
 <20160923075722.3dbee0a8@free-electrons.com>
 <1474611155.2562.6.camel@synopsys.com>
 <20160923081921.189fd5e4@free-electrons.com>
 <1474615682.2562.11.camel@synopsys.com>
Message-ID: <1474623493.2562.13.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Yann,

On Fri, 2016-09-23 at 10:28 +0300, Alexey Brodkin wrote:
> Hi Thomas,
> 
> On Fri, 2016-09-23 at 08:19 +0200, Thomas Petazzoni wrote:
> > 
> > Hello,
> > 
> > On Fri, 23 Sep 2016 06:12:44 +0000, Alexey Brodkin wrote:
> > 
> > > 
> > > 
> > > > 
> > > > 
> > > > Alexey, have you tried the other approaches I outlined in the thread
> > > > where the initial discussion took place???

Ok approach with setting empty QMAKE_CFLAGS_ISYSTEM works for me.

So what about something like that?
-------------------------->8---------------------
diff --git a/package/qt5/qt5base/qmake.conf b/package/qt5/qt5base/qmake.conf
index 2152d3c..49cf898 100644
--- a/package/qt5/qt5base/qmake.conf
+++ b/package/qt5/qt5base/qmake.conf
@@ -19,6 +19,7 @@ QMAKE_CXXFLAGS_RELEASE += -O3
?CONFIG?????????????????+= nostrip
?
?QMAKE_LIBS?????????????+= -lrt -lpthread -ldl
+QMAKE_CFLAGS_ISYSTEM???=
?
?include(../common/linux_device_post.conf)
?load(qt_config)
-------------------------->8---------------------

-Alexey
