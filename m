From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 9 May 2020 23:56:02 +0200
Subject: [Buildroot] [PATCH v1] package/qt5base: fix input_event related
 compile failure
In-Reply-To: <20200509231534.25fccd75@windsurf.home>
References: <20200504214552.26570-1-ps.report@gmx.net>
 <20200509231534.25fccd75@windsurf.home>
Message-ID: <20200509235602.185dc4e3@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 9 May 2020 23:15:34 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Mon,  4 May 2020 23:45:52 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
> 
> > Fixes:
> > 
> >   - http://autobuild.buildroot.net/results/af76190876656252eb6f60220cdb1d627a03b7c3
> > 
> >   evdevkeyboard/qevdevkeyboardhandler.cpp: In member function ?void QEvdevKeyboardHandler::switchLed(int, bool)?:
> >   evdevkeyboard/qevdevkeyboardhandler.cpp:153:28: error: ?struct input_event? has no member named ?time?; did you mean ?type??
> >        ::gettimeofday(&led_ie.time, 0);
> >                               ^~~~
> >                               type
> > 
> >   evdevtouch/qevdevtouchhandler.cpp: In member function ?void QEvdevTouchScreenData::processInputEvent(input_event*)?:
> >   evdevtouch/qevdevtouchhandler.cpp:579:29: error: ?struct input_event? has no member named ?time?; did you mean ?type??
> >            m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
> >                                ^~~~
> >                                type
> >   evdevtouch/qevdevtouchhandler.cpp:579:49: error: ?struct input_event? has no member named ?time?; did you mean ?type??
> >            m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
> >                                                    ^~~~
> >                                                    type
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  ...fix-input_event-time-related-compile.patch | 56 +++++++++++++++++++
> >  ...fix-input_event-time-related-compile.patch | 56 +++++++++++++++++++
> >  2 files changed, 112 insertions(+)
> >  create mode 100644 package/qt5/qt5base/0005-evdevkeyboard-fix-input_event-time-related-compile.patch
> >  create mode 100644 package/qt5/qt5base/0006-evdevtouch-fix-input_event-time-related-compile.patch  
> 
> I've applied to master, after adding the upstream details of each
> patch, as they have now been merged upstream (thanks for your work!).
> 
> It would however be nice if you could remember to use "git format-patch
> -N" when generating patches and/or to run "make check-package" which
> would warn you about this :-)

Ups, thanks for fixing it....will try to work more accurate ;-)

Regards,
Peter

> 
> Thanks!
> 
> Thomas
