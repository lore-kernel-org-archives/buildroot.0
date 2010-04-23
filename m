From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Apr 2010 13:27:02 +0200
Subject: [Buildroot] uclibc / glibc rfs issues
In-Reply-To: <i2l630286c71004230420g4d62616fj325361740ef7518c@mail.gmail.com>
	(Nataraj S. Narayan's message of "Fri, 23 Apr 2010 11:20:22 +0000")
References: <j2n630286c71004230401i8b185fd2jd5fa0a5465b577f@mail.gmail.com>
	<i2l630286c71004230420g4d62616fj325361740ef7518c@mail.gmail.com>
Message-ID: <87k4ry5rzt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nataraj" == Nataraj S Narayan <natarajsn@gmail.com> writes:

 Nataraj> Hi
 Nataraj> At the end of build getting this too:-

 Nataraj> echo "  /home/noy/buildroot/output/host/usr/sbin/mkfs.jffs2 -e 0x20000
 Nataraj> -l -s 0x800 -n -D target/generic/device_table.txt -d
 Nataraj> /home/noy/buildroot/output/target -o
 Nataraj> /home/noy/buildroot/output/images/rootfs.jffs2" >>
 Nataraj> /home/noy/buildroot/output/build/_fakeroot.fs
 Nataraj> chmod a+x /home/noy/buildroot/output/build/_fakeroot.fs
 Nataraj> /home/noy/buildroot/output/host/usr/bin/fakeroot --
 Nataraj> /home/noy/buildroot/output/build/_fakeroot.fs
 Nataraj> rootdir=/home/noy/buildroot/output/target
 Nataraj> table='target/generic/device_table.txt'
 Nataraj> makedevs: line 49: regular file
 Nataraj> '/home/noy/buildroot/output/target/usr/share/udhcpc/default.script'

Your device_table.txt refers to a file you don't have in your target
skeleton. What skeleton are you using, what is your .config?

-- 
Bye, Peter Korsgaard
