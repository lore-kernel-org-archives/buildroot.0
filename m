From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Jun 2017 08:47:57 +0000
Subject: [Buildroot] [Bug 9926] systemd-resolved.service: Failed at step
 NAMESPACE (systemd 233)
In-Reply-To: <bug-9926-163@https.bugs.busybox.net/>
References: <bug-9926-163@https.bugs.busybox.net/>
Message-ID: <bug-9926-163-Rx75cSIilp@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9926

--- Comment #1 from Michael Heinemann <posted@heine.so> ---
On the ML Mike points out that this might be Kernel related (for some reason
his response is not showing up on bugzilla).

I build my Kernel outside of buildroot. So I use an identical Kernel with both
buildroot versions. Of course this doesn't mean a kernel configuration might
not be the issue, but it wasn't an issue with BR 2017.02.2.

The cgroup configuration looks like this:

CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_MEMCG_SWAP=y
CONFIG_MEMCG_SWAP_ENABLED=y
CONFIG_BLK_CGROUP=y
# CONFIG_DEBUG_BLK_CGROUP is not set
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
# CONFIG_CFS_BANDWIDTH is not set
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_FREEZER is not set
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_DEBUG is not set
# CONFIG_CHECKPOINT_RESTORE is not set

-- 
You are receiving this mail because:
You are on the CC list for the bug.
