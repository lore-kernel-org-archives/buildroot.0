From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 May 2013 22:51:46 +0200
Subject: [Buildroot] [PATCH v2] package-infra: limit the number of //
	jobs
In-Reply-To: <1368194161-27851-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 10 May 2013 15:56:01 +0200")
References: <1368194161-27851-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87vc6pz1ct.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>

 Yann> The current code spawns as many jobs as up to twice the number of
 Yann> CPUs.

 Yann> On small-class machines like laptops, with a limitted amount of
 Yann> memory, but still a few CPUs (real or hyperthreads), the HDD
 Yann> becomes a bottleneck, and it becomes almost impossible to do
 Yann> anythiong else while there is a build in progress.

 Yann> Limit the number of jobs to the number of CPUs plus one.

 Yann> Even on fast machines with fast HDDs, this settings keeps the
 Yann> machine fully busy (for those packages that can build in
 Yann> parallel, of course).

 Yann> For example, building qemu or the linux kernel kept my
 Yann> hyperthreaded hexa Core i7 with 18GiB of RAM, busy at 99% (I
 Yann> never ever managed to get 100% even with more jobs, not even
 Yann> 200); while on my hyperthreaded dual Core i5 with only 4GiB and a
 Yann> slow HDD, I still topped at 100% CPU, while still able to do some
 Yann> work involving the HDD.

Yes, I remember the old default being pretty hard on my old laptop with
spinning rust. With a SSD I don't really notice it much.

Committed, thanks.

-- 
Bye, Peter Korsgaard
