From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Tue, 24 Dec 2013 10:05:09 +0200
Subject: [Buildroot] [PATCH] qt5: remove qt5jsbackend package
In-Reply-To: <20131224084545.6163a49e@skate>
References: <1387866891-31546-1-git-send-email-fatih.asici@gmail.com>
 <20131224084545.6163a49e@skate>
Message-ID: <201312241005.09507.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 24 December 2013 09:45:45 Thomas Petazzoni wrote:
> Dear Fatih A??c?,
> 
> On Tue, 24 Dec 2013 08:34:51 +0200, Fatih A??c? wrote:
> > Upstream did not release a new version of this package since it is
> > superseded by the builtin qml engine found in new qt5declarative.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/3861aa91e03154c7d20f4157f0c3a1fa1
> > 4838af1/
> > 
> > Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> > ---
> > 
> >  package/qt5/Config.in                              |  1 -
> >  package/qt5/qt5declarative/Config.in               | 13 +++++--
> >  package/qt5/qt5declarative/qt5declarative.mk       |  2 +-
> >  package/qt5/qt5graphicaleffects/Config.in          |  5 ++-
> >  package/qt5/qt5jsbackend/Config.in                 | 19 ----------
> >  ...ackend-0001-dont-import-bz2-python-module.patch | 29 ----------------
> >  package/qt5/qt5jsbackend/qt5jsbackend.mk           | 40
> >  ---------------------- package/qt5/qt5multimedia/Config.in             
> >    |  5 ++-
> >  package/qt5/qt5quick1/Config.in                    |  5 ++-
> >  package/qt5/qt5quick1/qt5quick1.mk                 |  2 +-
> >  package/qt5/qt5quickcontrols/Config.in             |  5 ++-
> >  11 files changed, 20 insertions(+), 106 deletions(-)
> >  delete mode 100644 package/qt5/qt5jsbackend/Config.in
> >  delete mode 100644
> >  package/qt5/qt5jsbackend/qt5jsbackend-0001-dont-import-bz2-python-modul
> >  e.patch delete mode 100644 package/qt5/qt5jsbackend/qt5jsbackend.mk
> 
> Do we need a Config.in.legacy symbol for the removal of qt5jsbackend?

No. Packages depending on qt5jsbackend also depends on qt5declarative. AFAIK, 
qt5jsbackend is not useful without qt5declarative. So users must have already 
selected qt5declarative.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131224/bb74f496/attachment.html>
