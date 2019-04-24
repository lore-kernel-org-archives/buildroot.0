From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 17:30:01 +0200
Subject: [Buildroot] [PATCH 1/3] package/linux-tools: some selftests
 needs util-linux schedutils
In-Reply-To: <20190408164333.26942-2-romain.naour@smile.fr> (Romain Naour's
 message of "Mon, 8 Apr 2019 18:43:31 +0200")
References: <20190408164333.26942-1-romain.naour@smile.fr>
 <20190408164333.26942-2-romain.naour@smile.fr>
Message-ID: <87lfzzctfq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Some kernel-selftests are using taskset program, so make sure that
 > BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS is selected.

 > [linux-4.19 selftests]$ git grep taskset
 > bpf/test_progs.c:       assert(system("taskset 0x1 ./urandom_read 100000") == 0);
 > cpu-hotplug/cpu-on-off-test.sh: taskset -p 01 $$
 > cpufreq/main.sh:        taskset -p 01 $$
 > netfilter/nft_trans_stress.sh:        ip netns exec "$testns" taskset $mask ping -4 127.0.0.1 -fq > /dev/null &
 > netfilter/nft_trans_stress.sh:        ip netns exec "$testns" taskset $mask ping -6 ::1 -fq > /dev/null &
 > rcutorture/bin/jitter.sh:       if ! taskset -p $cpumask $$ > /dev/null 2>&1

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
