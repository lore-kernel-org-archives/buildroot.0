From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 May 2012 00:22:51 +0200
Subject: [Buildroot] Building 2 root filesystems with Buildroot
In-Reply-To: <4FA7DF83.7030003@gmail.com> (Chung Li Jing's message of "Mon, 07
 May 2012 22:43:15 +0800")
References: <4FA7DF83.7030003@gmail.com>
Message-ID: <87sjeyo3b8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chung" == Chung Li Jing <lijing.chung@gmail.com> writes:

Hi,

Please ask buildroot questions on the buildroot list instead of mailing
me directly.

 Chung> Hello,
 Chung> I am trying to get Buildroot to build 2 filesystems; a smaller one
 Chung> with the system files and essentials, and a larger one to hold the big
 Chung> packages (i.e. Qt).

 Chung> The idea is that the kernel will boot up using the smaller one, then
 Chung> mount the larger one during the final stages of initialization. And
 Chung> the two filesystems, or partitions, may be of different filesystem
 Chung> type (i.e. one is yaffs, while the other is ext3).

 Chung> What is the most elegant way to do this in Buildroot?

 Chung> To my knowledge, Buildroot is hardwired to create a system with
 Chung> only one filesystem partition, so some customization is
 Chung> evitable. But I just wonder if you have any suggestions.

Buildroot indeed only handles a single filesystem, so I think the
easiest is to just build a single big filesystem with buildroot (E.G. a
tarball), and then write a small script to split it up into two
filesystems afterwards.

-- 
Bye, Peter Korsgaard
