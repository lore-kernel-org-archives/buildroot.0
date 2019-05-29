From: Robert Hancock <hancock@sedsystems.ca>
Date: Wed, 29 May 2019 11:10:45 -0600
Subject: [Buildroot] [PATCH] gpsd: update systemd service file binary
 path
In-Reply-To: <1559085957-14066-1-git-send-email-hancock@sedsystems.ca>
References: <1559085957-14066-1-git-send-email-hancock@sedsystems.ca>
Message-ID: <5f060b4a-e642-307a-4c6a-6a938b0b4d82@sedsystems.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, ignore this patch, it is a dupe of "package/gpsd: update systemd
service file binary path".

On 2019-05-28 5:25 p.m., Robert Hancock wrote:
> The systemd gpsd.service file supplied by gpsd specifies a binary path
> of /usr/local/sbin/gpsd, while Buildroot installs the binary in
> /usr/sbin/gpsd. Update the path to match the actual binary location.
> 
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> ---
>  ...3-update-systemd-service-file-binary-path.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/gpsd/0003-update-systemd-service-file-binary-path.patch
> 
> diff --git a/package/gpsd/0003-update-systemd-service-file-binary-path.patch b/package/gpsd/0003-update-systemd-service-file-binary-path.patch
> new file mode 100644
> index 0000000..32feb18
> --- /dev/null
> +++ b/package/gpsd/0003-update-systemd-service-file-binary-path.patch
> @@ -0,0 +1,30 @@
> +From c4c314f23bc6fec8d3ddadb49090eb3a2e84881d Mon Sep 17 00:00:00 2001
> +From: Robert Hancock <hancock@sedsystems.ca>
> +Date: Tue, 28 May 2019 17:13:25 -0600
> +Subject: [PATCH] Update systemd service file binary path
> +
> +The systemd gpsd.service file supplied by gpsd specifies a binary path
> +of /usr/local/sbin/gpsd, while Buildroot installs the binary in
> +/usr/sbin/gpsd. Update the path to match the actual binary location.
> +
> +Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> +---
> + systemd/gpsd.service | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/systemd/gpsd.service b/systemd/gpsd.service
> +index c1f193c..2707ff9 100644
> +--- a/systemd/gpsd.service
> ++++ b/systemd/gpsd.service
> +@@ -8,7 +8,7 @@ After=chronyd.service
> + Type=forking
> + EnvironmentFile=-/etc/default/gpsd
> + EnvironmentFile=-/etc/sysconfig/gpsd
> +-ExecStart=/usr/local/sbin/gpsd $GPSD_OPTIONS $OPTIONS $DEVICES
> ++ExecStart=/usr/sbin/gpsd $GPSD_OPTIONS $OPTIONS $DEVICES
> + 
> + [Install]
> + WantedBy=multi-user.target
> +-- 
> +1.8.3.1
> +
> 

-- 
Robert Hancock
Senior Software Developer
SED Systems, a division of Calian Ltd.
Email: hancock at sedsystems.ca
