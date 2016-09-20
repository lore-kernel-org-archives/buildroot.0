From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 01:17:23 +0200
Subject: [Buildroot] [PATCH 1/2] build: add support for as-needed linking
In-Reply-To: <578C249C.9040700@free-electrons.com> (Gustavo Zacarias's message
 of "Sun, 17 Jul 2016 21:36:44 -0300")
References: <1468767958-19572-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <20160717210154.GU3614@free.fr> <578C249C.9040700@free-electrons.com>
Message-ID: <87zin2yxdo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo.zacarias@free-electrons.com> writes:

Hi,

 >> So, what would that bring to us?

 > Yes, that's what lazy binding does... but it's still based on
 > DT_NEEDED entries, hence instead of scanning 10 libraries at required
 > time in my example it will only need to scan 8 to resolve required
 > symbols.
 > For more complex applications that use many nested libraries the
 > savings can be bigger.
 > Example diff between non-as-needed gst-launch-1.0 and as-needed version:

 > libgstreamer-1.0.so.0
 > libgobject-2.0.so.0
 > -libgmodule-2.0.so.0
 > libglib-2.0.so.0
 > -librt.so.1
 > -libdl.so.2
 > libgcc_s.so.1
 > libpthread.so.0
 > libc.so.6

So what is E.G. the time differences when running

time gst-launch-1.0 fakesrc num-buffers=1 ! fakesink

on a "normal" machine with/without these patches?

(Notice that gstreamer searches plugins and creates cache file first
time it is run).

-- 
Bye, Peter Korsgaard
