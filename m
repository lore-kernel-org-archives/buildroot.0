Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB12C282EC
	for <buildroot@archiver.kernel.org>; Sat,  8 Mar 2025 11:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E24E740E36;
	Sat,  8 Mar 2025 11:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1X3hCz76_nB2; Sat,  8 Mar 2025 11:01:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02D0D40E58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02D0D40E58;
	Sat,  8 Mar 2025 11:01:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C0A171F
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 11:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E701240CD9
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 11:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NiJ5koIiLfea for <buildroot@buildroot.org>;
 Sat,  8 Mar 2025 11:01:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1C66340BF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C66340BF5
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C66340BF5
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 11:01:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0C8CE19F733;
 Sat,  8 Mar 2025 12:00:53 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 08 Mar 2025 12:00:52 +0100
Date: Sat, 8 Mar 2025 12:00:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Julien Olivain <ju.o@free.fr>
Message-ID: <Z8wjZJRIUpG0iiOx@landeda>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
 <dee1cb43f9e636b7ccdc7d4602ae0ab438952c3a.1740841539.git.yann.morin.1998@free.fr>
 <549206ba-180d-4ee1-9a5b-a9d99ab2d3d1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <549206ba-180d-4ee1-9a5b-a9d99ab2d3d1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741431657;
 bh=VTJvjr0rgK1D0AQvbzoK4LaOzEj4qUBjxmD/r6+sWkw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zvlemb1I4NH6gEWAVC9ALfTyWVcn5XedHGc2/Bc5dSyt2XRD63iyPtwS/BbxPjL2K
 pJHjaPOmAE9aM7ogI2LGmTbvrEfxRPSNvWN0/RWPNftAZ7USFwnV7vx7HKkgmI6BID
 I/o4jrTFFDTi2BD+JH2nn1jBweXuzGiow/FGjavRQN7j/0Oj3SRLEjKQrZxIkr4OJF
 sLr6Wi0v7J3EYEBNEBspXRhlg17cJbZR0ZzNxzp2ykTYlZQbIGHSomZwcd2QyJVs6r
 vTqedxamKF/o/fkW1MPVUQZpGUgfzGDDF+3f8JC/mO7QG1KxGLBHLMjcazMe8oLQXr
 R55TA66pbtzzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Zvlemb1I
Subject: Re: [Buildroot] [PATCH 9/9 v3] package/podman: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Raphael, All,

On 2025-03-07 14:40 +0100, Raphael Pavlidis spake thusly:
> On 3/1/25 16:05, Yann E. MORIN wrote:
> > The documentation [0] states that seccomp can be disabled (i.e. not
> > enabled), but we were unable to start a container without seccomp
> > support in podman. So we make that mandatory.
> You can start a container without seccomp by passing the
> --security-opt=seccomp=unconfined` option. But it is okay for me if it is
> mandatory.

Ok, good to know. But it means that, by default, podman uses seccomp,
and there is no way (that I could find, like in containers/conf for
example) to disble it unless with a non-trivial --option. Also, having
seccomp support does not preclude not using it. So I would still
consider that, for the Buildroot integration, we can make it mandatory.

Thanks for the hint about the --option!

> > Similar to Docker, podman can inject a minimalist init as PID1 in
> > containers, and like Docker, this is optional; podman however can only
> > use catatonit as such an init [2]. Given the size of catatonit (1.3%
> > that of podman!), we do not bother to make it optional, and always
> > enable it as well.
> I think systemd can also be used as a init. According to the documentation
> [1].

    https://docs.podman.io/en/latest/markdown/podman-run.1.html#init

As far as I understand it, using --init is what will cause catatonit to
be mounted into the container, and then called as PID 1, with catatonit
then spawning the actual command (or entrypoing etc...).

Using --systemd=XXX is "just" a way to tell podman to automatically do
a few preliminary setup (mounting tmpfs where needed, etc...) before
spawning the command in the container (i.e. either the one specified on
the podman copmmand line, or the entrypoint etc...) With --systemd=true
the setup is done if the commadn is systemd, /usr/sbin/init, /sbin/init
or /usr/local/sbin/init (whether those are actually systemd or not, by
the way!); with --systemd=false, the setup is never done, and with
--systemd=always, the setup is always done.

Of course, I would expect that using --init (and thus catatonit as PID
1), with a systemd in the container, will not play nicely, as systemd
would not be PID 1...

So, I think the catatonit init is unrelated to systemd, and one can not
use systemd as the process used by podman --init. Of course, it is
entirely possible that I misunderstood that part of podman too. ;-)

> > +	select BR2_PACKAGE_IPTABLES  # runtime
> I am sure that you do not need iptables if you are using nftables.

I briefly tried with nftables, it did not work, so I did not investigate
further; IIRC it was before I had to write containers.conf, so maybe we
can specify the firewall driver there... Ah, yes, it seems we can do
that:

    firewall_driver=""

    The firewall driver to be used by netavark. [...] supported drivers
    are "iptables", "nftables" [...]

I can regive it a spin, and add a blurb in the commit log if the outcome
is still negative.

But either way, it can be an improvement afterwards, once the series is
applied.

> > +		$(PODMAN_PKGDIR)/containers.conf \
> > +		$(TARGET_DIR)/etc/containers/containers.conf
> > +	$(Q)$(INSTALL) -D -m 0644 \
> > +		$(PODMAN_PKGDIR)/policy.json \
> > +		$(TARGET_DIR)/etc/containers/policy.json
> > +	$(Q)$(INSTALL) -D -m 0644 \
> > +		$(PODMAN_PKGDIR)/registries.conf \
> > +		$(TARGET_DIR)/etc/containers/registries.conf
> Just for curiosity, why not installing those files under
> /usr/share/containers?

The first such file I wrote was policy.json, and the documentation for it
states [0]:

    By default, the policy is read from $HOME/.config/containers/policy.json,
    if it exists, otherwise from /etc/containers/policy.json ; [...]

So I did not look further and put it in /etc/containers/. Then I had to
write registries.conf (for seemless access to the docker hub), and again
the documentation also states [1]:

    By default, the policy is read from $HOME/.config/containers/policy.json,
    if it exists, otherwise from /etc/containers/policy.json ; [...]

So again, I put it /etc/containers/ without much ado. And when it came
to write containers.conf to use slirp4netns instead of pasta, it seemed
like a good idea to pu it there too, and as the documentatiopn also
states this is a valid location [2], I decided to put all config files
together.

I now looked at my Fedora, and policy.json and registries.json are
indeed in /etc, but containers.conf is in /usr/share/. I'll move it.

Thanks for the good and interesting feedback! :-)

Regards,
Yann E. MORIN.

[0] https://github.com/containers/image/blob/main/docs/containers-policy.json.5.md#description
[1] https://github.com/containers/image/blob/main/docs/containers-registries.conf.5.md#description
[2] https://github.com/containers/common/blob/main/docs/containers.conf.5.md#description

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
