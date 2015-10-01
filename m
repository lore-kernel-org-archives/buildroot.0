From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 1 Oct 2015 11:36:12 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <87k2rrvqlh.fsf@dell.be.48ers.dk>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be> <55F02630.5050500@lucaceresoli.net>
 <20150909155427.53f9c8b5@free-electrons.com>
 <87bnd43eph.fsf@dell.be.48ers.dk>
 <20150914233402.3575da80@free-electrons.com>
 <87zj0oznp2.fsf@dell.be.48ers.dk>
 <20150915093030.622d2366@free-electrons.com>
 <87zj0oumrg.fsf@dell.be.48ers.dk>
 <20150915114159.758baca9@free-electrons.com>
 <87k2rrvqlh.fsf@dell.be.48ers.dk>
Message-ID: <560CFE8C.7010808@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

Peter Korsgaard wrote:
[...]
>   >> Take a look at 2b2af54a5bb6f7e80ccf78f20084b93c398c3a8b in the
>   >> kernel. To me it looks quite self contained, so backporting it to
>   >> something close to 2.6.32 doesn't look too bad.
>
>   > Indeed. I wonder how many dependencies on other patches it has, though.
>   > Luca, can you give it a try and see if it would work for you?
>
>  From a quick look (depending on how old the kernel is) I think it is
> basically just device_get_nodename():
>
> commit 6fcf53acccf85b4b0d0260e66c692a341760f464
> Author: Kay Sievers <kay.sievers@vrfy.org>
> Date:   Thu Apr 30 15:23:42 2009 +0200
>
>      Driver Core: add nodename callbacks
>
>      This adds the nodename callback for struct class, struct device_type and
>      struct device, to allow drivers to send userspace hints on the device
>      name and subdirectory that should be used for it.
>
>      Signed-off-by: Kay Sievers <kay.sievers@vrfy.org>
>      Signed-off-by: Jan Blunck <jblunck@suse.de>
>      Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

Wow, it works! Well, at least it boots, I haven't tested everything,
but it was far simpler that I suspected. Thanks for the hint!

-- 
Luca
