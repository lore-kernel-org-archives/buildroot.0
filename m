From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 9 Nov 2018 21:13:25 +0100
Subject: [Buildroot] [PATCH 1/3] fs: apply permissions late
In-Reply-To: <762db85d-d4a9-95b5-8280-d46dfd5f2a72@mind.be>
References: <cover.1540626349.git.yann.morin.1998@free.fr>
 <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
 <762db85d-d4a9-95b5-8280-d46dfd5f2a72@mind.be>
Message-ID: <06c9bba5-3d39-5f92-6c0c-c0c6b4dd9c50@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 08/11/2018 00:43, Arnout Vandecappelle wrote:
>  I *think* the real problem is that fakeroot forgets to wrap the setxattrat and
> lsetxattrat syscalls, and these are the ones that are used by tar.

?So this was a stupid mistake - there is no setxattrat syscall, it's a function
that is defined by tar itself.

?Peter's analysis looks a lot more accurate.


?Regards,
?Arnout
