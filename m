From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Fri, 27 Mar 2015 17:21:36 +0100
Subject: [Buildroot] wpa_supplicant not starting correctly
In-Reply-To: <55131639.9040408@gmail.com>
References: <55131639.9040408@gmail.com>
Message-ID: <55158390.2020102@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/03/2015 21:10, Alexey Mednyy wrote:
> Hello there,
> 
> I've got configuration with eudev,dbus and  busybox init.
> Previously everything worked fine, but now wpa_supplicant not starting.
> and I see this in /var/log/messages :
> 
> Mar 25 22:56:25 hostname daemon.notice dbus[120]: [system] Activating
> service name='fi.w1.wpa_supplicant1' (using servicehelper)
> Mar 25 22:56:26 hostname daemon.info init: starting pideudev 146, tty
> '/dev/ttyS0': '/sbin/getty -L  ttyS0 0 vt100 '
> Mar 25 22:56:26 hostname daemon.notice dbus[120]: [system] Activated
> service 'fi.w1.wpa_supplicant1' failed: Failed to execute program
> fi.w1.wpa_supplicant1: Success
> 
> I'm not an expert in dbus, so asking for help what causes such problem?
> I think before some recent commit wpa_supplicant started by init script
> not by dbus is it true?

If you use network-manager or something managing wpa_supplicant, then
they have always relied on D-Bus activation to start wpa_supplicant.

You seem to not run systemd, so the standard D-Bus activation should
work.  Check that you can run wpa_supplicant normally (i.e. by running
it with the same parameters as specified in
/usr/share/dbus-1/system-services/fi.w1.wpa_supplicant1.service ).  If
it does, there is another problem.

My current supposition is that your wpa_supplicant was built without
D-Bus support.
