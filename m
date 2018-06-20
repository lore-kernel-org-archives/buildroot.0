From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 20 Jun 2018 10:22:27 -0700
Subject: [Buildroot] Test of Joseph Kogut Chromium patches V3
In-Reply-To: <79083ca4-e4da-b86e-7531-213d3275ce1e@tidomat.se>
References: <mailman.2198.1528722821.16495.buildroot@busybox.net>
 <5936aa62-5aec-877f-7ad6-e39c991005a2@tidomat.se>
 <CAMWSM7jTQRr45PzSFv07i7VX7PDSbbSA-qoKoUqLgv4_W8niKQ@mail.gmail.com>
 <6e7f0b20-032c-9305-e6cd-f45843f721d6@tidomat.se>
 <CAMWSM7gdAYUkXpUTQVHD+pmEQQULcgtCxckG1f7uVCGzAz7KeQ@mail.gmail.com>
 <79083ca4-e4da-b86e-7531-213d3275ce1e@tidomat.se>
Message-ID: <CAMWSM7g_OFefLs7Nznmz+VfzY9vNKroZf7ez_BwWtgAx+PahBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sven,

On Tue, Jun 19, 2018 at 7:49 AM Sven Norinder <sven.norinder@tidomat.se> wrote:
<snip>
> Unfortunately enough, Chromium build still fails the same way for me.

Did you try a clean build with the V4 patch set and a reconfigure?
Your config built for me.

> I have tried building first on Ubuntu 16.04. Then I tried on an U14.04,
> that one failed already at compiling gn.

Output?

> Then I tried on an U18.04. Same problem with cups-config. As I see it it
> should have another argument telling
> it where script can be found. I will try to debug deeper.

The cups_config_helper.py script is actually present in the source
tarball, it appears the Python exception is raised because it attempts
to run cups_config, provided by the cups package, and the program is
unavailable to run.

The V4 patch set should've fixed this, are you sure you're using the
right patches?
