From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 Apr 2014 00:20:01 +0200
Subject: [Buildroot] [PATCH 0/5] SNMP++ improvements and AGENT++ addition
Message-ID: <1396822806-32655-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

this patchset provides various improvements to the SNMP++ package and adds the
AGENT++ library on top of it.

 - patches 1 and 2 fix minor issues with SNMP++;
 - patches 3 and 4 add options to enable optional features of SNMP++ that have
   a relevant impact on the filesystem size or memory usage;
 - patch 5 adds AGENT++; it does not necessarily require the previous patches.

Luca Ceresoli (5):
  snmppp: fix missing includes
  snmppp: update download URL
  snmppp: add option to enable logging
  snmppp: add option to disable SNMPv3 support
  agentpp: new package

 package/Config.in                                  |  1 +
 package/agentpp/Config.in                          | 20 +++++++++++
 package/agentpp/agentpp.mk                         | 20 +++++++++++
 package/snmppp/Config.in                           | 19 +++++++++-
 .../snmppp/snmppp-01-Add-missing-includes.patch    | 41 ++++++++++++++++++++++
 package/snmppp/snmppp.mk                           | 12 +++++--
 6 files changed, 110 insertions(+), 3 deletions(-)
 create mode 100644 package/agentpp/Config.in
 create mode 100644 package/agentpp/agentpp.mk
 create mode 100644 package/snmppp/snmppp-01-Add-missing-includes.patch

-- 
Luca

-- 
1.8.3.2
