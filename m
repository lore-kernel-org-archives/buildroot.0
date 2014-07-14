From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Jul 2014 18:30:27 +0200
Subject: [Buildroot] [PATCH 2/3] infra: add gettextize run in AUTORECONF
In-Reply-To: <20140714130104.480ab4cf@free-electrons.com>
References: <1405186024-8170-1-git-send-email-gustavo@zacarias.com.ar>
 <1405186024-8170-2-git-send-email-gustavo@zacarias.com.ar>
 <20140714130104.480ab4cf@free-electrons.com>
Message-ID: <53C405A3.3080301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/07/14 13:01, Thomas Petazzoni wrote:
> Dear Gustavo Zacarias,
> 
> On Sat, 12 Jul 2014 14:27:03 -0300, Gustavo Zacarias wrote:
> 
>> It adds some extra build time when doing autoreconf passes but the alternative
>> would require a new GETTEXTIZE option and package audit which could take some
>> time to get resolved.
> 
> I believe I would actually prefer a separate GETTEXTIZE option, I'm a
> little bit worried about the extra build time. What do others think?

 I agree with Gustavo that the extra 2 seconds of gettextize are anyway dwarfed
by the 15 seconds for autoreconf (on my I/O-bound laptop). So I wouldn't bother
with an extra option.

 My worry is more that gettextize could fail, like autoreconf sometimes does.
Though I think the risk is lower for gettextize.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
