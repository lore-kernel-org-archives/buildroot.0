From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 23:32:55 +0200
Subject: [Buildroot] [PATCH v2 1/1] flex: Fix segfault of stage1flex
 when host has glibc 2.26 or newer
In-Reply-To: <20170913143524.24293-1-aperez@igalia.com>
References: <20170913143524.24293-1-aperez@igalia.com>
Message-ID: <dcd0238b-db2b-efff-08a1-183e60b7c742@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-17 16:35, Adrian Perez de Castro wrote:
> When the host uses glibc 2.26 or newer, Flex will try to use the
> newly-introduced reallocarray() function, but as it would not define
> _GNU_SOURCE a segmentation fault would occur later on due to the
> compiler assumming that the function is implicitly defined.
> 
> This issue manifests itself due to a crash of "stage1flex" during the
> Flex bootstrap:
> 
>   ./stage1flex   -o stage1scan.c ./scan.l
>   make[2]: *** [Makefile:1725: stage1scan.c] Segmentation fault (core dumped)
> 
> This imports the patch from the upstream Git repository, and adds flags
> in the .mk file to rebuild the Autotools scripts and support files. Due
> to the latter, the patch to disable the documentation is changed so it
> modifies the .am file instead.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

 Applied to master, thanks.

 I did make a few changes though:

     - Add Adrian's Sob and upstream ref to new patch;
     - Keep patch 1 as patch 1;
     - Keep Vicente as author of path 1;
     - Add reason for autoreconf in a comment.

 I didn't follow Joerg's suggestion to separate into two patches, though it was
actually a good suggestion. I was just too lazy :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
