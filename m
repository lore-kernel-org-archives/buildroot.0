From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jun 2016 15:17:48 +0200
Subject: [Buildroot] [PATCH 010/121] package/gstreamer1: add hash file
In-Reply-To: <5767E69A.4030606@zacarias.com.ar> (Gustavo Zacarias's message of
 "Mon, 20 Jun 2016 09:50:34 -0300")
References: <cover.1466334225.git.yann.morin.1998@free.fr>
 <4d192a07160d9c41e9abe7e1aaa73a6f7f28c435.1466334225.git.yann.morin.1998@free.fr>
 <87y4612d65.fsf@dell.be.48ers.dk> <5767E69A.4030606@zacarias.com.ar>
Message-ID: <87vb140zk3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 >> > -# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.8.2.tar.xz.sha256sum
 >> > -sha256	9dbebe079c2ab2004ef7f2649fa317cabea1feb4fb5605c24d40744b90918341  gstreamer-1.8.2.tar.xz
 >> > +# localy computed
 >> > +sha256  9dbebe079c2ab2004ef7f2649fa317cabea1feb4fb5605c24d40744b90918341  gstreamer-1.8.2.tar.xz
 >> 
 >> Just as for gstreamer, I've appended the sha256 to the file.

 > Hi.
 > Why on earth do we need duplicate hashes (upstream + locally computed
 > which are based on the same algo)?

Heh, you are naturally right. I missed that in the pile of commits
(the upstream hash was md5 for gstreamer 0.10x) - I'll revert.

 > And what's the reason massive hashes are suddenly required? I've seen
 > the autobuilders getting corrupted downloads, but why is it happening?

There has been a desire to add hashes for all packages for some
time. Recently there apparently was some temporary hickup at github,
which made it painfully clear that we aren't there yet and that was
(IMHO) a good motivation to work on it.

The Github issue was fixed quite fast upstream (a few hours). I haven't
contacted Github to hear what went wrong (and not seen any official
statement), but nevertheless, adding hashes is a good thing to me.

-- 
Venlig hilsen,
Peter Korsgaard 
