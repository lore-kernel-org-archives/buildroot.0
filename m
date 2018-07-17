From: Tudor Holton <tudor@smartguide.com.au>
Date: Tue, 17 Jul 2018 13:53:29 +1000
Subject: [Buildroot] How to bypass fix-rpath for a particular package?
Message-ID: <b0387d1c-8e63-c118-f243-63920b9560b7@smartguide.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have a br_external package that always lands corrupt on the image and 
segfaults. I tried a number of things and eventually discovered that it 
works fine if I graft the output from build directly into the final 
image.? From this I narrowed it down to something that happens during 
fix-rpath, which looks simple, but all my checks show that I'm not 
linking with anything other than -rpath=$ORIGIN so I'm at a loss as to 
the root cause.

This may not be the best solution, but is there a standard way to tell 
fix-rpath not to patchelf my package and just copy it verbatim to the image?

Cheers,
Tudor.
