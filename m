From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 16 Jun 2011 17:27:10 +0200
Subject: [Buildroot] [PATCH v2 0/3] netsnmp improvements
In-Reply-To: <1308152878-14593-1-git-send-email-luca@lucaceresoli.net>
References: <1308152878-14593-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1308238033-20127-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

please ignore the two patches I sent yesterday for netsnmp. Patch 2 introduced
an annoying series of warnings, as net-snmp requires the MIB files to be
installed if the MIB loading code is enabled.

The present patch series addresses this issue correctly, allowing in addition
to disable the MIB loading code.

Patch 1 is unchanged.

Luca


Luca Ceresoli (3):
  netsnmp: fix stop and restart actions in init script
  netsnmp: allow to disable MIB loading code
  netsnmp: allow not to install MIB files

 package/netsnmp/Config.in  |   15 +++++++++++++++
 package/netsnmp/S59snmpd   |    1 -
 package/netsnmp/netsnmp.mk |    8 ++++++++
 3 files changed, 23 insertions(+), 1 deletions(-)

-- 
1.7.4.1
