From: Steve Calfee <stevecalfee@gmail.com>
Date: Fri, 30 Nov 2012 13:46:53 -0800
Subject: [Buildroot] [PATCH] [PATCH][RFC] new target: live filesystem
In-Reply-To: <50B8792F.7040000@mind.be>
References: <1354003953-10875-1-git-send-email-jeremy.rosen@openwide.fr>
 <CAJJ6jxv6w=wq7taFt4rxXfSmjY7Vkd+m06_U+A9fz4z1eyFM_w@mail.gmail.com>
 <50B8792F.7040000@mind.be>
Message-ID: <CAJJ6jxvVkLmLmMiC+3bKEqokBUd1-LrJ8nJywzYmtVYxbXsSNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 30, 2012 at 1:15 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 30/11/12 01:04, Steve Calfee wrote:
>>
>> I don't understand why you need this. It is a one line "sudo tar -xf
>> ..." to unpack the tarball into your nfs directory. Either type this
>> line or add a one line script to your ~/bin directory to do it for
>> each of your buildroot trees/environments. Don't add clutter to the
>> buildroot makefile.
>
>
>  If that is the reasoning, we can also remove the compression of the
> .tar file, or the -dirclean targets, etc. etc.
>
>  In addition, this target also cleans up the NFS directory first, so
> it's slightly more than just untarring.
>
Hi  Arnout,

I guess, but buildroot is all about building, not deploying. What is
next, an automatic copy to my usb or sd drive? Stuff that is highly
user specific should not be in the makefile, especially stuff that can
easily be added to a simple script - my opinion only,

Steve
