Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B26CC38142
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 16:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0368440AF4;
	Mon, 23 Jan 2023 16:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0368440AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xkwqg1OtPf1E; Mon, 23 Jan 2023 16:58:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 070EA40AEB;
	Mon, 23 Jan 2023 16:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 070EA40AEB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67E6B1BF859
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 16:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42E714174C
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 16:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42E714174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LbMC0AMdET4b for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 16:58:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56C594173C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56C594173C
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 16:58:44 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ADE8540003;
 Mon, 23 Jan 2023 16:58:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pK09X-00D9GI-TU; Mon, 23 Jan 2023 17:58:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20230123135253.1733981-1-thomas.devoogdt@barco.com>
 <87edrl9qnv.fsf@dell.be.48ers.dk>
 <CACXRmJjbD_RdN+itgb7L=2G7Ch2WTK_jyQ5hPm_TWFHY2d5JNw@mail.gmail.com>
Date: Mon, 23 Jan 2023 17:58:39 +0100
In-Reply-To: <CACXRmJjbD_RdN+itgb7L=2G7Ch2WTK_jyQ5hPm_TWFHY2d5JNw@mail.gmail.com>
 (Thomas Devoogdt's message of "Mon, 23 Jan 2023 17:32:02 +0100")
Message-ID: <87a6299ohs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/fluent-bit: add new package
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Samuel Martin <s.martin49@gmail.com>, Grim Delcour <grim.delcour@barco.com>,
 Anton Danneels <anton.danneels@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

Hello,

 >> Now we just miss the change summary ;)

 > Sorry about that. I'm not comfortable using git-mail. I at least won't
 > be sad if buildroot goes to e.g. GitHub or GitLab.
 > But that is no excuse.

;)

We do have some documentation on
https://buildroot.org/downloads/manual/manual.html#submitting-patches,
but the summary is simply just to run git format-patch to generate the
patch file, edit it to add the information about the change and then run
git send-email on the patch file instead of directly running git
send-email to generate patch + send it in one go.

>> > +stop() {
 >> > +    printf "Stopping fluent-bit: "
 >> > +    start-stop-daemon -K -q -p $PID_FILE
 >> > +    # https://docs.fluentbit.io/manual/administration/configuring-fluent-bit/yaml/configuration-file#config_section
 >> > +    # The default grace time is set to 5 seconds, so use 6 seconds to have some margin.
 >> > +    TIMEOUT=6
 >> > +    PID=$(cat $PID_FILE 2>/dev/null)
 >> > +    while kill -0 $PID 2>/dev/null; do
 >> > +            [ $TIMEOUT -eq 0 ] && echo "FAIL" && return 1
 >> > +            TIMEOUT=$((TIMEOUT - 1))
 >> > +            sleep 1
 >> > +    done
 >> > +    rm -f $PID_FILE
 >> 
 >> So the pidfile is not removed on timeouts. Is that on purpose?

 > No idea what is preferably, I see at least that it is also not removed in
 > https://nightly.buildroot.org/#adding-packages-start-script.

My point was that you were explictly removing the pid file in the happy
case (which is fine), but not in the unhappy one. Perhaps just move the
rm line just above the while?

 >> I do see that it gets confused and ends up installing the default config
 >> files in usr/etc/fluent-bit. I don't right away see why this is so, but
 >> indeed explicitly setting it to /etc fixes that. Notice that it does
 >> lead to an invalid service file:
 >> 
 >> https://github.com/fluent/fluent-bit/issues/6619
 >> 
 >> So maybe a better fix is to just move the files in a post-install hook?

 > I do prefer to get it done by setting CMAKE_INSTALL_SYSCONFDIR.
 > But perhaps, we could wait the response on that thread?

Ok. Perhaps add a reference to that bugreport in a comment?


 >> > +define FLUENT_BIT_POST_INSTALL_TARGET_HOOK
 >> > +    cp -dpf $(@D)/lib/libminiz*.so* $(TARGET_DIR)/usr/lib/
 >> > +endef
 >> > +
 >> > +FLUENT_BIT_POST_INSTALL_TARGET_HOOKS += FLUENT_BIT_POST_INSTALL_TARGET_HOOK
 >> 
 >> Again, why not just build with -DBUILD_SHARED_LIBS=OFF?
 >> 
 >> I see that the package installs a shared library in a custom
 >> location:
 >> 
 >> target/usr/lib/fluent-bit/libfluent-bit.so
 >> 
 >> What is that used for / how does it find it? I see there is a
 >> FLB_SHARED_LIB option to disable it.

 > Already changed that in V3.
 > https://patchwork.ozlabs.org/project/buildroot/patch/20230123151459.1899697-1-thomas.devoogdt@barco.com/

I guess that is a reference to the miniz issue rather than the
FLB_SHARED_LIB one? Why do you need to patch the sources for that
instead of just passing -DBUILD_SHARED_LIBS=OFF in FLUENT_BIT_CONF_OPTS?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
