From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Sat, 11 Feb 2012 01:36:04 +0200
Subject: [Buildroot] ccache issue with zlib dependency
Message-ID: <CAMP44s3eoG9jOoG7Gv_CvyKtG5dPbf+mP-_S7=cB-1LcJBM2hQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have a newer version of zlib (1.2.6) on my host system than what
buildroot is using (1.2.5), ultimately the build fails because I have
enabled ccache, and it uses zlib, and when the older zlib is installed
there are missing symbols (ZLIB_1.2.5.2), so ccache doesn't work any
more, and everything else fails.

I tried to add the zlib dependency to ccache, but the build also fails
because apparently host-zlib tries to use ccache.

This is a bit of a chicken and egg problem and I'm not sure how to fix it.

Any ideas?

Cheers.

-- 
Felipe Contreras
