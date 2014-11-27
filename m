From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Nov 2014 07:41:53 -0300
Subject: [Buildroot] [PATCH RFC] Makefile: from a defconfig file,
 point to the corresponding board/ entry
In-Reply-To: <CAAXf6LU7cF0+R=7T6RE4M3efW52a1v+JyqkjgOEJ3ZXsV+dm8g@mail.gmail.com>
References: <1417043635-9055-1-git-send-email-yann.morin.1998@free.fr>
 <CAAXf6LU7cF0+R=7T6RE4M3efW52a1v+JyqkjgOEJ3ZXsV+dm8g@mail.gmail.com>
Message-ID: <5476FFF1.8090304@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/27/2014 07:37 AM, Thomas De Schampheleire wrote:

>> So, we could maybe improve this by renaming and moving our boards docs
>> so there is a one-to-one mapping from the board directory to the
>> corresponding defconfig file (but not necessarily the other way around).
> 
> 
> I would like to point out that automatically detecting the board
> directory is fragile, because
> - the mapping may not be obvious, as you already found
> - there may be more than one 'board' directory. For example, a typical
> setup when having multiple more-or-less-related projects in a company
> is to have several layers of post-build/rootfs-overlay/..., for
> example:
> board/company/common/...
> board/company/project1/...
> board/company/project2/...
> In the defconfigs of both project1 and project2, the post-build and
> rootfs-overlay settings would contain multiple entries, being
> common+project1 and common+project2 respectively.
> There may even be more levels than that, for example (in my case)
> common, architecture-specific, project-family-specific,
> board-specific.

Agreed.
Wouldn't it be easier to define something like
BR2_POST_BUILD_INSTRUCTIONS (with some nicer well-thought out name)
that's shown when a successful build finishes which points to the proper
documentation and does nothing if unset? (a good old conditional 'cat').
Regards.
