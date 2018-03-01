From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Mar 2018 20:55:36 +0100
Subject: [Buildroot] [PATCH 2/2] apache init script
In-Reply-To: <20180227115022.8802-1-chrismcc@gmail.com>
References: <20180227115022.8802-1-chrismcc@gmail.com>
Message-ID: <5342e892-2293-bbb4-0c76-c9f9d6da28f1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-02-18 12:50, Christopher McCrory wrote:
> +@@ -58,13 +58,13 @@
> + # work correctly with a thread-based MPM; notably PHP will refuse to start.
> + 
> + httpd=${HTTPD-/usr/sbin/httpd}
> +-pidfile=${PIDFILE-/var/run/${prog}.pid}
> +-lockfile=${LOCKFILE-/var/lock/subsys/${prog}}
> ++pidfile=${PIDFILE-/var/logs/httpd.pid}

 PID files really should go into /var/run, not in /var/logs.

 Regards,
 Arnout

> ++lockfile=${LOCKFILE-/var/lock/httpd}
> + RETVAL=0
> + 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
