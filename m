Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968D4C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 12:11:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D664C606A5
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 12:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D664C606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=grinn-global.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C1FD81B99;
	Wed, 15 Sep 2021 12:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tY3uO6uuWlW2; Wed, 15 Sep 2021 12:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E615828DF;
	Wed, 15 Sep 2021 12:11:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6802A1BF404
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 12:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4ACD8401C8
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 12:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQmjISMahzYA for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 12:11:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 928B5400EE
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 12:11:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (1)
Received: from [192.168.65.122] (95.143.241.142.ultranet.net.pl
 [95.143.241.142])
 by server220076.nazwa.pl (Postfix) with ESMTP id 1F8D21C5E31;
 Wed, 15 Sep 2021 14:11:49 +0200 (CEST)
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>
References: <20210914132139.3597322-1-jose.pekkarinen@unikie.com>
 <87ee9rgm9e.fsf@tarshish>
 <CAJPV9MoTBjbwuAbtWaeHeSJBOKtYAbpOtJCJTAj3NW8ZF8HRSQ@mail.gmail.com>
 <87k0jif8w4.fsf@tarshish>
 <CAJPV9MpYfzoEN3qbMMmFvQy78-=i4VP39_0KzZ2GraYDnNwd3Q@mail.gmail.com>
From: =?UTF-8?Q?Bartosz_Bi=c5=82as?= <b.bilas@grinn-global.com>
Message-ID: <c4771a62-e0e7-939c-703f-00b89267569c@grinn-global.com>
Date: Wed, 15 Sep 2021 14:11:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAJPV9MpYfzoEN3qbMMmFvQy78-=i4VP39_0KzZ2GraYDnNwd3Q@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v2] package/iptables: add init script
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1649311475106202370=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This is a multi-part message in MIME format.
--===============1649311475106202370==
Content-Type: multipart/alternative;
 boundary="------------4F308195E34B01946387379E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4F308195E34B01946387379E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello José,

On 9/15/21 1:41 PM, José Pekkarinen wrote:
>
>
> On Wed, Sep 15, 2021 at 1:09 PM Baruch Siach <baruch@tkos.co.il 
> <mailto:baruch@tkos.co.il>> wrote:
>
>     Hi José,
>
>     On Wed, Sep 15 2021, José Pekkarinen wrote:
>     > On Tue, Sep 14, 2021 at 7:22 PM Baruch Siach <baruch@tkos.co.il
>     <mailto:baruch@tkos.co.il>> wrote:
>     >  On Tue, Sep 14 2021, José Pekkarinen wrote:
>     >  > This patch will add an init script that allows
>     >  > to set a ruleset in /etc/iptables.conf to be loaded
>     >  > on boot, or flushed on stop, as well as a saving
>     >  > command to generate a new file.
>     >  >
>     >  > Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com
>     <mailto:jose.pekkarinen@unikie.com>>
>     >  > ---
>     >  > [v1 -> v2] s/touch $(DESTDIR)/touch $(TARGET_DIR)/
>     >  >
>     >  >  package/iptables/S41iptables | 58
>     ++++++++++++++++++++++++++++++++++++
>     >  >  package/iptables/iptables.mk <http://iptables.mk> |  6 ++++
>     >  >  2 files changed, 64 insertions(+)
>     >  >  create mode 100644 package/iptables/S41iptables
>     >  >
>     >  > diff --git a/package/iptables/S41iptables
>     b/package/iptables/S41iptables
>     >  > new file mode 100644
>     >  > index 0000000000..93998b78de
>     >  > --- /dev/null
>     >  > +++ b/package/iptables/S41iptables
>     >  > @@ -0,0 +1,58 @@
>     >  > +#!/bin/sh
>     >  > +
>     >  > +DAEMON="iptables"
>     >  > +
>     >  > +IPTABLES_ARGS=""
>     >  > +
>     >  > +start() {
>     >  > +     printf 'Starting %s: ' "$DAEMON"
>     >  > +     iptables-restore < /etc/iptables.conf
>     >  > +     status=$?
>     >  > +     if [ "$status" -eq 0 ]; then
>     >  > +             echo "OK"
>     >  > +     else
>     >  > +             echo "FAIL"
>     >  > +     fi
>     >  > +     return "$status"
>     >  > +}
>     >  > +
>     >  > +stop() {
>     >  > +     printf 'Stopping %s: ' "$DAEMON"
>     >  > +     iptables -F
>     >  > +     status=$?
>     >  > +     if [ "$status" -eq 0 ]; then
>     >  > +             echo "OK"
>     >  > +     else
>     >  > +             echo "FAIL"
>     >  > +     fi
>     >  > +     return "$status"
>     >  > +}
>     >  > +
>     >  > +restart() {
>     >  > +     stop
>     >  > +     sleep 1
>     >  > +     start
>     >  > +}
>     >  > +
>     >  > +save() {
>     >  > +     printf 'Saving %s: ' "$DAEMON"
>     >  > +     iptables-save > /etc/iptables.conf
>     >
>     >  What about read-only rootfs?
>     >
>     >     Very good point, will it work if we check the rootfs
>     > whether is ro or rw, and execute on that behalf?
>
>     I'm not sure that this script is a good idea to begin with for the
>     default installation. But if the maintainers think it is, the script
>     should skip the save operation for read-only filesystems. See how
>     package/urandom-scripts/S20urandom handles that.
>
>
>     Thanks again, I'm testing a patch to solve the ro rootfs
> issue. Is there any better approach to have a firewall ruleset
> by default in the final image?

Did you try to use post-build script to copy this file into your image?

Best
Bartek
>
>     Best regards.
>
>     José.
>
>
>     baruch
>
>     >
>     >     Thanks for the comments!
>     >
>     >     José.
>     >
>     >  baruch
>     >
>     >  > +     status=$?
>     >  > +     if [ "$status" -eq 0 ]; then
>     >  > +             echo "OK"
>     >  > +     else
>     >  > +             echo "FAIL"
>     >  > +     fi
>     >  > +     return "$status"
>     >  > +}
>     >  > +
>     >  > +case "$1" in
>     >  > +     start|stop|restart|save)
>     >  > +             "$1";;
>     >  > +     reload)
>     >  > +             # Restart, since there is no true "reload" feature.
>     >  > +             restart;;
>     >  > +     *)
>     >  > +             echo "Usage: $0 {start|stop|restart|reload}"
>     >  > +             exit 1
>     >  > +esac
>     >  > diff --git a/package/iptables/iptables.mk
>     <http://iptables.mk> b/package/iptables/iptables.mk
>     <http://iptables.mk>
>     >  > index dc01466607..1d3612dbf6 100644
>     >  > --- a/package/iptables/iptables.mk <http://iptables.mk>
>     >  > +++ b/package/iptables/iptables.mk <http://iptables.mk>
>     >  > @@ -57,4 +57,10 @@ define IPTABLES_LINUX_CONFIG_FIXUPS
>     >  >       $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
>     >  >  endef
>     >  >
>     >  > +define IPTABLES_INSTALL_INIT_SYSV
>     >  > +     $(INSTALL) -m 0755 -D package/iptables/S41iptables \
>     >  > +  $(TARGET_DIR)/etc/init.d/S41iptables
>     >  > +     touch $(TARGET_DIR)/etc/iptables.conf
>     >  > +endef
>     >  > +
>     >  >  $(eval $(autotools-package))
>
>     -- 
>                                                          ~. .~  Tk
>     Open Systems
>     =}------------------------------------------------ooO--U--Ooo------------{=
>        - baruch@tkos.co.il <mailto:baruch@tkos.co.il> - tel:
>     +972.52.368.4656, http://www.tkos.co.il <http://www.tkos.co.il> -
>
>
>
> -- 
>
>     José.
>
>
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
-- 


--------------4F308195E34B01946387379E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello José,</p>
    <div class="moz-cite-prefix">On 9/15/21 1:41 PM, José Pekkarinen
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJPV9MpYfzoEN3qbMMmFvQy78-=i4VP39_0KzZ2GraYDnNwd3Q@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Sep 15, 2021 at 1:09
            PM Baruch Siach &lt;<a href="mailto:baruch@tkos.co.il"
              moz-do-not-send="true">baruch@tkos.co.il</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Hi José,<br>
            <br>
            On Wed, Sep 15 2021, José Pekkarinen wrote:<br>
            &gt; On Tue, Sep 14, 2021 at 7:22 PM Baruch Siach &lt;<a
              href="mailto:baruch@tkos.co.il" target="_blank"
              moz-do-not-send="true">baruch@tkos.co.il</a>&gt; wrote:<br>
            &gt;  On Tue, Sep 14 2021, José Pekkarinen wrote:<br>
            &gt;  &gt; This patch will add an init script that allows<br>
            &gt;  &gt; to set a ruleset in /etc/iptables.conf to be
            loaded<br>
            &gt;  &gt; on boot, or flushed on stop, as well as a saving<br>
            &gt;  &gt; command to generate a new file.<br>
            &gt;  &gt;<br>
            &gt;  &gt; Signed-off-by: José Pekkarinen &lt;<a
              href="mailto:jose.pekkarinen@unikie.com" target="_blank"
              moz-do-not-send="true">jose.pekkarinen@unikie.com</a>&gt;<br>
            &gt;  &gt; ---<br>
            &gt;  &gt; [v1 -&gt; v2] s/touch $(DESTDIR)/touch
            $(TARGET_DIR)/<br>
            &gt;  &gt;<br>
            &gt;  &gt;  package/iptables/S41iptables | 58
            ++++++++++++++++++++++++++++++++++++<br>
            &gt;  &gt;  package/iptables/<a href="http://iptables.mk"
              rel="noreferrer" target="_blank" moz-do-not-send="true">iptables.mk</a>
            |  6 ++++<br>
            &gt;  &gt;  2 files changed, 64 insertions(+)<br>
            &gt;  &gt;  create mode 100644 package/iptables/S41iptables<br>
            &gt;  &gt;<br>
            &gt;  &gt; diff --git a/package/iptables/S41iptables
            b/package/iptables/S41iptables<br>
            &gt;  &gt; new file mode 100644<br>
            &gt;  &gt; index 0000000000..93998b78de<br>
            &gt;  &gt; --- /dev/null<br>
            &gt;  &gt; +++ b/package/iptables/S41iptables<br>
            &gt;  &gt; @@ -0,0 +1,58 @@<br>
            &gt;  &gt; +#!/bin/sh<br>
            &gt;  &gt; +<br>
            &gt;  &gt; +DAEMON="iptables"<br>
            &gt;  &gt; +<br>
            &gt;  &gt; +IPTABLES_ARGS=""<br>
            &gt;  &gt; +<br>
            &gt;  &gt; +start() {<br>
            &gt;  &gt; +     printf 'Starting %s: ' "$DAEMON"<br>
            &gt;  &gt; +     iptables-restore &lt; /etc/iptables.conf<br>
            &gt;  &gt; +     status=$?<br>
            &gt;  &gt; +     if [ "$status" -eq 0 ]; then<br>
            &gt;  &gt; +             echo "OK"<br>
            &gt;  &gt; +     else<br>
            &gt;  &gt; +             echo "FAIL"<br>
            &gt;  &gt; +     fi<br>
            &gt;  &gt; +     return "$status"<br>
            &gt;  &gt; +}<br>
            &gt;  &gt; +<br>
            &gt;  &gt; +stop() {<br>
            &gt;  &gt; +     printf 'Stopping %s: ' "$DAEMON"<br>
            &gt;  &gt; +     iptables -F<br>
            &gt;  &gt; +     status=$?<br>
            &gt;  &gt; +     if [ "$status" -eq 0 ]; then<br>
            &gt;  &gt; +             echo "OK"<br>
            &gt;  &gt; +     else<br>
            &gt;  &gt; +             echo "FAIL"<br>
            &gt;  &gt; +     fi<br>
            &gt;  &gt; +     return "$status"<br>
            &gt;  &gt; +}<br>
            &gt;  &gt; +<br>
            &gt;  &gt; +restart() {<br>
            &gt;  &gt; +     stop<br>
            &gt;  &gt; +     sleep 1<br>
            &gt;  &gt; +     start<br>
            &gt;  &gt; +}<br>
            &gt;  &gt; +<br>
            &gt;  &gt; +save() {<br>
            &gt;  &gt; +     printf 'Saving %s: ' "$DAEMON"<br>
            &gt;  &gt; +     iptables-save &gt; /etc/iptables.conf<br>
            &gt;<br>
            &gt;  What about read-only rootfs?<br>
            &gt;<br>
            &gt;     Very good point, will it work if we check the
            rootfs<br>
            &gt; whether is ro or rw, and execute on that behalf?<br>
            <br>
            I'm not sure that this script is a good idea to begin with
            for the<br>
            default installation. But if the maintainers think it is,
            the script<br>
            should skip the save operation for read-only filesystems.
            See how<br>
            package/urandom-scripts/S20urandom handles that.<br>
          </blockquote>
          <div><br>
          </div>
          <div>    Thanks again, I'm testing a patch to solve the ro
            rootfs</div>
          <div>issue. Is there any better approach to have a firewall
            ruleset</div>
          <div>by default in the final image?</div>
        </div>
      </div>
    </blockquote>
    <p>Did you try to use post-build script to copy this file into your
      image?</p>
    Best<br>
    Bartek<br>
    <blockquote type="cite"
cite="mid:CAJPV9MpYfzoEN3qbMMmFvQy78-=i4VP39_0KzZ2GraYDnNwd3Q@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>    Best regards.</div>
          <div><br>
          </div>
          <div>    José.</div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            baruch<br>
            <br>
            &gt;<br>
            &gt;     Thanks for the comments!<br>
            &gt;<br>
            &gt;     José.<br>
            &gt;  <br>
            &gt;  baruch<br>
            &gt;<br>
            &gt;  &gt; +     status=$?<br>
            &gt;  &gt; +     if [ "$status" -eq 0 ]; then<br>
            &gt;  &gt; +             echo "OK"<br>
            &gt;  &gt; +     else<br>
            &gt;  &gt; +             echo "FAIL"<br>
            &gt;  &gt; +     fi<br>
            &gt;  &gt; +     return "$status"<br>
            &gt;  &gt; +}<br>
            &gt;  &gt; +<br>
            &gt;  &gt; +case "$1" in<br>
            &gt;  &gt; +     start|stop|restart|save)<br>
            &gt;  &gt; +             "$1";;<br>
            &gt;  &gt; +     reload)<br>
            &gt;  &gt; +             # Restart, since there is no true
            "reload" feature.<br>
            &gt;  &gt; +             restart;;<br>
            &gt;  &gt; +     *)<br>
            &gt;  &gt; +             echo "Usage: $0
            {start|stop|restart|reload}"<br>
            &gt;  &gt; +             exit 1<br>
            &gt;  &gt; +esac<br>
            &gt;  &gt; diff --git a/package/iptables/<a
              href="http://iptables.mk" rel="noreferrer" target="_blank"
              moz-do-not-send="true">iptables.mk</a> b/package/iptables/<a
              href="http://iptables.mk" rel="noreferrer" target="_blank"
              moz-do-not-send="true">iptables.mk</a><br>
            &gt;  &gt; index dc01466607..1d3612dbf6 100644<br>
            &gt;  &gt; --- a/package/iptables/<a
              href="http://iptables.mk" rel="noreferrer" target="_blank"
              moz-do-not-send="true">iptables.mk</a><br>
            &gt;  &gt; +++ b/package/iptables/<a
              href="http://iptables.mk" rel="noreferrer" target="_blank"
              moz-do-not-send="true">iptables.mk</a><br>
            &gt;  &gt; @@ -57,4 +57,10 @@ define
            IPTABLES_LINUX_CONFIG_FIXUPS<br>
            &gt;  &gt;       $(call
            KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)<br>
            &gt;  &gt;  endef<br>
            &gt;  &gt;  <br>
            &gt;  &gt; +define IPTABLES_INSTALL_INIT_SYSV<br>
            &gt;  &gt; +     $(INSTALL) -m 0755 -D
            package/iptables/S41iptables \<br>
            &gt;  &gt; +           
             $(TARGET_DIR)/etc/init.d/S41iptables<br>
            &gt;  &gt; +     touch $(TARGET_DIR)/etc/iptables.conf<br>
            &gt;  &gt; +endef<br>
            &gt;  &gt; +<br>
            &gt;  &gt;  $(eval $(autotools-package))<br>
            <br>
            -- <br>
                                                                 ~. .~ 
             Tk Open Systems<br>
=}------------------------------------------------ooO--U--Ooo------------{=<br>
               - <a href="mailto:baruch@tkos.co.il" target="_blank"
              moz-do-not-send="true">baruch@tkos.co.il</a> - tel:
            +972.52.368.4656, <a href="http://www.tkos.co.il"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://www.tkos.co.il</a>
            -<br>
          </blockquote>
        </div>
        <br clear="all">
        <div><br>
        </div>
        -- <br>
        <div dir="ltr" class="gmail_signature">
          <div dir="ltr">
            <blockquote style="margin:0px 0px 0px
              40px;border:none;padding:0px">José.</blockquote>
          </div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
buildroot mailing list
<a class="moz-txt-link-abbreviated" href="mailto:buildroot@lists.buildroot.org">buildroot@lists.buildroot.org</a>
<a class="moz-txt-link-freetext" href="https://lists.buildroot.org/mailman/listinfo/buildroot">https://lists.buildroot.org/mailman/listinfo/buildroot</a>
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <title></title>
      <br>
    </div>
  </body>
</html>

--------------4F308195E34B01946387379E--

--===============1649311475106202370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1649311475106202370==--
