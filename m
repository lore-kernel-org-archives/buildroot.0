From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 28 Jun 2010 00:39:58 +0000 (UTC)
Subject: [Buildroot] [git commit master 1/1] initramfs: update help text
References: <20100626054529.9E7CE81E0B@busybox.osuosl.org>
	<i052d8$8up$1@dough.gmane.org> <87aaqh38vi.fsf@macbook.be.48ers.dk>
	<i06hjh$fj$2@dough.gmane.org> <87hbkp3sfz.fsf@macbook.be.48ers.dk>
	<i07kg9$jsp$1@dough.gmane.org> <20100627205714.507b5439@surf>
Message-ID: <i08r0u$vue$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-06-27, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> On Sun, 27 Jun 2010 13:42:34 +0000 (UTC)
> Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
>> > No, but you could extract the tarball (as root or using fakeroot) and
>> > point CONFIG_INITRAMFS_SOURCE to it.
>> 
>> An extracted tarball isn't one of the options either.
>> CONFIG_INITRAMFS_SOURCE can be pointed at either a cpio archive or the
>> source file list.
>
> Or a directory containing the hierarchy of files/directories to include
> in the initramfs.

You're right.  I'd mis-read the help for the initramfs option.

Doesn't that means you have to do one step of the build as root?

I don't think I that's a viable option.

>> > But yes, providing a way to generate the cpio archive without building a
>> > kernel would be nicer.
>> 
>> It works fine the way it is.  What's the reason for disabling the
>> buildign of a cpio file source list?
>
> It was to fix bug #2119.

I currently build with the initramfs option without having to build a
kernel. Isn't there some way to fix bug 2119 without breaking a use
case for existing users?

-- 
Grant
