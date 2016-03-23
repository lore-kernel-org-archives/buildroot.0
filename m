From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 23 Mar 2016 10:13:39 -0700
Subject: [Buildroot] [fstab] The best way to modify the /etc/fstab
In-Reply-To: <CALtfCQZZJwRff1hWmA1vLf+EbHgFXsBGSvKwsNJ8wxdF+h-KWQ@mail.gmail.com>
References: <CALtfCQZZJwRff1hWmA1vLf+EbHgFXsBGSvKwsNJ8wxdF+h-KWQ@mail.gmail.com>
Message-ID: <CAJJ6jxs5=uB1OSs8P+LGFfCk2VBhFLCFZo-MShaY29PNeOZh9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Oscar,


On Wed, Mar 23, 2016 at 9:48 AM, ?scar G?mez Fuente
<oscargomezf@gmail.com> wrote:
> Hi,
>
> I'm building a system from buildroot and I would like to know the best way
> to add this line:
>
> /dev/mmcblk0p1  /boot           vfat    defaults        0       2
>
> to the file /etc/fstab.
>
> Up to now ,I've executed a script, after the make is completed, with this
> command:
>
> sudo sh -c "cat << 'EOF' >> "${SD_ROOTFS_PATH}/etc/fstab"
> /dev/mmcblk0p1  /boot           vfat    defaults        0       2
>
> EOF"
>
> But I'm trying to find something more professional. I'm pretty sure that
> buildroot has a mechanism for this purpose.
>
See https://buildroot.org/downloads/manual/manual.html#rootfs-custom
where you have two choices, a script doing what you want or a way to
put a custom fstab in an overlay skeleton.

Regards, Steve
