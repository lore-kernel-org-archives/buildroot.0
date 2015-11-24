From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Nov 2015 00:00:54 +0100
Subject: [Buildroot] [PATCH] qt5base: support OVERRIDE_SRCDIR
In-Reply-To: <20151124224053.GC3904@free.fr>
References: <1448400109-32767-1-git-send-email-peter@korsgaard.com>
 <20151124224053.GC3904@free.fr>
Message-ID: <5654EC26.8070401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24-11-15 23:40, Yann E. MORIN wrote:
> Peter, All,
> 
> On 2015-11-24 22:21 +0100, Peter Korsgaard spake thusly:
>> With OVERRIDE_SRCDIR we don't apply any of the qt5base patches, but the
>> custom specs files are needed to be able to build - So install these in the
>> configure step instead of having them as a patch.
> 
> IMHO, it make more sense to install them at post-patch (or post-extract)
> rather than at the beginning of the configure step.

 But that wouldn't solve the issue, that it is not applied for OVERRIDE_SRCDIR.
With OVERRIDE_SRCDIR, no extract or patch step is done, instead the rsync step
is done.

 We could add it in a POST_PATCH _and_ a POST_RSYNC hook, however.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
