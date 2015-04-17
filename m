From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 17 Apr 2015 18:54:00 -0400
Subject: [Buildroot] Downloading patches with the same filename
Message-ID: <CA+-urNR=d0=dY2JW+KgHsFajeQB+Lh=0oVRFrsUeZyU0w3_2Gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm running into a situation where two patch files have the same
filename, but are intended for different packages. As you would
expect, the first package builds fine. The second package goes to
download the patch, but sees that it already exists in the dl
directory. Applying this patch to the second package obviously fails.

For kicks, I tried appending a URL fragment to the patch URL (e.g.,
#package1 and #package2), but that was stripped off.

Has this situation come up before and are there any workarounds? I am
running into it with the Intel Edison where the naming convention for
every patch from Intel seems to be "upstream_to_edison.patch".

Thanks,
Frank
