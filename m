Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F14C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 19:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A810241837;
	Thu, 17 Mar 2022 19:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sNDERbk9ZL7u; Thu, 17 Mar 2022 19:03:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C9894013A;
	Thu, 17 Mar 2022 19:02:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADC271BF349
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 19:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99880841F8
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 19:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0CdqJcPMT2WH for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 19:02:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 531D5841B5
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 19:02:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (28)
Received: from [192.168.10.50] (dynamic-78-10-107-45.ssp.dialog.net.pl
 [78.10.107.45])
 by server220076.nazwa.pl (Postfix) with ESMTP id 956B01BD099;
 Thu, 17 Mar 2022 20:02:54 +0100 (CET)
Message-ID: <f0164dfa-4236-0087-cc8d-f50aa77ac2e7@grinn-global.com>
Date: Thu, 17 Mar 2022 20:02:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "Sassen, Rutger" <rsassen@comecer.com>
References: <YQXPR01MB61216162093E0D5F17304D0BAE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
From: Bartosz Bilas <b.bilas@grinn-global.com>
In-Reply-To: <YQXPR01MB61216162093E0D5F17304D0BAE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/rpi-firmware: fix missing
 files in overlays
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Peter Seiderer <ps.report@gmx.net>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: multipart/mixed; boundary="===============6433884518933589291=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============6433884518933589291==
Content-Type: multipart/alternative;
 boundary="------------aTeM9SLAo9a0nnfXA5eX08pW"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------aTeM9SLAo9a0nnfXA5eX08pW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 17.03.2022 12:06, Sassen, Rutger wrote:
> When supporting multiple hardware targets, overlay_map.dtb might
> be needed to map overlay names to one of several implementations.
>
> Signed-off-by: Rutger Sassen <rsassen@comecer.com>
> ---
> Changes v2 -> v3:
> - in Config.in use if statement instead of depends (suggested by Peter
> Seiderer)
> - mention the filename overlay_map.dtb in the help text (suggested by
> Peter Seiderer)
>
> Changes v1 -> v2:
> - instead of always copying overlay_map.dtb, make it configurable
> (suggested by Peter Seiderer)
> - do not copy README since it a special case, only needed when
> installing overlays to a non-standard location (suggested by Peter
> Seiderer)
>
> When supporting multiple hardware targets, overlay_map.dtb might
> be needed to map overlay names to one of several implementations.
>
> Signed-off-by: Rutger Sassen <rsassen@comecer.com>
> ---
> package/rpi-firmware/Config.in | 12 ++++++++++++
> package/rpi-firmware/rpi-firmware.mk | 7 +++++++
> 2 files changed, 19 insertions(+)
>
> diff --git a/package/rpi-firmware/Config.in 
> b/package/rpi-firmware/Config.in
> index 8070dc3019..36054353f8 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in
> @@ -93,6 +93,18 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> overlays, to support HATs (Hardware Attached on Top, add-on
> modules).
>
> +if BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> +
> +config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP
> + bool "Install DTB overlay map"
> + default n

bool symbols implicitly default to n.

Best
Bartek
> + help
> + Say 'y' here if you need to support multiple hardware targets
> + and you need overlay_map.dtb for target dependent mapping of
> + overlay names to one of several overlay implementations.
> +
> +endif # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> +
> config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
> bool "vcdbg"
> depends on BR2_arm # prebuilt arm binary, rpi-userland
> diff --git a/package/rpi-firmware/rpi-firmware.mk 
> b/package/rpi-firmware/rpi-firmware.mk
> index b46a7f5270..800b560070 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -57,6 +57,12 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> endef
> endif
>
> +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP),y)
> +define RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP
> + $(INSTALL) -D -m 0644 $(@D)/boot/overlays/overlay_map.dtb 
> $(BINARIES_DIR)/rpi-firmware/overlays/
> +endef
> +endif
> +
> # Install prebuilt libraries if RPI_USERLAND not enabled
> ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)
> define RPI_FIRMWARE_INSTALL_TARGET_LIB
> @@ -83,6 +89,7 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
> $(RPI_FIRMWARE_INSTALL_CONFIG)
> $(RPI_FIRMWARE_INSTALL_DTB)
> $(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
> + $(RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP)
> endef
>
> $(eval $(generic-package))
> -- 
> 2.20.1
>
>
> *Disclaimer*
>
> This email communication is CONFIDENTIAL. If you are not the intended 
> recipient, you may not use, copy or disclose to anyone the message or 
> any information contained in the message and I ask that you please 
> notify me by return email and delete this communication immediately. 
> Thank you.
>
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
--------------aTeM9SLAo9a0nnfXA5eX08pW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello,<br>
    </p>
    <div class="moz-cite-prefix">On 17.03.2022 12:06, Sassen, Rutger
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:YQXPR01MB61216162093E0D5F17304D0BAE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <style type="text/css">.style1 {font-family: "Times New Roman";}</style>When
      supporting multiple hardware targets, overlay_map.dtb might<br>
      be needed to map overlay names to one of several implementations.<br>
      <br>
      Signed-off-by: Rutger Sassen <a class="moz-txt-link-rfc2396E" href="mailto:rsassen@comecer.com">&lt;rsassen@comecer.com&gt;</a><br>
      ---<br>
      Changes v2 -&gt; v3:<br>
      - in Config.in use if statement instead of depends (suggested by
      Peter<br>
      Seiderer)<br>
      - mention the filename overlay_map.dtb in the help text (suggested
      by<br>
      Peter Seiderer)<br>
      <br>
      Changes v1 -&gt; v2:<br>
      - instead of always copying overlay_map.dtb, make it configurable<br>
      (suggested by Peter Seiderer)<br>
      - do not copy README since it a special case, only needed when<br>
      installing overlays to a non-standard location (suggested by Peter<br>
      Seiderer)<br>
      <br>
      When supporting multiple hardware targets, overlay_map.dtb might<br>
      be needed to map overlay names to one of several implementations.<br>
      <br>
      Signed-off-by: Rutger Sassen <a class="moz-txt-link-rfc2396E" href="mailto:rsassen@comecer.com">&lt;rsassen@comecer.com&gt;</a><br>
      ---<br>
      package/rpi-firmware/Config.in | 12 ++++++++++++<br>
      package/rpi-firmware/rpi-firmware.mk | 7 +++++++<br>
      2 files changed, 19 insertions(+)<br>
      <br>
      diff --git a/package/rpi-firmware/Config.in
      b/package/rpi-firmware/Config.in<br>
      index 8070dc3019..36054353f8 100644<br>
      --- a/package/rpi-firmware/Config.in<br>
      +++ b/package/rpi-firmware/Config.in<br>
      @@ -93,6 +93,18 @@ config
      BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS<br>
      overlays, to support HATs (Hardware Attached on Top, add-on<br>
      modules).<br>
      <br>
      +if BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS<br>
      +<br>
      +config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP<br>
      + bool "Install DTB overlay map"<br>
      + default n<br>
    </blockquote>
    <div class="comment-body markdown-body js-comment-body soft-wrap
      user-select-contain d-block">
      <p dir="auto">bool symbols implicitly default to n.</p>
      Best<br>
      Bartek<br>
    </div>
    <blockquote type="cite"
cite="mid:YQXPR01MB61216162093E0D5F17304D0BAE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM">+
      help<br>
      + Say 'y' here if you need to support multiple hardware targets<br>
      + and you need overlay_map.dtb for target dependent mapping of<br>
      + overlay names to one of several overlay implementations.<br>
      +<br>
      +endif # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS<br>
      +<br>
      config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG<br>
      bool "vcdbg"<br>
      depends on BR2_arm # prebuilt arm binary, rpi-userland<br>
      diff --git a/package/rpi-firmware/rpi-firmware.mk
      b/package/rpi-firmware/rpi-firmware.mk<br>
      index b46a7f5270..800b560070 100644<br>
      --- a/package/rpi-firmware/rpi-firmware.mk<br>
      +++ b/package/rpi-firmware/rpi-firmware.mk<br>
      @@ -57,6 +57,12 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS<br>
      endef<br>
      endif<br>
      <br>
      +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP),y)<br>
      +define RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP<br>
      + $(INSTALL) -D -m 0644 $(@D)/boot/overlays/overlay_map.dtb
      $(BINARIES_DIR)/rpi-firmware/overlays/<br>
      +endef<br>
      +endif<br>
      +<br>
      # Install prebuilt libraries if RPI_USERLAND not enabled<br>
      ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)<br>
      define RPI_FIRMWARE_INSTALL_TARGET_LIB<br>
      @@ -83,6 +89,7 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS<br>
      $(RPI_FIRMWARE_INSTALL_CONFIG)<br>
      $(RPI_FIRMWARE_INSTALL_DTB)<br>
      $(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)<br>
      + $(RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP)<br>
      endef<br>
      <br>
      $(eval $(generic-package))<br>
      -- <br>
      2.20.1<br>
      <br>
      <br>
      <p style="font-family: Verdana; font-size:10pt; color:#666666;"><b>Disclaimer</b></p>
      <p style="font-family: Verdana; font-size:8pt; color:#666666;">This
        email communication is CONFIDENTIAL. If you are not the intended
        recipient, you may not use, copy or disclose to anyone the
        message or any information contained in the message and I ask
        that you please notify me by return email and delete this
        communication immediately. Thank you.</p>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
buildroot mailing list
<a class="moz-txt-link-abbreviated" href="mailto:buildroot@buildroot.org">buildroot@buildroot.org</a>
<a class="moz-txt-link-freetext" href="https://lists.buildroot.org/mailman/listinfo/buildroot">https://lists.buildroot.org/mailman/listinfo/buildroot</a>
</pre>
    </blockquote>
  </body>
</html>

--------------aTeM9SLAo9a0nnfXA5eX08pW--

--===============6433884518933589291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6433884518933589291==--
