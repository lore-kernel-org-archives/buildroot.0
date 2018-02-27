From: Christopher McCrory <chrismcc@gmail.com>
Date: Tue, 27 Feb 2018 04:39:24 -0800
Subject: [Buildroot] [PATCH 3/3] bind sed
In-Reply-To: <20180227123924.20725-1-chrismcc@gmail.com>
References: <20180227123924.20725-1-chrismcc@gmail.com>
Message-ID: <20180227123924.20725-3-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

    sed script to alter directory locations

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/bind/configs.sed | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 package/bind/configs.sed

diff --git a/package/bind/configs.sed b/package/bind/configs.sed
new file mode 100644
index 0000000000..809da8e10c
--- /dev/null
+++ b/package/bind/configs.sed
@@ -0,0 +1,9 @@
+s#/var/run/named/pid#/var/run/named.pid#
+s#/var/dump/named_dump.db#/var/named/named_dump.db#
+s#/var/stats/named.stats#/var/named/named.stats#
+s#%%ETCDIR%%/master#/etc/bind/master#
+s#%%ETCDIR%%/named.root#/etc/bind/master/named.root#
+s#%%ETCDIR%%/working#/var/named#
+s#%%ETCDIR%%/slave#/var/named/slave#
+s#%%ETCDIR%%/dynamic#/var/named/dynamic#
+
-- 
2.14.3
