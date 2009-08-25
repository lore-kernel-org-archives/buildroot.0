From: Bai Shuwei <baishuwei@gmail.com>
Date: Tue, 25 Aug 2009 11:55:29 +0800
Subject: [Buildroot] [Qemu-devel] diskimage HOWTO
In-Reply-To: <f284c33d0908241004g3eb4608dga6acc979d0547c6a@mail.gmail.com>
References: <f3566d60908232239l268a7233necd10a6dd342f58f@mail.gmail.com>
	<4A9245EA.9030108@redhat.com>
	<f284c33d0908241004g3eb4608dga6acc979d0547c6a@mail.gmail.com>
Message-ID: <f3566d60908242055g58ce12fcw153ebee386bcc007@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 8/25/09, Mulyadi Santosa <mulyadi.santosa@gmail.com> wrote:
>
> On Mon, Aug 24, 2009 at 2:48 PM, Kevin Wolf<kwolf@redhat.com> wrote:
> > Bai Shuwei schrieb:
> >> Hi, All:
> >>   I want to build a test enviroment with QEMU and buildroot. But I don't
> >> know how to build the diskimage which same as linux-0.2.img offered by
> >> BUILD-ROOT. I build the diskimage following the
> >>    buildroot-2009.05/docs/README.diskimage
> >> <
> http://192.168.1.102/crosscopile/buildroot-2009.05/docs/README.diskimage>,
> >> but failure.
> >>
> >>    The bellow is my process.
> >>
> >>    # dd if=/dev/zero of=img bs=4096 count=16384
> >>    # echo -e "n\np\n1\n\nw\n" | fdisk -C 16065 -H 255 -S 63 ./img
> >>    # losetup -o 512 /dev/loop0 img
> >
> > This looks like the wrong offset. The first partition usually starts at
> > sector 63.
>
> I agree, perhaps Bai should instead use 32256.
>
> From "man losetup":
> -o, --offset offset
>              The  data start is moved offset bytes into the specified file
> or
>              device
>
> So it has to be converted into bytes.
>
> Bai, that could be the answer. Please kindly try it.


Hi, all!
   Thanks!
   Yes, It's work now. I try 32256!

--
> regards,
>
> Mulyadi Santosa
> Freelance Linux trainer
> blog: the-hydra.blogspot.com
>



-- 
Love other people, as same as love yourself!
Don't think all the time, do it by your hands!

Personal URL: http://dslab.lzu.edu.cn:8080/members/baishw/
E-Mail: baishuwei at gmail.com or baishuwei at dslab.lzu.edu.cn
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090825/36c929a7/attachment.htm>
