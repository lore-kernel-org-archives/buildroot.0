From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 11 Jun 2009 18:16:23 +0000 (UTC)
Subject: [Buildroot] [Bug 383] gst-plugins-good: Allow soup plugin to be
	configured
In-Reply-To: <bug-383-163@https.bugs.busybox.net/>
References: <bug-383-163@https.bugs.busybox.net/>
Message-ID: <20090611181623.7914C7781E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=383





--- Comment #5 from Markus Heidelberg <markus.heidelberg@web.de>  2009-06-11 18:16:22 UTC ---
(In reply to comment #4)
> (In reply to comment #3)
> > (In reply to comment #2)
> > > I tried to follow the existing conventions in the file. Could you point me to
> > > an example usage of the convention you are talking about?
> > 
> > All the other config options for plugins?
> > And without knowing what libsoup is all about, I only think on something to
> > eat. The words "http client" at least gives some information.
> 
> Ok, for example:
> 
> config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC
>         bool "flac (libFLAC)"
>         select BR2_PACKAGE_FLAC
> 
> The names of the plugins are "flacenc" and "flacdec", and are not mentioned in
> the config.

Yes, I noticed it myself after sending the response. A config option doesn't
necessarily correspond to only 1 plugin. But it's still valid what I said
earlier ("It is written in the configure help of the gst package."), I think we
should stick to this.
Note that I speak about all gst-plugins-{base,good,ugly} packages.

> In parentheses we have "libFLAC" which appears to be telling us
> what the dependency is.

libFLAC is the only config option where just the dependency is written in the
description, I would have preferred "FLAC lossless audio" as in the configure
script help from the gst-plugins-good package.

> No other plugins are described, e.g. matroska is a
> container format but this is not explained in the config.

The plugins with external dependencies all have a little description, if it's
not obviously clear from the name. The matroska plugin and all the other
plugins without description are dependency-less plugins. When I initially wrote
support for the gstreamer/gst-plugins-* packages, I had to be able to disable
most of the dependency-less plugins, because I didn't need them (and didn't
have much space on the flash) but they were all compiled by default. So I just
listed them so that I was able to disable them. You may notice, some of them
have a little description anyway - these were the ones I needed and did enable.
The other ones I mostly didn't have a clue what they were about, neither did I
care about - and the configure help of the particular gst* package doesn't have
a description, so I couldn't easily add a little description for them.

So if someone now adds support for a new plugin, he definetely knows what it is
about and should include a little description.

> The name of the config variable seems to me to correspond to the name of the
> plugin/configure option in gstreamer rather than the name of the element.

The name of the element was wrong as said above, sorry. But they actually
correspond to the name of the configure help (the word after the colon), which
mostly is equivalent to the --disable/enable-option. But for example it is
--diable-oss, but ossaudio after the colon.

> I
> could change the patch, it's not a problem, but I do think it would look a
> little weird the way things are laid out at the moment.

I don't think "souphttpsrc" would look weird. And it would be consistent with
the current style. Of course just using "soup" also wouldn't be really
inconsistent.

I know, my comments can be petty, but I'd like to keep things clean and
consistent. This is even more true, since the gstreamer support came from me
initially.
I hope you are more happy to receive such comments than none at all.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
