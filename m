Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E367C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 15:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27ED740522;
	Sun, 21 Aug 2022 15:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27ED740522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVfmtru4FEL9; Sun, 21 Aug 2022 15:15:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06EAB4023B;
	Sun, 21 Aug 2022 15:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06EAB4023B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED8AE1BF5AD
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 15:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEE6D408BC
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 15:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEE6D408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bhJCoc6g4pEW for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 15:14:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0474B408B7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0474B408B7
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 15:14:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b8e6:fe51:1cfa:c9c2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CB1D813F8A2;
 Sun, 21 Aug 2022 17:14:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Aug 2022 17:14:50 +0200
Date: Sun, 21 Aug 2022 17:14:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220821151450.GX2775145@scaer>
References: <20220127062504.1835450-1-christian@paral.in>
 <20220127062504.1835450-2-christian@paral.in>
 <20220127090141.7d0645f2@windsurf>
 <CA+h8R2oKO-hhmn9eOQoj4fX9ZYXBCVPqqe8knbrOq46c3s6E9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2oKO-hhmn9eOQoj4fX9ZYXBCVPqqe8knbrOq46c3s6E9w@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661094894;
 bh=9yFSxrt590CmXEFbcDNMe1cXBIjqA/WCBvgjHO6tIR0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LcPLHZ6Xbrk8bnPzwLQJ6JzpgICEycJby5zLxt98gClZXRpuPwyFNJwLZ0F1xnDeS
 F3b0YydTfEQq4x1i6vBiEx999xn9L+ypQsP4GZsZQCtFv0lc2byZL2RVfMJls6+av1
 FDlTb8DvcGF26vdCNVfc23Om+TNlNVw8XWcsxg0SRiE0Gr/VED2dggq0n8eXANrhOQ
 S37YXpnNIyDxwLcDtBFX0R2AaNi3NizJDugqEfoHM8O46CV5AIB1qfw0aS4vvVbxk/
 r19vNdhCEras5Ex8UE2KGJ+lBjvVxIylsUlZFJMgzMoJYb3S/LXBLtT4zRaU7jiupW
 LFPsAkYMoOE1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LcPLHZ6X
Subject: Re: [Buildroot] [PATCH v3 2/2] package/buildah: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

Sorry for the late review...

(I've also quoted snippets from your commit log)

On 2022-01-26 12:25 -0800, Christian Stewart via buildroot spake thusly:
> Adds both host and target packages for buildah.

I would question the need for having buildah on the target. Buildah is
advertised as: "A tool that facilitates building OCI container images."
I don't see a good reason for building images *on* the target. Please
explain in the commit log why that would make sense to have buildah on
the target.

> The buildah tree does not ship with a default policy.json file, and instead
> relies on packagers to provide one. A patch is added to create a basic barebones
> policy.json which is installed to /etc/containers/policy.json with a hook.

Don't add a patch; just add that as a file in the Buildroot tree, e.g.
package/buildah/policy.json, and install that from the package dir, i.e
$(BUILDAH_PKGDIR)/policy.json rather than from $(@D)/..../policy.json.


On 2022-01-27 12:31 -0800, Christian Stewart via buildroot spake thusly:
> On Thu, Jan 27, 2022 at 12:01 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > Considering that there are runtime dependency concerns, it would be
> > nice to have a simple test case in support/testing/.
> OK, something like "buildah pull" or so?

A runtime test should validate that the package works as expected, in a
minimal way. So, if 'buildah pull' can prove that runtime dependencies
are exercised, then that's OK, yes.

Obviously if runtiem dependencies are only required for specific cases
and only "loaded" when needed, we will not notice any missing ones. But
having an exhaustive test is not very important either; we do not want
to have to run the full project's test-suite...

[--SNIP--]
> I was a bit surprised that it, on default, tries to build the binary
> named "host-runc" as well as a Go package named "host-runc". Of
> course, this is not the name of neither the binary nor the package.
> So the host-golang infra should remove the host- prefix for the
> default BUILD_TARGETS and INSTALL_BINS.

We now have 8539378771f7 (package/pkg-golang: default to rawname to
install binaries) which is supopsed to fix that.

> This would also be fixed if those values were inherited from the target package.

I am very wary of inheriting target values for host packages. Back in
the day, we had such an inheritance in the autotools infra, but we
eventually got rid of it because it was causing too much issue, see
4bdb067e380e (infra: remove auto derivation of host dependencies).

The only variables that should be automatically inherited are those that
actualy identify the package, like the site, the version, the license,
etc.. and not the ones that /define/ it (configure and build options and
so on...)

Here, TAGS and BUILD_TARGETS are typically not something that should be
automatically inherited, because they define what is built, and the host
and target packages should not by default have the same feature set (we
tend to only have conditionals for the target one, and enable everything
in the host variant, for example).

The GOMOD you provided suspiciously looks like what the infra would have
computed already, no?

> > However, for LDFLAGS, it's a bit weird, as normally,
> > LDFLAGS are different between host and target. However here, there are
> > mostly used to pass these version-related -X options, that are in fact
> > the same between host and target. Should we have a separate variable to
> > pass those flags ? Not sure.
> They are quite common for Go packages - could call them DEFINES or
> something similar.

But with LDFLAGS, it is possible to pass flags to the actual linker,
with -extldflags something-something, so they should not be
automatically inherited.

And if we had something the DEFINES you hint at, they would again be
different by default, because the host and target builds do not follow
the same logic.

I've marked this patch, the oldest in patchwork, as changes-requested.

Regards,
Yann E. MORIN.

> The syntax overrides the value of a global variable in a package.
> 
> Best regards,
> Christian
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
