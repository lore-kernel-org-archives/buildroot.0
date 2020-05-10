From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 22:45:59 +0200
Subject: [Buildroot] [PATCH v1] package/qt5base: fix input_event related
 compile failure
In-Reply-To: <871rnrr05p.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 10 May 2020 22:43:30 +0200")
References: <20200504214552.26570-1-ps.report@gmx.net>
 <871rnrr05p.fsf@dell.be.48ers.dk>
Message-ID: <87wo5jplh4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
 >> Fixes:
 >> - http://autobuild.buildroot.net/results/af76190876656252eb6f60220cdb1d627a03b7c3

 >> evdevkeyboard/qevdevkeyboardhandler.cpp: In member function ?void QEvdevKeyboardHandler::switchLed(int, bool)?:
 >> evdevkeyboard/qevdevkeyboardhandler.cpp:153:28: error: ?struct input_event? has no member named ?time?; did you mean ?type??
 >> ::gettimeofday(&led_ie.time, 0);
 >> ^~~~
 >> type

 >> evdevtouch/qevdevtouchhandler.cpp: In member function ?void QEvdevTouchScreenData::processInputEvent(input_event*)?:
 >> evdevtouch/qevdevtouchhandler.cpp:579:29: error: ?struct input_event? has no member named ?time?; did you mean ?type??
 >> m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
 >> ^~~~
 >> type
 >> evdevtouch/qevdevtouchhandler.cpp:579:49: error: ?struct input_event? has no member named ?time?; did you mean ?type??
 >> m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
 >> ^~~~
 >> type

 > A similar fix is presumably also needed for 2020.02.x? Care to send a
 > patch?

Or perhaps not? This only triggers with musl 1.2.0+ on 32bit OS'es
(which we don't have in 2020.02.x), right?

-- 
Bye, Peter Korsgaard
