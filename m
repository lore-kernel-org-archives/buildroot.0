From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Thu, 25 Feb 2016 18:00:37 -0300
Subject: [Buildroot] [PATCH v2 0/4] Add file capability/xattr support
In-Reply-To: <20160225215003.5886d69d@free-electrons.com>
References: <1456323992-27845-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <20160225215003.5886d69d@free-electrons.com>
Message-ID: <56CF6B75.10604@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/02/16 17:50, Thomas Petazzoni wrote:

> So, if you think that specifying the capabilities or extended
> attributes should be done via a separate data file, then it means we
> will have a new option to specify this data file, and we could
> therefore only bring the additional host-fakeroot dependencies only
> when this option is enabled, no?

Hi.
This is a RFC mostly since it's not complete, although it can be 
commited as-is it's not usable directly without tweaking the fakeroot 
script (which isn't exposed functionality at the moment).
We can extend makedevs syntax/tool, but i believe it will be terribly 
messy for scenarios where multiple XATTRs are desired, more so if we 
eventually add ACL support to this.

>> Also not all target filesystems support extended attributes.
>
> And possibly the above option should be made visible only when the
> underlying filesystem supports extended attributes.
>
> What do you think?
>
> Thomas

Well, i was hoping for feedback, let's see other opinions.
Enabling capabilities/xattrs/acls might be an option in target 
filesystem where people can then add the respective file(s) describing 
them, hence making it optional. If it were in makedevs it could be an 
option as well but would pollute things quite a bit.
Might be worth adding tar acl/xattr support as well, rigth now squashfs 
and maybe ubifs are the only filesystem targets enabled for this.

Regards.
