From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 10:39:54 +0100
Subject: [Buildroot] [PATCH] alsa-lib: FLAT: Disable alsa lib when
	FLAT	bianry is selected.
In-Reply-To: <407de4ef-b785-4cac-a661-f90b2b8556f4@email.android.com> (Thomas
 De Schampheleire's message of "Mon, 11 Nov 2013 08:48:23 +0100")
References: <1384146177-6020-1-git-send-email-Sonic.adi@gmail.com>
 <407de4ef-b785-4cac-a661-f90b2b8556f4@email.android.com>
Message-ID: <871u2n8efp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

>> The Advanced Linux Sound Architecture (ALSA) provides audio and MIDI
>> functionality to the Linux operating system.

> This dependency should also be added to the comment that checks for
> threads. It's txt should not be changed, we should only make sure that
> the comment is only visible when relevant (!flat).

And the dependency should also get propagated to alsa-lib's reverse
dependencies:

git grep -l 'select BR2_PACKAGE_ALSA_LIB'
package/alsa-lib/Config.in
package/alsa-utils/Config.in
package/alsamixergui/Config.in
package/bluez_utils/Config.in
package/gstreamer/gst-plugins-base/Config.in
package/gstreamer1/gst1-plugins-base/Config.in
package/mpd/Config.in
package/portaudio/Config.in
package/qt/Config.in
package/spice/Config.in

-- 
Bye, Peter Korsgaard
