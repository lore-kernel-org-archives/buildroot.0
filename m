From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 17:09:48 +0200
Subject: [Buildroot] [PATCH v3 0/8] init scripts: rewrite S01logging
In-Reply-To: <20181007114605.18153-1-casantos@datacom.com.br>
References: <20181007114605.18153-1-casantos@datacom.com.br>
Message-ID: <20181011170948.3594d391@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Oct 2018 08:45:57 -0300, Carlos Santos wrote:
> Continuing our effort to improve daemon startup scripts, this series
> focuses on S01logging, which starts the logging daemon. Common features
> are:
> 
> - Indent with tabs, not spaces.
> - Implement start, stop, restart and reload as functions.
> - Use start-stop-daemon.
> - Correctly detect and report start/stop/restart/reload errors.
> - Support a configuration file at /etc/default (example files for each
>   package are provided in individual patches).
> - Support a configuration variable that completely disables the service
>   and issues a warning message on any invocation.

Thanks a lot for working on this, much appreciated. Overall, I am happy
with the proposal you're making and the consistency between init
scripts that your proposal is bringing.

The only thing that I'm not entirely sure about is specific to these
logging init scripts:

 (1) Do we really want that Busybox, syslog-ng, rsyslog, sysklogd all
     install a file of the same name, S01logging ? Isn't this
     contradicting our goal of not having one package overwrite files
     installed by another package ?

     Wouldn't it make more sense to install S01syslog-ng, S01rsyslog,
     S01sysklogd ? This way, we also have a mapping between the init
     script name and the daemon/package being started ?

 (2) For the Busybox case, do we want to keep a single init script that
     starts both klogd and syslogd ? Or should we have one init script
     per daemon, so that again the init script name matches the daemon
     being started ? So S01klogd, S01syslogd ?

Note: the above points are really proposals/discussion items. Do not
rework your series according to those comments until there has been
some discussion/agreement with other developers.

Another point, but which can definitely be handled separately, is
documenting in the manual what the init scripts should look like, by at
least pointing to the "good" init scripts, so that people know which
ones are good to use as a template.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
