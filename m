From: Gilles <gilles@whospot.com>
Date: Mon, 21 Jul 2014 12:57:50 -0700
Subject: [Buildroot] issues without busybox
Message-ID: <98386AE2-7424-4E70-8839-6B642B9938F4@whospot.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Folks,

Buildroot is a fantastic effort for small footprint devices. However, in my case - where I'd rather have something a bit more SystemV like with MMU, no busybox, a lot of things are broken.

Just naming a few I recently fixed to get past some issues:

- init network script S40network which tries to use ifup/ifdown only provided in ifupdown package not included.
- S45connman sript (if used) which relies on start-stop-daemon only provided with dpkg.

I understand that dependencies quickly add up to a nightmare and I for one would agree that it should be left up to the user of buildroot to figure them out.

What is the buildroot community feeling about this subject? I understand that the main focus is on busybox, is there a group of people interested in the non-busybox approach? I would be willing to contribute, after all, I have to do this work right now to get me up and going. This might benefit other people.

Cheers,
Gilles
.
