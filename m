From: Anders Darander <anders.darander@gmail.com>
Date: Thu, 2 Sep 2010 14:12:41 +0200
Subject: [Buildroot] hwclock again
In-Reply-To: <29603393.post@talk.nabble.com>
References: <29603222.post@talk.nabble.com>
	<AANLkTim5AseSa3e9zxb-7EfyLkNhfkDQNm0vX9GHqnHD@mail.gmail.com>
	<29603393.post@talk.nabble.com>
Message-ID: <AANLkTikk6rvHjGtiaxkDD7+CAJPn8e1sV+sxW7GniC9W@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Sep 2, 2010 at 13:50, JNY <jny0@hotmail.com> wrote:
>
> just to check...
> Do you have such a device (/dev/misc/rtc) in the target file system?
>
> Regards,
> Anders
>
> -------------------
>
> I have two targets target_skeleton, and target_busybox_skeleton (both
> contained in target/generic), neither of which contain /dev/misc/rtc.
> However, neither contain ttyS0, and that ends up on the system when it's
> loaded, and works. ?What's going on?

Well, I meant the target file system being generated, not the actual
skeletons... Either loopback mount the generated file system, generate
tar:ed file system, or look directly at your target.

You'll also have a file, device_table.txt, that, among other things,
specifies device nodes to be generated. You'll most certainly find
ttyS0 being generated from this file.

Regards,
Anders
