From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 04 Jul 2014 21:25:19 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bump to version 214
In-Reply-To: <20140703132119.014619c0@free-electrons.com>
References: <1404070537-14255-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140703132119.014619c0@free-electrons.com>
Message-ID: <53B6FF9F.9020107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/07/14 13:21, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
> 
> On Sun, 29 Jun 2014 21:35:37 +0200, Eric Le Bihan wrote:
> 
>> +SYSTEMD_CONF_ENV = \
>> +	ac_cv_path_KMOD=/usr/bin/kmod
> 
> I just got a report from "nroach44" on IRC (Cc'ed to this e-mail) that
> this chunk is actually also needed with systemd 213. From the IRC
> discussions:
> 
> 13:16 < NRoach44> kmod is being put in /usr/bin
> 13:17 < NRoach44> when systemd trys to run it from /bin
> 13:18 < kos_tom> with which version of systemd are you seeing this kmod issue?
> 13:18 < NRoach44> 213
> 
> So I obviously pointed "nroach44" to your 214 systemd bump patch, but I
> believe that since the kmod issue exists with systemd 213, the chunk
> above should probably be part of a separate patch.

 This is probably a symptom of systemd moving to the everything-in-/usr
filesystem layout [1]. So we can expect more of that in the future.

 This everything-in-/usr actually doesn't sound like a bad idea. TLDR: move
everything in /bin and /lib to /usr/bin and /usr/lib, and make symlinks /bin ->
/usr/bin etc. Would be really trivial for us to implement.


 Regards,
 Arnout


[1] http://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge/


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
