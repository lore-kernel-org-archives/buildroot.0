From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Jun 2010 08:54:35 +0200
Subject: [Buildroot] [PATCH v2] Add ffmpeg support
In-Reply-To: <1276544505-2969-1-git-send-email-luca@lucaceresoli.net> (Luca
	Ceresoli's message of "Mon, 14 Jun 2010 21:41:41 +0200")
References: <1276544505-2969-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87pqzseqfo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> FFmpeg is a complete, cross-platform solution to record, convert
 Luca> and stream audio and video. It includes libavcodec - the leading
 Luca> audio/video codec library.

 Luca> This patchset adds support for building ffmpeg in buildroot.

 Luca> Most high-level options are provided via kconfig options, and
 Luca> there is a hook in the last commit to allow passing .configure
 Luca> any parameters not directly supported (very handy for machine
 Luca> support, for example).

 Luca> Note that this support is much more complete than the one in bug 401
 Luca> (https://bugs.busybox.net/show_bug.cgi?id=401).

 Luca> v2 includes improvements suggested by Peter Korsgaard.

Thanks, committed. I had to fix up a few things though:

- Missing ')' in qstrip calls
- configure doesn't handle --disable-nls / --disable-largefile
- ffmpeg doesn't build if the toolchain doesn't have largefile support

-- 
Bye, Peter Korsgaard
