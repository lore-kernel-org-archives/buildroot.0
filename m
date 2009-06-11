From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 11 Jun 2009 17:29:17 +0000 (UTC)
Subject: [Buildroot] [Bug 383] gst-plugins-good: Allow soup plugin to be
	configured
In-Reply-To: <bug-383-163@https.bugs.busybox.net/>
References: <bug-383-163@https.bugs.busybox.net/>
Message-ID: <20090611172917.983407781E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=383





--- Comment #4 from Will Newton <will.newton@gmail.com>  2009-06-11 17:29:17 UTC ---
(In reply to comment #3)
> (In reply to comment #2)
> > I tried to follow the existing conventions in the file. Could you point me to
> > an example usage of the convention you are talking about?
> 
> All the other config options for plugins?
> And without knowing what libsoup is all about, I only think on something to
> eat. The words "http client" at least gives some information.

Ok, for example:

config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC
        bool "flac (libFLAC)"
        select BR2_PACKAGE_FLAC

The names of the plugins are "flacenc" and "flacdec", and are not mentioned in
the config. In parentheses we have "libFLAC" which appears to be telling us
what the dependency is. No other plugins are described, e.g. matroska is a
container format but this is not explained in the config.

The name of the config variable seems to me to correspond to the name of the
plugin/configure option in gstreamer rather than the name of the element. I
could change the patch, it's not a problem, but I do think it would look a
little weird the way things are laid out at the moment.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
