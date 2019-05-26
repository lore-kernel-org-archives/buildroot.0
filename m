From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 May 2019 15:05:38 +0200
Subject: [Buildroot] buildroot | Pipeline #63198634 has failed for next
 | b7f09c3e
In-Reply-To: <5cea885526fef_201a3f97159c0fe021894f@sidekiq-asap-05-sv-gprd.mail>
References: <5cea885526fef_201a3f97159c0fe021894f@sidekiq-asap-05-sv-gprd.mail>
Message-ID: <2d968d8c-2eb4-0065-2738-0105a7ac5ea0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Sebastien, Ricardo,

 Check-package fails on next:

On 26/05/2019 14:36, GitLab wrote:
[snip]
> 	check-package <https://gitlab.com/buildroot.org/buildroot/-/jobs/219464644>
> 
> 0 warnings generated
> 35697 lines processed
> 0 warnings generated
> linux/linux-ext-xenomai.mk:15: possible typo: LINUX_EXTRA_DOWNLOADS -> *XENOMAI*
> 45438 lines processed
> 1 warnings generated

 This can be fixed either by adding LINUX_EXTRA_DOWNLOADS to the ALLOWED list,
or by adding an exclusion comment.

 I'm kind of leaning towards an exclusion comment. Those didn't exist yet when
the ALLOWED list was created, I think. It seems more appropriate to make
explicit exceptions for the rarely used cases.

 Regards,
 Arnout
