From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 20:08:00 +0100
Subject: [Buildroot] [PATCH 1/3] package/docker-containerd: security
 bump to 1.4.4
In-Reply-To: <20210312224833.1908386-1-christian@paral.in> (Christian
 Stewart's message of "Fri, 12 Mar 2021 14:48:31 -0800")
References: <20210312224833.1908386-1-christian@paral.in>
Message-ID: <87h7l5skxb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Security fix for CVE-2021-21334:
 > https://github.com/containerd/containerd/security/advisories/GHSA-6g2q-w5j3-fwh4

 > Other changes:

 >  - Fix container create in CRI to prevent possible environment
 > variable leak between containers
 >  - Update shim server to return grpc NotFound error
 >  - Add bounds on max oom_score_adj value for shim's AdjustOOMScore
 >  - Update task manager to use fresh context when calling shim shutdown
 >  - Update Docker resolver to avoid possible concurrent map access panic
 >  - Update shim's log file open flags to avoid containerd hang on syscall open
 >  - Fix incorrect usage calculation

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
