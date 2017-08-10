From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Aug 2017 11:18:45 +0200
Subject: [Buildroot] [PATCH v2 1/2] support/testing: allow to use a
 multiplier for timeouts
In-Reply-To: <20170805020520.4925-1-ricardo.martincoski@gmail.com>
References: <20170730044946.11999-2-ricardo.martincoski@gmail.com>
 <20170805020520.4925-1-ricardo.martincoski@gmail.com>
Message-ID: <6c6abb41-6053-d1ba-3743-f26071230b55@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-08-17 04:05, Ricardo Martincoski wrote:
> Add a parameter to run-tests to act as a multiplier for all timeouts of
> emulator.
> It can be used to avoid sporadic failures on slow host machines as well
> in elastic runners on the cloud.
> 
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

[snip]
> -    def __init__(self, builddir, downloaddir, logtofile):
> +    def __init__(self, builddir, downloaddir, logtofile, multiplier):

 For consistency, it would be better to use timeout_multiplier here as well.
I've fixed that up and applied both to master, thanks.

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
