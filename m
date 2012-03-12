From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 12 Mar 2012 19:03:22 +0100
Subject: [Buildroot] Added microblaze patch
In-Reply-To: <CAM+bi4spRA4CokbDkUPt-whT=35x8CqTKNxfT4EwV5Zk6Y3GCQ@mail.gmail.com>
References: <CA+appbNdaSajXPdKk4OTyj0WOmeu=9PKr-Sa=cwAZNr76ujLnA@mail.gmail.com>
 <1329095038-32117-1-git-send-email-Spenser309@gmail.com>
 <201202132237.18495.arnout@mind.be> <4F5CDB0F.50801@relinux.de>
 <CAM+bi4spRA4CokbDkUPt-whT=35x8CqTKNxfT4EwV5Zk6Y3GCQ@mail.gmail.com>
Message-ID: <4F5E3A6A.7010103@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 12.03.2012 11:58, schrieb Alvaro Gamez:
> Hi
>
> 2012/3/11 Stephan Hoffmann <sho at relinux.de <mailto:sho@relinux.de>>
>
>     Alvaro's Patch to load the toolchain from Xilinx does not work for me.
>     http://git.xilinx.com always ends up with a timeout leaving an empty
>     tgz-file in the dl folder after the third try. To come further I
>     downloaded the tgz manually.
>
>
> I don't see the reason for this. I've downloaded it several times with
> no problem. Maybe there has been some DNS issues or the server was
> down for a while?
I see, seems you are right. Now the download seems to work better. But
it loads a XML file. The URL wget tries to load is:

 
http://git.xilinx.com/?p=xldk/microblaze_v2.0_le.git;a=blob;hb=HEAD;f=/microblazeel-unknown-linux-gnu.tgz

This extra "/" in front of the filename seems to be the problem. In
fact, I don't know where it comes from;-(

When I use the version with the "h=d7..." it seems to work. possibly the
URL gets cut to:

 
http://git.xilinx.com/?p=xldk/microblaze_v2.0_le.git;a=blob;h=d7b493c5dbcc24ba9cc3be2e4c14d6d9701e6805

which is printed in the log.

In any case I have to add escape characters in front of the semicolons.
I'll send a patch fixing this.

Have a nice time

Stephan

>
>
> -- 
> ?lvaro G?mez Machado
>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120312/c3ddf4dc/attachment.html>
