From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2011 11:51:42 +0200
Subject: [Buildroot] [PATCH 1/9] Allow timezone to be set in
	configuration
In-Reply-To: <1318603921-22899-2-git-send-email-will_wagner@carallon.com>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
 <1318603921-22899-2-git-send-email-will_wagner@carallon.com>
Message-ID: <201110151151.43592.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Friday 14 October 2011 16:51:53, Will Wagner wrote:
> +target_generic_timezone:
> +       $(SED) '/# GENERIC_TIMEZONE$$/s~^.*#~$(TARGET_GENERIC_TIMEZONE) #~' $(TARGET_DIR)/etc/TZ
> +

 Why not just create the file here?  I.e.

	echo $(TARGET_GENERIC_TIMEZONE) > $(TARGET_DIR)/etc/TZ


 Perhaps even move it out of the SKELETON_DEFAULT condition.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111015/10eb0c59/attachment.html>
