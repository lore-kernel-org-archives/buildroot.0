From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Nov 2018 11:18:27 +0100
Subject: [Buildroot] buildroot error: No hash found for gcc-7.3.0.tar.xz
In-Reply-To: <6322632.7631b.167337b2f9d.Coremail.lixuejun@vip.163.com>
References: <2776276a.afc0d.167306f454d.Coremail.lixuejun@vip.163.com>
 <05e7b91c-7801-8985-8a83-38d53193aa84@mind.be>
 <6322632.7631b.167337b2f9d.Coremail.lixuejun@vip.163.com>
Message-ID: <4a43fe84-a4e2-cb16-f321-870075f07213@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Please keep the mailing list in Cc, others may benefit from your solution and
other people may be able to respond more quickly than me.

On 21/11/2018 00:36, ??? wrote:
>>> There is a file ?gcc.hash??at path /home/lxj/buildroot-2018.08.2/package/gcc,
>>
>> There should be a symlink from package/gcc/gcc-initial/gcc-initial.hash to this
>>file. Is that symlink present, and is it pointing to the correct file?
>>
> 
> The symlink file is present, and the content of the file is:
> ../gcc.hash
> The following is a copy of the file's infomation:
> root at lxj-VirtualBox:/home/lxj/buildroot-2018.08.2/package/gcc# cd gcc-initial
> root at lxj-VirtualBox:/home/lxj/buildroot-2018.08.2/package/gcc/gcc-initial# ls -ltotal 8
> -rwxrwxrwx 1 root root   11 10? 25 20:40 gcc-initial.hash
> -rwxrwxrwx 1 root root 2083 10? 25 20:40 gcc-initial.mk
> root at lxj-VirtualBox:/home/lxj/buildroot-2018.08.2/package/gcc/gcc-initial# cat gcc-initial.hash
> ../gcc.hashroot at lxj-VirtualBox:/home/lxj/buildroot-2018.08.2/package/gcc/gcc-initial# 
> Thanks.

 So that's not a symlink... I guess you're using some filesystem that doesn't
support symlinks, or doesn't have proper support for symlinks in your kernel.
Virtualbox shared folder maybe?

 That will not work. You need to extract the tarball on a filesystem that
supports symlinks.

 Regards,
 Arnout
