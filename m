From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 13 May 2013 13:59:16 -0500
Subject: [Buildroot] [PATCH v4 0/7] Gstreamer 1.X patch series
In-Reply-To: <20130513202900.5ffa3bd2@skate>
References: <1368468241-23319-1-git-send-email-spenser@gillilanding.com>
 <20130513202900.5ffa3bd2@skate>
Message-ID: <CAEBucnCLJSpcC4QNnc4=qKJz7_hcVodAjkmiNdHucQW7B3_GTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> It would be good if your e-mail (including cover letters) were wrapped
> at ~80 columns.

I'll fix this, if another patch re-roll is required.

> Is it just a sed s/GSTREAMER/GSTREAMER1/ everywhere, or have you made
> some more extensive changes?

As many configure options have changed (added/removed), I went through
each of the packages and compared the available configure options to
the options listed in <blah>.mk and Config.in. Any options which
required additional libraries which were currently not included in
Buildroot are explicitly disabled.  Additionally, patch 6 & 7 give an
example of how to add gstreamer1 support for a newly added library
(libvpx/webm).

In addition, the glib patches I have made are a requirement for
building gstreamer 1.0.7.  The minimum glib version to support
gstreamer 1.0.X is 2.32.0. The patch i made is for 2.36.1 (latest
stable).

Thanks,
Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
