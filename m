From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Sat, 19 Nov 2016 15:04:03 +0100
Subject: [Buildroot] [PATCH v2 06/15] reproducibility/linux: inhibit
	build-id
In-Reply-To: <0274904d-a7d0-4ac1-dd28-73f920a77fa0@mind.be>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-7-git-send-email-jezz@sysmic.org>
 <0274904d-a7d0-4ac1-dd28-73f920a77fa0@mind.be>
Message-ID: <1479588390.8yanCXY4Bm@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 19 November 2016 10:31:51 Arnout Vandecappelle wrote:
> 
> On 18-11-16 10:10, J?r?me Pouiller wrote:
> > By default, Linux kernel enable 'build-id'. 'build-id' tends to add random
> > bytes in section .notes of kernel image[1]:
> 
>  Err, no, these are not random bytes, these are a sha1 of the content of the
> file. If the build ID changes, it means the content has changed.
> 
>  One common way that the build ID can differ while the output files don't differ
> is because of the source path that is recorded in the debug sections (which are
> stripped in the end). But I think that reproducible builds when the source path
> differs are very far away at this point...

Oh, you are right! I didn't understood why my build-id changes while all
sections was identical. In fact, in some circumstances, symbol order in
debug sections is not defined. I don't know yet exactly why nor how to
fix it.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
