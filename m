From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 13 Mar 2018 06:06:40 -0400
Subject: [Buildroot] Start denying fuzz in patches?
Message-ID: <CAFSsvmo-Esz6zXC-qpMJ9Uww=sEbV75Uw7kNNLumWxk83A1kKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch tool will apply patches by default with "fuzz," which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch to be applied anyways.

While this is useful when there are just whitespace changes, when applied to
actual source code, it is possible for a patch applied with fuzz to produce
broken code which still compiles.

I propose that Buildroot take the initiative to start cleaning up the current
patches, and in the future start denying updates/new packages with patches that
apply with fuzz.

Comments would be much appreciated!

Adam
