From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 08 Jan 2015 14:34:38 -0300
Subject: [Buildroot] [PATCH] squid: fix automake breakage
In-Reply-To: <20150108092820.09875bec@free-electrons.com>
References: <1420679367-24134-1-git-send-email-gustavo@zacarias.com.ar>
 <20150108092820.09875bec@free-electrons.com>
Message-ID: <54AEBFAE.2020706@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/08/2015 05:28 AM, Thomas Petazzoni wrote:

> We seem to have the same problem with host-guile:
> http://autobuild.buildroot.org/results/634/634e342f7f384fc6eba11872aa2d680c0d8dc98a/build-end.log.
> So I'm not sure a package-specific solution is appropriate here, no?

For guile the problem is different, it's the fact that we're patching
configure.ac without enabling AUTORECONF, hence autoreconf is triggered
internally and breaks.
For squid it seems related to the bundled libltdl (libtool). I've
already tried to unbundle it without much success, seems to be pretty
tied up.
I've sent a patch to fix guile.
Regards.
