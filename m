From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Mar 2021 21:16:21 +0100
Subject: [Buildroot] [PATCH 2/2] package/gnuradio: fix qtgui build when
 gr-analog is not set
In-Reply-To: <8ed88374-8955-6971-e49a-a6b8628e6b5b@mind.be> (Arnout
 Vandecappelle's message of "Tue, 2 Mar 2021 21:44:13 +0100")
References: <1609773076-72284-1-git-send-email-gwenj@trabucayre.com>
 <1609773076-72284-2-git-send-email-gwenj@trabucayre.com>
 <8ed88374-8955-6971-e49a-a6b8628e6b5b@mind.be>
Message-ID: <87sg4x32zu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 04/01/2021 16:11, Gwenhael Goavec-Merou wrote:
 >> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 >> 
 >> gr-qtgui examples needs to have gr-analog enabled, without this dependency
 >> compile crash with:
 >> 
 >> In file included from
 >> /x/output/build/gnuradio-3.8.1.0/gr-qtgui/examples/c++/display_qt.cc:22:
 >> /x/output/build/gnuradio-3.8.1.0/gr-qtgui/examples/c++/display_qt.h:24:10:
 >> fatal error: gnuradio/analog/noise_source.h: No such file or directory
 >> 24 | #include <gnuradio/analog/noise_source.h>
 >> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 >> compilation terminated.
 >> make[3]: *** [gr-qtgui/examples/c++/CMakeFiles/display_qt.dir/build.make:67:
 >> gr-qtgui/examples/c++/CMakeFiles/display_qt.dir/display_qt.cc.o] Error 1
 >> make[3]: *** Waiting for unfinished jobs....
 >> In file included from
 >> /somewhere/gnuradio/build/gr-qtgui/examples/c++/moc_display_qt.cpp:10:
 >> /somewhere/gnuradio/build/gr-qtgui/examples/c++/../../../../gr-qtgui/examples/c++/display_qt.h:24:10:
 >> fatal error: gnuradio/analog/noise_source.h: No such file or directory
 >> 24 | #include <gnuradio/analog/noise_source.h>
 >> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 >> compilation terminated.
 >> 
 >> GR_ANALOG is not an explicit dependency of GR_QTGUI, so disable c++ examples if
 >> user has not selected this option.
 >> 
 >> [backported from 7470a7a3771dd90defb826b464dfe62977cb1eb6]
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.net/results/fde670499289f3d7d47379eebccf6e0f92c6d200/
 >> 
 >> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

 >  This patch still applies to gnuradio-3.8.1.0 as well, so applied to master, thanks.

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
