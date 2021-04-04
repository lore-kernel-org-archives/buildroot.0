From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Apr 2021 11:25:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: fix script
 net-snmp-create-v3-user's usage of 'ps'.
In-Reply-To: <20210331081447.29552-1-nicolas.cavallari@green-communications.fr>
 (Nicolas Cavallari's message of "Wed, 31 Mar 2021 10:14:47 +0200")
References: <20210331081447.29552-1-nicolas.cavallari@green-communications.fr>
Message-ID: <87a6qe2yhd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Cavallari <nicolas.cavallari@green-communications.fr> writes:

 > net-snmp-create-v3-user uses ps to check if snmpd is running.  To know
 > how to invoke 'ps', the build system use 'which ps' and does other
 > checks for the output format of 'ps', therefore inspecting 'ps' on the
 > build machine instead of the target.

 > If the build machine runs a OS like Debian, that uses a merged-usr and a
 > PATH of '/usr/bin:/bin', then 'which ps' returns /usr/bin/ps, which will
 > not work on the target if it does not also use a merged-usr.

 > Hardcode 'ps' to be /bin/ps to fix this issue and to improve build
 > reproducibility.

 > Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
