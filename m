From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 17 Mar 2015 22:30:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: Enable support
 for log to debug file
In-Reply-To: <55035FF7.2070503@zacarias.com.ar>
References: <1426197654-8183-1-git-send-email-joerg.krause@embedded.rocks>
 <55035FF7.2070503@zacarias.com.ar>
Message-ID: <1426627803.6281.3.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fr, 2015-03-13 at 19:08 -0300, Gustavo Zacarias wrote:
> On 03/12/2015 07:00 PM, J?rg Krause wrote:
> 
> > Enables the '-f' option (log output to debug file instead of stdout) for
> > wpa_supplicant.
> 
> Just force enable it, binary size +8 bytes for an ARM target, it doesn't
> make sense to make it an option (specially since it must be used and
> doesn't affect anything by default).
> Regards.
> 

Sorry, there is an error in the patch:

+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG),y)
+       WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_DEBUG_FILE
+endif

Should be of course:

+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_FILE),y)
+       WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_DEBUG_FILE
+endif

For me it's +963 bytes. Force enable it anyway?
