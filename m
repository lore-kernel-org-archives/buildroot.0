From: Victor Hiairrassary <victor.hiairrassary.ml@gmail.com>
Date: Mon, 27 May 2013 15:01:55 +0200
Subject: [Buildroot] f2fs support
In-Reply-To: <20130526202433.GE3380@free.fr>
References: <51A287E9.2090308@gmail.com> <20130526202433.GE3380@free.fr>
Message-ID: <51A35943.4040703@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/26/2013 10:24 PM, Yann E. MORIN wrote:
> Yes, I encountered the same issue when I tried. Since I did not really
> need it, I skipped it.
>
> AFAIK, there is currently no way to generate f2fs images like we do for
> the other filesystems, like ext2, squashfs or jffs2.
>
> The only solution would be to use a post-image script that would
> basically do something like:
>
>    - dd if=/dev/zero of=image.f2fs bs=1M count=0 seek=${size_in_MiB}
>    - mkfs.f2fs image.f2fs
>    - sudo mount -o loop image.f2fs /somewhere
>    - cp foo bar /somewhere
>    - sudo umount /somewhere
>
> Otherwise, no idea, except do your own genf2fs util.
>
> Regards,
> Yann E. MORIN.
>

Oh :( This is a bad new, but thank you for your answer and your
example.

There is a mailing list for f2fs development at :
linux-f2fs-devel at lists.sourceforge.net.
Do you think it is a good idea to ask about that?

Regards,
Victor Hiairrassary
