From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 16:04:19 +0100
Subject: [Buildroot] [PATCH v6 3/6] package/polkit: add systemd service
 file.
In-Reply-To: <20191206234649.3972927-3-aduskett@gmail.com>
References: <20191206234649.3972927-1-aduskett@gmail.com>
 <20191206234649.3972927-3-aduskett@gmail.com>
Message-ID: <20191208160419.22f9d23d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Dec 2019 15:46:46 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> - Add polkit.service for systemd based systems.

Why aren't you using the one from polkit itself? There is one in
data/polkit.service.in, which gets compiled to polkit.service, and
apparently installed if HAVE_SYSTEMD is enabled. There also a D-Bus
service file at data/org.freedesktop.PolicyKit1.service.in.

> - Add a polkitd user upon which /usr/lib/polkit-1/polkitd relies.
> - Set appropriate directory permissions to allow the polkitd user to
>   access rules and actions.
> - Set appropriate default attributes for the pkexec binary.

These could be done separately from the systemd service file addition.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
