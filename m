From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Dec 2020 22:49:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: fix build with
 netsnmp
In-Reply-To: <20201128095108.1069483-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Nov 2020 10:51:08 +0100")
References: <20201128095108.1069483-1-fontaine.fabrice@gmail.com>
Message-ID: <87lfehyz6g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure:
 > /bin/sh: net-snmp-config: command not found
 > /home/buildroot/autobuild/run/instance-2/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/9.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld:
 > osasnmpd.o: in function `main':
 > osasnmpd.c:(.text.startup+0xcc): undefined reference to `snmp_log_perror'

 > Moreover, replace perl-net-snmp dependency by netsnmp as osasnmpd is an
 > SNMP subagent for the net-snmp package:
 > https://github.com/ibm-s390-tools/s390-tools/blob/master/osasnmpd/osasnmpd.8

 > Fixes:
 >  - http://autobuild.buildroot.org/results/00796f2ebd5fb0e08ac7a05a9ee566f2bc4bd1c3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
