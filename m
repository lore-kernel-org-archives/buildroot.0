From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Mar 2012 08:00:42 +0100
Subject: [Buildroot] [PATCH 1/3] intltool: no business defining PERLLIB
In-Reply-To: <1331517531-2291-2-git-send-email-gustavo@zacarias.com.ar>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120312080042.19fa11bf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 11 Mar 2012 22:58:49 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

>  $(eval $(call AUTOTARGETS))

This could be removed. We don't have libxml-parser-perl for the target.
This line used to be necessary because the host variant wouldn't work
without the target variant being defined, but it's no longer the case.
Therefore, the package/intltool/Config.in could go as well.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
