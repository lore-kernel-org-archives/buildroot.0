From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 21 Feb 2013 18:21:42 +0200
Subject: [Buildroot] network-manager-applet for buildroot almost ready
In-Reply-To: <51263203.4070709@petroprogram.com>
References: <51263203.4070709@petroprogram.com>
Message-ID: <51264996.5060404@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

21.2.2013 16:41, Stefan Fr?berg kirjoitti:
> Hello all!
>
> I have network-manager-applet running and it appears into fluxbox system
> tray but
> it does not detect any networks.
>
> When starting it from terminal it spits the following:
>
> ** Message: applet now removed from the notification area
> ** Message: applet now embedded in the notification area
>
> ** (nm-applet:766): WARNING **: Failed to register as an agent: (32) No
> session found for uid 0
>
> Does that "No session found for uid 0" mean that there is something
> wrong with dbus ????
>
> Or is that error related to consolekit ?
>
> I have it here running too (and soon will submit to buildroot)
> Also running are NetworkManager and dbus.
>
> I start fluxbox with normal startx command and I have just "exec
> /usr/bin/startfluxbox" in my .xinitrc file.
>
>
> Regards
> Stefan
>
>

I added ConsoleKits ck-launch-session to my .xinitrc as instructed here
http://fluxbox-wiki.org/index.php?title=Start_fluxbox_from_the_command_line

Now it does not anymore nag about missing session.
However, still no networks detected and when I try to click and view
properties of nm-applet it spits this:

** Message: applet now removed from the notification area
** Message: applet now embedded in the notification area

** (nm-applet:905): WARNING **: async_got_type: could not read
properties for /org/freedesktop/NetworkManager/ActiveConnection/10:
Method "Get" with signature "ss" on interface
"org.freedesktop.DBus.Properties" doesn't exist


** (nm-applet:905): WARNING **: async_got_type: could not read
properties for /org/freedesktop/NetworkManager/ActiveConnection/10:
Method "Get" with signature "ss" on interface
"org.freedesktop.DBus.Properties" doesn't exist


** (nm-applet:905): WARNING **: Connection activation failed: Creating
object for path '/org/freedesktop/NetworkManager/ActiveConnection/10'
failed in libnm-glib.

** (nm-applet:905): WARNING **: async_got_type: could not read
properties for /org/freedesktop/NetworkManager/ActiveConnection/10:
Method "Get" with signature "ss" on interface
"org.freedesktop.DBus.Properties" doesn't exist


So this is definetely either dbus or networkmanager (or both) problem

Regards
Stefan
