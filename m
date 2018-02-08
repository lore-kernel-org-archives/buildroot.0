From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 8 Feb 2018 18:11:22 +0100
Subject: [Buildroot] [PATCH 1/1] Bumping liblo from 0.26 to 0.29. C++
 wrappers for this lib started appearing in 0.28 so I think this is valid.
In-Reply-To: <CA+bRTvDcf+FuGZunyw5-fNKCXVRtJeswA7_9BgyzeqnYvzc5CA@mail.gmail.com>
References: <1518098606-2865-1-git-send-email-alexbaldwinmusic@gmail.com>
 <4d63d250-e077-a04c-76c6-dbbbb170a9cc@mind.be>
 <CA+bRTvDcf+FuGZunyw5-fNKCXVRtJeswA7_9BgyzeqnYvzc5CA@mail.gmail.com>
Message-ID: <6fadd62d-c2ba-f59c-3543-48f661087ffd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Alex,

 [Please avoid top-posting, instead reply in-line like I do below.]

On 08-02-18 18:00, Alex Baldwin wrote:
> Thanks for the corrections Arnout, I will go about ammeding them for the next
> patch submission.

 Thanks!

> 
> As to :
> 
> LIBLO_CONF_OPTS += --disable-ipv6
> 
> I am doubtfull if this will work (i will try anyway!), there only seems to be an
> option to enable ipv6. 

 It should work. autoconf will interpret the --enable- and --disable- options
and will set $enableval to "yes" or "no" depending on what is given. In fact,
--disable-ipv6 is equivalent to --enable-ipv6=no (but in Buildroot we have the
convention to use --disable- options, not --enable-=no). So, by passing
--disable-ipv6, $enableval will be set to "no", so $want_ipv6 is "no", so
ENABLE_IPV6 will not be defined.


> If this --enable-ipv6 is not provided then liblo assumes
> you do not want it. Is there a way to remove options for a specific package?

 Nope, but autoconf allows to override all options you give to it with a later
option, and that's what we do here.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
