From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 5 Sep 2015 14:41:22 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-09-04
In-Reply-To: <20150905063017.01FAA10139B@stock.ovh.net>
References: <20150905063017.01FAA10139B@stock.ovh.net>
Message-ID: <55EAF102.6030807@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni, Francois Perrad, all,


On 05/09/15 07:30, Thomas Petazzoni wrote:
> Build statistics for 2015-09-04

>        mipsel |          perl-html-parser-3.71 | NOK | http://autobuild.buildroot.net/results/128671dfa23d843698a63220c2fac1f44e1d5845/

does it make sense building perl modules statically? They are intended 
to be loaded by the dynamic loader, so..., should we disable all perl 
modules for static builds? Francois?

>      mips64el | xdriver_xf86-video-r128-6.1... | NOK | http://autobuild.buildroot.net/results/34fbb7434d94b32de82f7094facbe57abef2573f/

This looks weird...

r128_dri.c:61:26: fatal error: GL/glxtokens.h: No such file or directory

... because that file should be provided by xproto_glproto which is 
already installed according to the build-time.log. I'll investigate it.

Regards,

Vincent.
