From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Mar 2015 23:48:51 +0100
Subject: [Buildroot] [RFC v3 00/30] Add per-package staging feature
In-Reply-To: <20150303142901.5998a72c@free-electrons.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <20150303142901.5998a72c@free-electrons.com>
Message-ID: <54F8DD53.3060000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/03/15 14:29, Thomas Petazzoni wrote:
> Dear Fabio Porcedda,
> 
> On Tue,  3 Mar 2015 10:17:05 +0100, Fabio Porcedda wrote:
> 
>> > this patch set aims to improve build reproducibility by using a
>> > per-package staging directory.
>> > Also this feature aims to enable as default the top-level parallel make.
> Interesting! I must say I'm a bit worried about the implications of
> having to pass custom -I and -L flags all the time: we did arrange the
> compiler do not require those (by configuration for the internal
> toolchain case, and using the wrapper for the external toolchain case).

 I also like this feature very much!

 However, I don't like at all the approach of passing the custom -I and -L
flags. I think it's much better to start with something that was suggested
before in the BR developer meeting: use the toolchain wrapper also for the
internal toolchain. Then we can pass the per-package staging dir through the
environment, and use it in the --sysroot argument of the compiler.

 We'll also have to do something about ccache then - that could be a problem.
Perhaps ccache should be called from within the wrapper as well, that may solve
a bunch of other ccache problems.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
