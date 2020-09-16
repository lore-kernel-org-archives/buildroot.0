From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 16 Sep 2020 17:33:31 +0200
Subject: [Buildroot] [PATCH v3 0/8] systemd .service pidfiles in /run
In-Reply-To: <20200915215645.2010-1-buildroot@heine.tech>
References: <20200915215645.2010-1-buildroot@heine.tech>
Message-ID: <20200916153340.345-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only systemd .services of Type=notify need a PIDFile entry. [0]
This pidfile should be located in /run. [0]
/var/run is deprecated and systemd warns about it on every bootup. [1]
This series fixes all affected packages.

Details:
 [0] https://www.freedesktop.org/software/systemd/man/systemd.service.html#PIDFile=
 [1] https://github.com/systemd/systemd/pull/10712
  

Michael Nosthoff (8):
  package/nginx: use /run for PIDFile
  package/bandwithd: use /run for PIDFile
  package/dhcpcd: use /run for PIDFile
  package/htpdate: use /run for PIDFile
  package/minidlna: use /run for PIDFile
  package/nss-pam-ldapd: use /run for PIDFile
  package/openvmtools: use /run for PIDFile
  package/postgresql: remove PIDFile from .service

 package/bandwidthd/bandwidthd.service | 2 +-
 package/dhcpcd/dhcpcd.service         | 2 +-
 package/htpdate/htpdate.service       | 4 ++--
 package/minidlna/minidlnad.service    | 2 +-
 package/nginx/nginx.service           | 2 +-
 package/nss-pam-ldapd/nslcd.service   | 2 +-
 package/openvmtools/vmtoolsd.service  | 4 ++--
 package/postgresql/postgresql.service | 1 -
 8 files changed, 9 insertions(+), 10 deletions(-)

-- 
2.25.1
