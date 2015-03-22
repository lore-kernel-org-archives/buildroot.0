From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 16:29:58 +0100
Subject: [Buildroot] [PATCH 4/7] pkg-generic: refactor the "Downloading"
 message logic
In-Reply-To: <1425147313-17380-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425147313-17380-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425147313-17380-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <550EDFF6.2050600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/02/15 19:15, Thomas Petazzoni wrote:
> In the .stamp_downloaded hook, the logic to decide whether or not to
> display the "Downloading" message is treating the check of
> <pkg>_SOURCE as a special case. But in fact, there is no real reason
> to do so: the existing loop used for <pkg>_PATCH and
> <pkg>_EXTRA_DOWNLOADS could work just as well.
> 
> This commit therefore refactors this piece of code, to have a single
> loop checking <pkg>_SOURCE, <pkg>_PATCH and <pkg>_EXTRA_DOWNLOADS.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I'm a bit worried though about URLs with special characters. But since things
weren't quoted before, they were already broken anyway...

 I also thought that maybe it could be done in pure make syntax, but then it
becomes horribly complicated.

 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
